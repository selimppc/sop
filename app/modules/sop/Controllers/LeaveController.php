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
        //$user = User::where('id',$user_id)->lists('username','id')->all();

        #print_r($user);exit;

        if($role_id == 'worker'){
            $data = LeaveHead::with('relUser')->where('user_id',$user_id)->orderBy('id','DESC')->paginate(30);
        }if($role_id == 'manager'){
        $data = LeaveHead::with('relUser')->where('status','approved')->orWhere('status','accepted')->orderBy('id','DESC')->paginate(30);
        }else{
            $data = LeaveHead::with('relUser')->orderBy('id','DESC')->paginate(30);
        }

        return view('sop::leave.index',[
            'data'=>$data,
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
            'user_name'=>$user_name,
            'user_email'=>$user_email,
            'date'=>date('Y-m-d H:i:s'),
            'from_date'=>$input['from_date'],
            'to_date'=>$input['to_date'],
            'reason'=>$input['reason'],
            'status'=> 'open',
        ];

        #print_r($leave_head_data); exit();

        DB::beginTransaction();
        try {
            #LogFileHelper::log_info('store-user-profile', 'Successfully added', ['User profile image:'.$input['image']] );*/
            $vh =LeaveHead::create($leave_head_data);

            $data['leave'] = LeaveHead::where('id',$vh['id'])->first();

            $role_id = session('user-role');
            if($role_id == 'worker'){

                $supervisor= User::where('role_id',4)->get();

                foreach ($supervisor as $user) {
                    Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                        $m->from('worker@gmail.com', 'SOP');
                        //$m->to($user->email,$user->username)->subject('Leave Application');
                        $m->to($user->email,$user->username)->subject('Leave Application');
                    });
                }
            }elseif($role_id == 'supervisor'){
                $hr = User::where('role_id',5)->get();

                foreach ($hr as $user) {
                    Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                        $m->from('supervisor@gmail.com', 'SOP');
                        //$m->to($user->email,$user->username)->subject('Leave Application');
                        $m->to($user->email,$user->username)->subject('Leave Application');
                    });
                }

            }else{

                $manager = User::where('role_id',6)->get();

                foreach ($manager as $user) {
                    Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                        $m->from('hr@gmail.com', 'SOP');
                        //$m->to($user->email,$user->username)->subject('Leave Application');
                        $m->to($user->email,$user->username)->subject('Leave Application');
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

                    $hr = User::where('role_id',5)->get();

                    foreach ($hr as $user) {
                        Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                            $m->from('supervisor@gmail.com', 'SOP');
                            //$m->to($user->email,$user->username)->subject('Leave Application');
                            $m->to($user->email,$user->username)->subject('Leave Application');
                        });
                    }
                }elseif($role_id == 'hr'){
                    $hr = User::where('role_id',6)->get();

                    foreach ($hr as $user) {
                        Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                            $m->from('hr@gmail.com', 'SOP');
                            //$m->to($user->email,$user->username)->subject('Leave Application');
                            $m->to($user->email,$user->username)->subject('Leave Application');
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
                    $m->to($user->relUser->email,$user->relUser->username)->subject('Leave Application Declined');
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
                Mail::send('sop::leave._notify_email', $data, function ($m) use ($user) {
                    $m->from('supervisor@gmail.com', 'SOP');
                    //$m->to($user->email,$user->username)->subject('Leave Application');
                    $m->to($user->relUser->email,$user->relUser->username)->subject('Leave Application Accepted');
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