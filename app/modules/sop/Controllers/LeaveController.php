<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 9/25/16
 * Time: 11:23 AM
 */

namespace App\Modules\Sop\Controllers;

use App\Helpers\ImageResize;
use App\LeaveDetail;
use App\LeaveHead;
use App\User;
use Illuminate\Http\Request;
use App\Http\Requests;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Mail;


class LeaveController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pageTitle = "List of Leave Applications";

        $user_id = Auth::user()->id;
        $role_id = session('user-role');
        $status = '';
        // $user = User::where('id',$user_id)->lists('username','id')->all();

        #print_r($user);exit;

        if($role_id == 'worker'){
            // $data = LeaveHead::with('relUser')->where('user_id',$user_id)->orderBy('id','DESC')->paginate(30);

            $data = DB::table('user')
            ->join('leave_head', 'leave_head.user_id', '=', 'user.id')
            ->select('user.balance', 'leave_head.*')
            ->where('user_id', $user_id)
            ->orderBy('id','DESC')
            ->get();

        }else{
            // $data = LeaveHead::with('relUser')->orderBy('id','DESC')->paginate(30);

            $data = DB::table('user')
            ->join('leave_head', 'leave_head.user_id', '=', 'user.id')
            ->select('user.balance', 'leave_head.*')
            ->orderBy('id','DESC')
            ->get();
        }

        // get saldo of the logged user
        $balance = DB::table('user')
            ->select('balance')
            ->where('id', $user_id)
            ->get();

        // 1. bereken het verschil tussen de employed_date en deze maand
        $employed = DB::table('user')
            ->select('employed')
            ->where('id', $user_id)
            ->first();
        $date_employed = '';
        foreach ($employed as $value) {
            $date_employed = $employed->employed;
        }
        $interval = date_create(date($date_employed))->diff(date_create(date('Y-m-d')));
        
        // berekenen van het verschil
        $verschil = ($interval->y * 12) + $interval->m;
        
        // aantal verlofdagen genomen
        $count_leaves = DB::table('leave_head')
            ->select('from_date', 'to_date', 'type')
            ->where('user_id', $user_id)
            ->where('status', 'accepted')
            ->get();

        // bereken hoeveel verlofdagen de gebruiker heeft genomen
        $total_verlofdagen = "";
        $halve_dagen_berekenen = "";
        $normale_dagen_berekenen = "";
        foreach ($count_leaves as $value) {
            // echo "From Date: " . $value->from_date . '<br>';
            // echo "To Date: " . $value->to_date . '<br>';
            // TODO: Halve dag berekenen
            if ($value->type == 'halve dag') {
                $halve_dagen = (date_create($value->from_date)->diff(date_create($value->to_date))->d) + 1;
                $halve_dagen_berekenen = $halve_dagen * 0.5;
                $normale_dagen_berekenen = '';
                // print_r($halve_dagen_berekenen);
            }

            if ($value->type != 'halve dag') {
                $normale_dagen = date_create($value->from_date)->diff(date_create($value->to_date))->d;
                $normale_dagen_berekenen = $normale_dagen + 1;
                // print_r($normale_dagen_berekenen);
            }
            // print_r('Totale verlofdagen: ' . $total_verlofdagen . ' Normale verlofdagen: ' .$normale_dagen_berekenen . ' Halve verlofdagen: ' .  $halve_dagen_berekenen . '<br>');
            $total_verlofdagen = $total_verlofdagen + $normale_dagen_berekenen + $halve_dagen_berekenen;
        }

        $saldo = $verschil - $total_verlofdagen;

        // 2. update balance van de gebruiker
        $update_balance = DB::table('user')
            ->where('id', $user_id)
            ->update(['balance' => $saldo]);

        return view('sop::leave.index',[
            'data'=>$data,
            'balance'=>$balance,
            'role_id'=>$role_id,
            'status'=>$status,
            'pageTitle'=>$pageTitle
        ]);
    }


    public function search(){

        $pageTitle = "Search Result : List of Leave Applications";
        $data = new LeaveHead();
        $data = $data->with('relUser');

        $status = Input::get('status');
        $name = Input::get('name');
        $user_id = Auth::user()->id;
        $role_id = session('user-role');
        #print_r($status);exit("ok");

        if(!empty($status)) {//echo "ok1";
            if ($role_id == 'worker') {
                $data = $data->where('user_id', $user_id)->where('status', $status);
            }else{
                $data = $data->where('status', $status);
            }
//            print_r($data);exit('sadasd');
        }
        if(!empty($name))
        {//echo "ok2";
            $data = $data->where('user_name','LIKE', '%'.$name.'%');
        }
        if(empty($status) && empty($name)){//echo "ok3";
            if($role_id == 'worker'){
                $data = $data->where('user_id',$user_id);
            }elseif($role_id == 'manager'){
                $data = $data->where('status','approved')->orWhere('status','accepted');
            }
        }

        $data = $data->orderBy('id','DESC')->paginate(30);
        //exit;
       # print_r($data);

        return view('sop::leave.index',[
            'data'=>$data,
            'status'=>$status,
            'role_id'=>$role_id,
            'pageTitle'=>$pageTitle
        ]);
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $user_id = Auth::user()->id;

        $user = User::where('id',$user_id)->first();
        $user_name = $user->username;
        $user_email = $user->email;

        $leave_head_data = [
            'user_id'=>$user_id,
            'type'=>$input['type'],
            'user_name'=>$user_name,
            'user_email'=>$user_email,
            'date'=>date('Y-m-d H:i:s'),
            'from_date'=>$input['from_date'],
            'to_date'=>$input['to_date'],
            'reason'=>$input['reason'],
            'status'=> 'open',
        ];

        // print_r($leave_head_data); exit();

        DB::beginTransaction();
        try {
            // LogFileHelper::log_info('store-user-profile', 'Successfully added', ['User profile image:'.$input['image']] );
            $vh =LeaveHead::create($leave_head_data);

            $data['leave'] = LeaveHead::where('id',$vh['id'])->first();

            $role_id = session('user-role');
            if($role_id == 'worker'){

                $supervisor= User::where('role_id',4)->get();
                
                foreach ($supervisor as $user) {
                    Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                        
                        // get worker name
                        $worker_id = Auth::user()->id;
                        $worker = User::where('id',$worker_id)->first();
                        $worker_name = $worker->username;

                        $m->from('worker@gmail.com', 'SOP');
                        //$m->to($user->email,$user->username)->subject('Leave Application');
                        $m->to($user->email,$user->username)->subject('Verlof aanvraag: ' . $worker_name);
                    });
                }
            }elseif($role_id == 'supervisor'){
                $manager = User::where('role_id',6)->get();

                foreach ($manager as $user) {
                    Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {

                        // get worker name
                        $worker_id = Auth::user()->id;
                        $worker = User::where('id',$worker_id)->first();
                        $worker_name = $worker->username;

                        $m->from('hr@gmail.com', 'SOP');
                        //$m->to($user->email,$user->username)->subject('Leave Application');
                        $m->to($user->email,$user->username)->subject('Verlof aanvraag: ' . $worker_name);
                    });
                }
            }


            DB::commit();
            Session::flash('message', 'Successfully Saved!');

        } catch (\Exception $e) {
            //If there are any exceptions, rollback the transaction`
            DB::rollback();
            Session::flash('danger', $e->getMessage());
        }

        return redirect()->route('leave-application');

    }

    public function leave_cancel($id)
    {
        // print_r($id);
        DB::table('leave_head')
            ->where('id', $id)
            ->update(['status' => 'canceled']);
        return redirect()->route('leave-application');
    }

    public function leave_approve($id)
    {
        $user_id = Auth::user()->id;
        $role_id = session('user-role');

        $model = LeaveHead::findOrFail($id);
        DB::beginTransaction();
        try {
                $model->status = 'approved';
                $model->save();

                $leave_detail_data = [
                    'leave_head_id'=>$model->id,
                    'user_id'=>$user_id,
                    'date'=>date('Y-m-d H:i:s'),
                    'note'=>$model->reason,
                    'status'=> $model->status,
                ];

                $vh = LeaveDetail::create($leave_detail_data);


                $data['leave'] = LeaveHead::with('relUser')->where('id',$model->id)->first();
                $data['leave_detail'] = LeaveDetail::with('relUser')->where('id',$vh['id'])->first();

                if($role_id == 'supervisor'){

                    $manager = User::where('role_id',6)->get();

                    foreach ($manager as $user) {

                        $a = $id;
                        Mail::send('sop::leave._notify_email', $data, function ($m) use ($user, $a) {

                            // get worker name
                            $model = LeaveHead::findOrFail($a);
                            $worker = User::where('id',$model->user_id)->first();
                            $worker_name = $worker->username;

                            $m->from('hr@gmail.com', 'SOP');
                            //$m->to($user->email,$user->username)->subject('Leave Application');
                            $m->to($user->email,$user->username)->subject('Verlof aanvraag ' . $worker_name . ' goedgekeurd');
                        });
                    }
                }

                DB::commit();
                Session::flash('message', "Successfully Approved.");

        } catch(\Exception $e) {
            DB::rollback();
            Session::flash('danger',$e->getMessage());
        }
        return redirect()->route('leave-application');
    }

    public function leave_decline($id)
    {
        $user_id = Auth::user()->id;
        $role_id = session('user-role');


        $model = LeaveHead::findOrFail($id);
        DB::beginTransaction();
        try {
            $model->status = 'decline';

            $model->save();

            $leave_detail_data = [
                'leave_head_id'=>$model->id,
                'user_id'=>$user_id,
                'date'=>date('Y-m-d H:i:s'),
                'note'=>$model->reason,
                'status'=> $model->status,
            ];

            $vh = LeaveDetail::create($leave_detail_data);

            $data['leave'] = LeaveHead::with('relUser')->where('id',$model->id)->first();
            $data['leave_detail'] = LeaveDetail::with('relUser')->where('id',$vh['id'])->first();

            $users = LeaveHead::with('relUser')->where('id',$id)->get();

            foreach ($users as $user) {
                Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                    $m->from('supervisor@gmail.com', 'SOP');
                    //$m->to($user->email,$user->username)->subject('Leave Application');
                    $m->to($user->relUser->email,$user->relUser->username)->subject('Verlof afgekeurd');
                });
            }

            DB::commit();
            Session::flash('message', "Successfully Declined.");

        } catch(\Exception $e) {
            DB::rollback();
            Session::flash('danger',$e->getMessage());
        }
        return redirect()->route('leave-application');
    }

    public function leave_accept($id)
    {
        $user_id = Auth::user()->id;
        $role_id = session('user-role');


        $model = LeaveHead::findOrFail($id);
        DB::beginTransaction();
        try {
            $model->status = 'accepted';

            $model->save();

            $leave_detail_data = [
                'leave_head_id'=>$model->id,
                'user_id'=>$user_id,
                'date'=>date('Y-m-d H:i:s'),
                'note'=>$model->reason,
                'status'=> $model->status,
            ];

            $vh = LeaveDetail::create($leave_detail_data);

            $data['leave'] = LeaveHead::with('relUser')->where('id',$model->id)->first();
            $data['leave_detail'] = LeaveDetail::with('relUser')->where('id',$vh['id'])->first();

            $users = LeaveHead::with('relUser')->where('id',$id)->get();

            foreach ($users as $user) {
                $a = $id;
                Mail::send('sop::leave._notify_email', $data, function ($m) use ($user, $a) {

                    // get worker name
                    $model = LeaveHead::findOrFail($a);
                    $worker = User::where('id',$model->user_id)->first();
                    $worker_name = $worker->username;
                    $m->from('supervisor@gmail.com', 'SOP');
                    //$m->to($user->email,$user->username)->subject('Leave Application');
                    $m->to($user->relUser->email,$user->relUser->username)->subject('Verlof aanvraag ' . $worker_name . ' geaccepteerd');
                });
            }

            $supervisor= User::where('role_id',4)->get();

            foreach ($supervisor as $user) {
                $a = $id;
                Mail::send('sop::leave._notify_email', $data, function ($m) use ($user, $a) {

                    // get worker name
                    $model = LeaveHead::findOrFail($a);
                    $worker = User::where('id',$model->user_id)->first();
                    $worker_name = $worker->username;
                    $m->from('worker@gmail.com', 'SOP');
                    //$m->to($user->email,$user->username)->subject('Leave Application');
                    $m->to($user->email,$user->username)->subject('Verlof aanvraag ' . $worker_name . ' geaccepteerd');
                });
            }
            $manager = User::where('role_id',6)->get();

            foreach ($manager as $user) {
                $a = $id;
                Mail::send('sop::leave._notify_email', $data, function ($m) use ($user, $a) {

                    // get worker name
                    $model = LeaveHead::findOrFail($a);
                    $worker = User::where('id',$model->user_id)->first();
                    $worker_name = $worker->username;
                    $m->from('hr@gmail.com', 'SOP');
                    //$m->to($user->email,$user->username)->subject('Leave Application');
                    $m->to($user->email,$user->username)->subject('Verlof aanvraag ' . $worker_name . ' geaccepteerd');
                });
            }
            $hr = User::where('role_id',5)->get();

            foreach ($hr as $user) {
                $a = $id;
                Mail::send('sop::leave._notify_email', $data, function ($m) use ($user, $a) {

                    // get worker name
                    $model = LeaveHead::findOrFail($a);
                    $worker = User::where('id',$model->user_id)->first();
                    $worker_name = $worker->username;
                    $m->from('hr@gmail.com', 'SOP');
                    //$m->to($user->email,$user->username)->subject('Leave Application');
                    $m->to($user->email,$user->username)->subject('Verlof aanvraag ' . $worker_name . ' geaccepteerd');
                });
            }

            DB::commit();
            Session::flash('message', "Successfully Accepted.");

        } catch(\Exception $e) {
            DB::rollback();
            Session::flash('danger',$e->getMessage());
        }
        return redirect()->route('leave-application');
    }

}