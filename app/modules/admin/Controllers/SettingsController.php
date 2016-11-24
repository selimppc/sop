<?php

//namespace App\Http\Controllers;
namespace App\Modules\Admin\Controllers;

use App\Settings;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Session;
use Input;
use Illuminate\Support\Facades\Auth;

class SettingsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function settings()
    {
        //print_r(Auth::user());exit();
        $pageTitle = " Settings :: ";
        if(Auth::user()->role_id == 1){
            $data = Settings::orderBy('id','DESC')->get();
        }else{
            $data = Settings::where('user_type','user')->get();
        }
        return view('admin::settings.index', ['data' => $data, 'pageTitle'=> $pageTitle]);
    }


    public function store(Request $request)
    {
        print_r($request->all());exit();
        $inputs = $request->all();
        if(Auth::user()->role_id == 1){
            Settings::create($inputs);
            return redirect()->back();
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function show($id)
    {
        $data = Settings::findOrFail($id);
        return view('admin::settings.view', ['data' => $data]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Settings::findOrFail($id);
        //print_r($data->id);exit();
        return view('admin::settings.update', ['data' => $data]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //exit('update');exit();
        $model = Settings::findOrFail($id);
        $input = $request->all();

        $model->title_full = $input['title_full'];
        $model->title = $input['title'];
        $model->status = $input['status'];
        $model->user_type = $input['user_type'];

        /*$model->status = strtolower($request->status);
        $model->user_type = $request->user_type;*/

        /* Transaction Start Here */
        DB::beginTransaction();
        try {
            $model->save();
            // Set session for central Settings
            Session::forget('Settings');
            #$central_settings = Settings::all();
            #Session::put('central_settings', $central_settings);

            //commit the changes
            DB::commit();
            Session::flash('flash_message', 'Successfully Edited!');
        }catch (\Exception $e) {
            //If there are any exceptions, rollback the transaction`
            DB::rollback();
            Session::flash('flash_message_error', "Invalid Request" );
        }

        return redirect()->back();
    }

    public function destroy($id)
    {
        //
    }
}
