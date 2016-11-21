<?php

namespace App\Modules\Sop\Controllers;

use App\PriceList;
use App\Helpers\ImageResize;
use Illuminate\Http\Request;
use App\Http\Requests;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;

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

        $currency = DB::table('currency')->get();

        $usd = round($currency[0]->value, 2);
        $euro = round($currency[1]->value, 2);

        return view('sop::price_list.index',[
            'data'=>$data,
            'pageTitle'=>$pageTitle,
            'usd'=>$usd,
            'euro'=>$euro
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
        //print_r($input); exit();

        $image = Input::file('image');
        //print_r($image); exit('');

        if(count($image)>0){
            $file_type_required = 'png,jpeg,jpg';
            $destinationPath = 'uploads/pricelist_image/';

            $uploadfolder = 'uploads/';

            if ( !file_exists($uploadfolder) ) {
                $oldmask = umask(0);  // helpful when used in linux server
                mkdir ($uploadfolder, 0777);
            }

            if ( !file_exists($destinationPath) ) {
                $oldmask = umask(0);  // helpful when used in linux server
                mkdir ($destinationPath, 0777);
            }

            $file_name = PriceListController::image_upload($image,$file_type_required,$destinationPath);
            //print_r($file_name);exit;
            if($file_name != '') {
//                unlink($model->image);
//                unlink($model->thumbnail);
                $input['image'] = $file_name[0];
                $input['thumb_image'] = $file_name[1];
            }
            else{
                Session::flash('error', 'Some thing error in image file type! Please Try again');
                return redirect()->back();
            }
            DB::beginTransaction();
            try {
                /*$image_model->create($input);
                DB::commit();
                Session::flash('message', "Successfully added");
                #LogFileHelper::log_info('store-user-profile', 'Successfully added', ['User profile image:'.$input['image']] );*/
                PriceList::create($input);
                DB::commit();
                Session::flash('message', 'Successfully added!');

            } catch (\Exception $e) {
                //If there are any exceptions, rollback the transaction`
                DB::rollback();
                Session::flash('danger', $e->getMessage());
            }
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
    public function update(Request $request,$id)
    {
        $input = $request->all();

        $image = Input::file('image');

        if(count($image)>0){
            $file_type_required = 'png,jpeg,jpg';
            $destinationPath = 'uploads/pricelist_image/';

            $uploadfolder = 'uploads/';

            if ( !file_exists($uploadfolder) ) {
                $oldmask = umask(0);  // helpful when used in linux server
                mkdir ($uploadfolder, 0777);
            }

            if ( !file_exists($destinationPath) ) {
                $oldmask = umask(0);  // helpful when used in linux server
                mkdir ($destinationPath, 0777);
            }

            $file_name = PriceListController::image_upload($image,$file_type_required,$destinationPath);
            //print_r($file_name);exit;
            if($file_name != '') {
//                unlink($model->image);
//                unlink($model->thumbnail);
                $input['image'] = $file_name[0];
                $input['thumb_image'] = $file_name[1];
            }
            else{
                Session::flash('error', 'Some thing error in image file type! Please Try again');
                return redirect()->back();
            }
            $model = PriceList::findOrFail($id);
            DB::beginTransaction();
            try {
                /*$image_model->create($input);
                DB::commit();
                Session::flash('message', "Successfully added");
                #LogFileHelper::log_info('store-user-profile', 'Successfully added', ['User profile image:'.$input['image']] );*/
                $model->update($input);
                DB::commit();
                Session::flash('message', 'Successfully added!');

            } catch (\Exception $e) {
                //If there are any exceptions, rollback the transaction`
                DB::rollback();
                Session::flash('danger', $e->getMessage());
            }
        }
        return redirect()->route('price-list');
    }

    public function search(){

        $pageTitle = "Search Result : List of Price(s)";
        $model = new PriceList();

        if(!empty(Input::get('code'))){
            $code = Input::get('code');

            $model = $model->select('price_list.*');

            if(isset($code) && !empty($code)){
                $model = $model->where('price_list.code', 'LIKE', '%'.$code.'%');
            }
            $data = $model->paginate(30);

        }else{
            $data = PriceList::where('status','!=','inactive')->paginate(30);
        }

        return view('sop::price_list.index',[
            'data'=>$data,
            'pageTitle'=>$pageTitle
        ]);
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

    public function image_upload($image,$file_type_required,$destinationPath){

        if ($image != '') {
            $img_name = ($_FILES['image']['name']);
            $random_number = rand(111, 999);

            $thumb_name = 'thumb_50x50_'.$random_number.'_'.$img_name;

            $newWidth=200;
            $targetFile=$destinationPath.$thumb_name;
            $originalFile=$image;

            $resizedImages 	= ImageResize::resize($newWidth, $targetFile,$originalFile);

            $thumb_image_destination=$destinationPath;
            $thumb_image_name=$thumb_name;

            //$rules = array('image' => 'required|mimes:png,jpeg,jpg');
            $rules = array('image' => 'required|mimes:'.$file_type_required);
            $validator = Validator::make(array('image' => $image), $rules);
            if ($validator->passes()) {
                // Files destination
                //$destinationPath = 'uploads/slider_image/';
                // Create folders if they don't exist
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0777, true);
                }
                $image_original_name = $image->getClientOriginalName();
                $image_name = rand(11111, 99999) . $image_original_name;
                $upload_success = $image->move($destinationPath, $image_name);

                $file=array($destinationPath . $image_name, $thumb_image_destination.$thumb_image_name);

                if ($upload_success) {
                    return $file_name = $file;
                }
                else{
                    return $file_name = '';
                }
            }
            else{
                return $file_name = '';
            }
        }
    }

}
