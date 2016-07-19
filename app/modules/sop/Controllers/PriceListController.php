<?php

namespace App\Modules\Sop\Controllers;

use App\PriceList;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class PriceListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pageTitle = "List of Price(s)";
        $data = PriceList::where('status','!=','inactive')->paginate(30);
        return view('sop::price_list.index',[
            'data'=>$data,
            'pageTitle'=>$pageTitle
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();

        /* Transaction Start Here */
        DB::beginTransaction();
        try {
            PriceList::create($input);
            DB::commit();
            Session::flash('message', 'Successfully added!');
        } catch (\Exception $e) {
            //If there are any exceptions, rollback the transaction`
            DB::rollback();
            Session::flash('danger', $e->getMessage());
        }

        return redirect()->route('price-list');
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pageTitle = 'View Price detail ';
        $data = PriceList::where('id', $id )->first();

        return view('sop::price_list.view', [
            'data' => $data,
            'pageTitle'=> $pageTitle
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pageTitle = "Update Price detail";
        $data = PriceList::findOrFail($id);
        return view('sop::price_list.update', [
            'data' => $data,
            'pageTitle'=> $pageTitle
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $input = $request->all();

        $model = PriceList::findOrFail($id);
        DB::beginTransaction();
        try {
            $model->update($input);
            DB::commit();
            Session::flash('message', 'Successfully added!');
        }catch (\Exception $e) {
            //If there are any exceptions, rollback the transaction`
            DB::rollback();
            Session::flash('danger', $e->getMessage());
        }
        //}
        return redirect()->route('price-list');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $model = PriceList::findOrFail($id);
        DB::beginTransaction();
        try {
            if($model->status =='active'){
                $model->status = 'inactive';
            }else{
                $model->status = 'active';
            }
            $model->save();
            DB::commit();
            Session::flash('message', "Successfully Deleted.");

        } catch(\Exception $e) {
            DB::rollback();
            Session::flash('danger',$e->getMessage());
        }
        return redirect()->route('price-list');
    }

}
