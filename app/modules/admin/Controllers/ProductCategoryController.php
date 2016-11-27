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
use App\ProductCategory;

class ProductCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        #print_r(Auth::user());exit();
        $pageTitle = " Product Category :: ";
        #if(Auth::user()->role_id == 1){
            $data = ProductCategory::orderBy('id','DESC')->get();
        #}else{
            #$data = ProductCategory::where('user_type','user')->get();
        #}
        #print_r($data);exit();
        return view('admin::product_category.index', ['data' => $data, 'pageTitle'=> $pageTitle]);
    }


    public function store(Request $request)
    {
        #print_r($request->all());exit();
        $inputs = $request->all();
        DB::beginTransaction();
        try{
            if(Auth::user()->role_id == 1){
                ProductCategory::create($inputs);
            }
            DB::commit();
            Session::flash('message', 'Successfully added!');
        }catch(\Exception $e){
            DB::rollback();
            Session::flash('danger', $e->getMessage());
        }
        return redirect()->back();

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function show($id)
    {
        $data = ProductCategory::findOrFail($id);
        return view('admin::product_category.view', ['data' => $data]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = ProductCategory::findOrFail($id);
        //print_r($data->id);exit();
        return view('admin::product_category.update', ['data' => $data]);
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
        $model = ProductCategory::findOrFail($id);
        $input = $request->all();

        $model->title = $input['title'];
        $model->description = $input['description'];
        $model->status = $input['status'];

        /* Transaction Start Here */
        DB::beginTransaction();
        try {
            $model->save();
            Session::forget('Product Category');
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
