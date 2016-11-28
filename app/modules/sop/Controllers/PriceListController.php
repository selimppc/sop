<?php

namespace App\Modules\Sop\Controllers;

use App\PriceList;
use App\Helpers\ImageResize;
use App\ProductCategory;
use App\ProductImage;
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
        $data = PriceList::with('relProductImage')->where('status','!=','inactive')->paginate(30);
        #print_r($data[8]->relProductImage[0]['image']);exit();

        $category = ProductCategory::where('status','active')->orderBy('title','ASC')->get();
        $cat_options_arr = array();
        foreach($category as $category_options){
            $cat_options_arr[$category_options->id]= $category_options->title;
        }
        #print_r($cat_options_arr);exit();
        // How to show laravel drop down select menu with data array from database

        $currency = DB::table('currency')->get();

        $usd = round($currency[0]->value, 2);
        $euro = round($currency[1]->value, 2);

        return view('sop::price_list.index',[
            'data'=>$data,
            'pageTitle'=>$pageTitle,
            'usd'=>$usd,
            'euro'=>$euro,
            'cat_options'=>$cat_options_arr
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
        #print_r($input); exit();

        $image_input_array = Input::file('image');
        #print_r($image_array); exit('');

        if(count($image_input_array)>0){
            $image_array = array();
            for($i=0; $i<count($image_input_array); $i++){
                //$img_name = ($_FILES['image']['name']);
                $img_name = $_FILES['image']['name'][$i];
                $image = Input::file('image')[$i];
                #print_r($image);exit();
                $file_type_required = 'png,jpeg,jpg';
                $destinationPath = 'uploads/product_image/';
                $uploadfolder = 'uploads/';

                if ( !file_exists($uploadfolder) ) {
                    $oldmask = umask(0);  // helpful when used in linux server
                    mkdir ($uploadfolder, 0777);
                }

                if ( !file_exists($destinationPath) ) {
                    $oldmask = umask(0);  // helpful when used in linux server
                    mkdir ($destinationPath, 0777);
                }

                $file_name = PriceListController::image_upload($image,$file_type_required,$destinationPath,$img_name);

                if($file_name != '') {
                    $image_array [] = array(
                        'image'=>$file_name[0],
                        'thumbnail'=>$file_name[1],
                    );
                }
            }

            $input_arr = [
                'code'=>$input['code'],
                'description'=>$input['description'],
                'unit'=>$input['unit'],
                'price'=>$input['price'],
                'status'=>$input['status'],
                'product_category_id'=>$input['product_category_id'],
            ];
            #print_r($input_arr);exit();
            DB::beginTransaction();
            try {
                /*$image_model->create($input);
                DB::commit();
                Session::flash('message', "Successfully added");
                #LogFileHelper::log_info('store-user-profile', 'Successfully added', ['User profile image:'.$input['image']] );*/
                $create_price_list = PriceList::create($input_arr);
                if($create_price_list){
                    foreach($image_array as $image_row){
                        $image_create = [
                            'price_list_id' => $create_price_list['id'],
                            'image'=>isset($image_row['image'])?$image_row['image']:null,
                            'thumbnail'=>isset($image_row['thumbnail'])?$image_row['thumbnail']:null,
                            'status'=>'active'
                        ];
                        ProductImage::create($image_create);
                    }
                }
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
        $data = PriceList::with('relProductImage')->where('id', $id )->first();

        #print_r($data);exit();

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
        $data = PriceList::with('relProductImage')->findOrFail($id);

        $category = ProductCategory::where('status','active')->orderBy('title','ASC')->get();
        $cat_options_arr = array();
        foreach($category as $category_options){
            $cat_options_arr[$category_options->id]= $category_options->title;
        }

        #print_r($cat_options_arr);exit();

        return view('sop::price_list.update', [
            'data' => $data,
            'pageTitle'=> $pageTitle,
            'cat_options'=> $cat_options_arr,

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

        $image_input_array = Input::file('image');
        #print_r($image_input_array[0]);exit();
        #if(!empty($image_input_array[0])){ exit('Not null');}else{ exit('Null');}

        if(!empty($image_input_array[0])) {

            for ($i = 0; $i < count($image_input_array); $i++) {
                //$img_name = ($_FILES['image']['name']);
                $img_name = $_FILES['image']['name'][$i];
                $image = Input::file('image')[$i];
                #print_r($image);exit();
                $file_type_required = 'png,jpeg,jpg';
                $destinationPath = 'uploads/product_image/';
                $uploadfolder = 'uploads/';

                if (!file_exists($uploadfolder)) {
                    $oldmask = umask(0);  // helpful when used in linux server
                    mkdir($uploadfolder, 0777);
                }

                if (!file_exists($destinationPath)) {
                    $oldmask = umask(0);  // helpful when used in linux server
                    mkdir($destinationPath, 0777);
                }

                $file_name = PriceListController::image_upload($image, $file_type_required, $destinationPath, $img_name);

                if ($file_name != '') {
                    $image_array [] = array(
                        'image' => $file_name[0],
                        'thumbnail' => $file_name[1],
                    );
                }
            }
        }

            $model = PriceList::findOrFail($id);
            $model->code = $input['code'];
            $model->description = $input['description'];
            $model->unit = $input['unit'];
            $model->price = $input['price'];
            $model->status = $input['status'];
            $model->product_category_id = $input['product_category_id'];
            #DB::beginTransaction();
            try {
                $update_price_list = $model->save();
                #print_r($update_price_list);exit();

                if($update_price_list){
                    #print_r(count($image_input_array));exit();
                    if(!empty($image_input_array[0])){
                        if($id){
                            $model_productImage = ProductImage::where('price_list_id',$id)->get();
                            #print_r($model_productImage);exit();
                            foreach($model_productImage as $imgrow)
                            {
                                if (file_exists($imgrow->image)) {
                                    unlink(public_path()."/".$imgrow->image);
                                }
                                if (file_exists($imgrow->thumbnail)) {
                                    unlink(public_path()."/".$imgrow->thumbnail);
                                }
                            }
                            ProductImage::where('price_list_id',$id)->delete();
                        }

                        if(isset($image_array)){
                            foreach($image_array as $image_row){
                                $image_create = [
                                    'price_list_id' => $id,
                                    'image'=>isset($image_row['image'])?$image_row['image']:null,
                                    'thumbnail'=>isset($image_row['thumbnail'])?$image_row['thumbnail']:null,
                                    'status'=>'active'
                                ];
                                #if($update_price_list['id']){
                                if($id){
                                    ProductImage::create($image_create);
                                }
                            }
                        }

                    }
                }

                //DB::commit();
                Session::flash('message', 'Successfully added!');

            } catch (\Exception $e) {
                //If there are any exceptions, rollback the transaction`
                #DB::rollback();
                Session::flash('danger', $e->getMessage());
            }
        //}
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

    public function image_upload($image,$file_type_required,$destinationPath,$img_name){

        if ($image != '') {
            #$img_name = ($_FILES['image']['name']);
            #print_r($img_name);exit();
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
