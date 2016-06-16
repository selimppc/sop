<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 3/23/16
 * Time: 10:28 AM
 */

namespace App\Modules\Admin\Controllers;


use App\Helpers\Flat;
use App\Helpers\Lichtbakken;
use App\Http\Controllers\Controller;
#use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use App\Helpers\ChannelLetter;
use App\Helpers\AchtergrondBord;
use App\Helpers\Screenprint;
use App\Helpers\Padprint;

class BordController extends Controller
{
    public function bord_index(){

        $pageTitle = '';
        return view('admin::bord.index',['pageTitle'=>$pageTitle]);
    }



    public function channel(){

        $pageTitle = '3D Channel Letters';
        $inst_list = \Bord::getInsList();

        return view('admin::bord.channel',['pageTitle'=>$pageTitle,'inst_list'=>$inst_list]);
    }

    public function store_channel(Request $request){

        $input = $request->all();

        /*$unit_lengte_tekst = $input['unit_lengte_tekst'];*/
        $unit_letter_hoogte = $input['unit_letter_hoogte'];

        $tekst = $input['tekst'];

        //exit($unit_letter_hoogte);


        //------------------ HOOGTE And Lengte Conversion------------//
        if($unit_letter_hoogte=="m"){
            $letter_hoogte = $input['letter_hoogte'];
            $lengte_tekst = $input['lengte_tekst'];
        }
        if($unit_letter_hoogte=="cm"){
            $letter_hoogte = $input['letter_hoogte']/100;
            $lengte_tekst = $input['lengte_tekst']/100;
        }
        if($unit_letter_hoogte=="inch"){
            $letter_hoogte = $input['letter_hoogte']/39.3701;
            $lengte_tekst = $input['lengte_tekst']/39.3701;
        }

        //----------------LENGTE Conversion-------------//
        /*if($unit_lengte_tekst=="m"){
            $lengte_tekst = $input['lengte_tekst'];
        }
        if($unit_lengte_tekst=="cm"){
            $lengte_tekst = $input['lengte_tekst']/100;
        }
        if($unit_lengte_tekst=="inch"){
            $lengte_tekst = $input['lengte_tekst']/39.3701;
        }*/
        //$lengte_tekst = $input['lengte_tekst'];
        $model = $input['model'];

        $request_model = $request->get ('model');

        //print_r($request->get ('model'));exit;
        /*if(!empty($input['bracket'])){
            print_r($input['bracket']); exit();
        }
        else { exit('No data');}*/
        if(isset($input['myCheck'])) {
            $check_value = ($request->get ('myCheck')== "true")? '1' : '0';
            $installment_param['locatie'] = $input['location'];
            $installment_param['achtergrond'] = $input['background'];
            $installment_param['werkhoogte'] = $input['workheight'];
            if(!empty($input['bracket'])) {
                $installment_param['bracket'] = $input['bracket'];
            }else{
                $installment_param['bracket'] = 'Select';
            }
        }else{
            $installment_param = null;
            $check_value = null;
        }

        $data = ChannelLetter::calculation_3d($tekst, $letter_hoogte, $lengte_tekst, $model, $installment_param);
        $inst_list = \Bord::getInsList();

        return view('admin::bord.channel',['data'=>$data, 'inst_list' => $inst_list,'check_value'=>$check_value,'request_model'=>$request_model]);

    }

    public function flat(){

        $pageTitle = '3D Flat';
        $inst_list = \Bord::getInsList();

        return view('admin::bord.flat',['pageTitle'=>$pageTitle,'inst_list'=>$inst_list]);
    }

    public function store_flat(Request $request){

        $input = $request->all();

        /*$unit_lengte_tekst = $input['unit_lengte_tekst'];*/
        $unit_letter_hoogte = $input['unit_letter_hoogte'];

        //print_r($unit_letter_hoogte); exit();

        $tekst = $input['tekst'];

        // -----------------HOOGTE And Lengte Conversion---------//
        if($unit_letter_hoogte=="m"){
            $letter_hoogte = $input['letter_hoogte'];
            $lengte_tekst = $input['lengte_tekst'];
        }
        if($unit_letter_hoogte=="cm"){
            $letter_hoogte = $input['letter_hoogte']/100;
            $lengte_tekst = $input['lengte_tekst']/100;
        }
        if($unit_letter_hoogte=="inch"){
            $letter_hoogte = $input['letter_hoogte']/39.3701;
            $lengte_tekst = $input['lengte_tekst']/39.3701;
        }
        //$letter_hoogte = $input['letter_hoogte'];


        //-------------Lengte Conversion-------------//
        /*if($unit_lengte_tekst=="m"){
            $lengte_tekst = $input['lengte_tekst'];
        }
        if($unit_lengte_tekst=="cm"){
            $lengte_tekst = $input['lengte_tekst']/100;
        }
        if($unit_lengte_tekst=="inch"){
            $lengte_tekst = $input['lengte_tekst']/39.3701;
        }*/
        //$lengte_tekst = $input['lengte_tekst'];

        $materiaal = $input['materiaal'];
        $dikte = $input['dikte'];

        //$request_model = $request->get ('model');

        //print_r($request->get ('model'));exit;

        if(isset($input['myCheck'])) {
            $check_value = ($request->get ('myCheck')== "true")? '1' : '0';
            $installment_param['locatie'] = $input['location'];
            $installment_param['achtergrond'] = $input['background'];
            $installment_param['werkhoogte'] = $input['workheight'];
            //$installment_param['bracket'] = $input['bracket'];
            if(!empty($input['bracket'])) {
                $installment_param['bracket'] = $input['bracket'];
            }else{
                $installment_param['bracket'] = 'Select';
            }
        }else{
            $installment_param = null;
            $check_value = null;
        }

        $data = Flat::calculation_3d($tekst, $letter_hoogte, $lengte_tekst, $materiaal, $dikte, $installment_param);
        $inst_list = \Bord::getInsList();

        return view('admin::bord.flat',['data'=>$data, 'inst_list' => $inst_list,'check_value'=>$check_value]);

    }

    public function achtergrond(){
        $pageTitle = 'Achtergrond Bord';
        $inst_list = \Bord::getInsList();
        return view('admin::bord.achter',['pageTitle'=>$pageTitle,'inst_list'=>$inst_list]);
    }

    public function store_achtergrond(Request $request){
        $input = $request->all();

        $unit_lengte_bord = $input['unit_lengte_bord'];
        /*$unit_breedte_bord = $input['unit_breedte_bord'];*/

        $pageTitle = 'Achtergrond Bord';
        $shoort_bord = $input['shoort_bord'];

        //-----------Lengte and Breedte Conversion-----------//
        if($unit_lengte_bord=="m"){
            $lengte_bord = $input['lengte_bord'];
            $breedte_bord =$input['breedte_bord'];
        }
        if($unit_lengte_bord=="cm"){
            $lengte_bord = $input['lengte_bord']/100;
            $breedte_bord =$input['breedte_bord']/100;
        }
        if($unit_lengte_bord=="inch"){
            $lengte_bord = $input['lengte_bord']/39.3701;
            $breedte_bord =$input['breedte_bord']/39.3701;

        }
        //$lengte_bord = $input['lengte_bord'];

        //-----------Breedte Conversion----------//
        /*if($unit_breedte_bord=="m"){
            $breedte_bord =$input['breedte_bord'];
        }
        if($unit_breedte_bord=="cm"){
            $breedte_bord =$input['breedte_bord']/100;
        }
        if($unit_breedte_bord=="inch"){
            $breedte_bord =$input['breedte_bord']/39.3701;
        }*/
        //$breedte_bord =$input['breedte_bord'];

        $acm_spuiten = $input['acm_spuiten'];

        if(isset($input['myCheck'])) {
            $check_value = ($request->get ('myCheck')== "true")? '1' : '0';
            $installment_param['locatie'] = $input['location'];
            $installment_param['achtergrond'] = $input['background'];
            $installment_param['werkhoogte'] = $input['workheight'];
        }else{
            $installment_param = null;
            $check_value = null;
        }
        $data = AchtergrondBord::calculation($shoort_bord, $lengte_bord, $breedte_bord, $acm_spuiten, $installment_param);

        $inst_list = \Bord::getInsList();

        return view('admin::bord.achter',['data'=>$data, 'inst_list' => $inst_list,'check_value'=>$check_value, 'pageTitle'=>$pageTitle]);
    }

    public function lichtbakken(){

        $pageTitle = 'Lichtbakken';
        $inst_list = \Bord::getInsList();

        return view('admin::bord.licht',['pageTitle'=>$pageTitle,'inst_list'=>$inst_list]);
    }

    public function store_lichtbakken(Request $request){
        //exit('jgj');
        $input = $request->all();

        $unit_lengte = $input['unit_lengte'];
        /*$unit_breedte = $input['unit_breedte'];*/

        $materiaal_input = $input['materiaal'];
        $enkel_bubbel_input = $input['enkel_dubble'];

        //--------------Lengte and Breedte Conversion-----------//
        if($unit_lengte=="m"){
            $lengte = $input['lengte'];
            $breedte = $input['breedte'];
        }
        if($unit_lengte=="cm"){
            $lengte = $input['lengte']/100;
            $breedte = $input['breedte']/100;
        }
        if($unit_lengte=="inch"){
            $lengte = $input['lengte']/39.3701;
            $breedte = $input['breedte']/39.3701;
        }
        //$lengte = $input['lengte'];


        //---------------Breedte Conversion-------------//
        /*if($unit_breedte=="m"){
            $breedte = $input['breedte'];
        }
        if($unit_breedte=="cm"){
            $breedte = $input['breedte']/100;
        }
        if($unit_breedte=="inch"){
            $breedte = $input['breedte']/39.3701;
        }*/
        //$breedte = $input['breedte'];

        $model = $input['model'];
        $request_model = $request->get ('model');

        if(isset($input['myCheck'])) {
            $check_value = ($request->get ('myCheck')== "true")? '1' : '0';
            $installment_param['locatie'] = $input['location'];
            $installment_param['achtergrond'] = $input['background'];
            $installment_param['werkhoogte'] = $input['workheight'];
            //$installment_param['bracket'] = $input['bracket'];
            if(!empty($input['bracket'])) {
                $installment_param['bracket'] = $input['bracket'];
            }else{
                $installment_param['bracket'] = 'Select';
            }
        }else{
            $installment_param = null;
            $check_value = null;
        }

        $data = Lichtbakken::calculation_lichtbakken($materiaal_input,$enkel_bubbel_input,$lengte,$breedte,$model, $installment_param);

        //print_r($data);exit;
        $inst_list = \Bord::getInsList();

        return view('admin::bord.licht',['data'=>$data, 'inst_list' => $inst_list, 'check_value'=>$check_value,'request_model'=>$request_model]);

    }

    public function screen(){

        $pageTitle = 'Screen';
        $inst_list = \Bord::getInsList();

        return view('admin::bord.screen',['pageTitle'=>$pageTitle,'inst_list'=>$inst_list]);
    }

    public function store_screen(Request $request){
        $input = $request->all();

        $aantalshirts = $input['aantalshirts'];
        $primary = $input['primary'];
        $aantalkleuren_primary = null;
        $aantalkleuren_secondary = null;
        if(!empty($primary)) {
            if ($primary == 'y') {
                $aantalkleuren_primary = $input['aantalkleuren_primary'];
            }else{
                $aantalkleuren_primary = null;
            }
        }

        $secondary = $input['secondary'];
        if(!empty($secondary)){
            if($secondary == 'y'){
                $aantalkleuren_secondary = $input['aantalkleuren_secondary'];
            }else{
                $aantalkleuren_secondary = null;
            }
        }
        $extraprints = $input['extraprints'];

        //$model = $input['model'];
        //$request_model = $request->get ('model');

        /*if(isset($input['myCheck'])) {
            $check_value = ($request->get ('myCheck')== "true")? '1' : '0';
            $installment_param['locatie'] = $input['location'];
            $installment_param['achtergrond'] = $input['background'];
            $installment_param['werkhoogte'] = $input['workheight'];
            //$installment_param['bracket'] = $input['bracket'];
            if(!empty($input['bracket'])) {
                $installment_param['bracket'] = $input['bracket'];
            }else{
                $installment_param['bracket'] = 'Select';
            }
        }else{
            $installment_param = null;
            $check_value = null;
        }*/

        $data = Screenprint::calculation_screen($aantalshirts,$primary,$secondary,$aantalkleuren_primary,$aantalkleuren_secondary,$extraprints);
        print_r($data); exit();

        //print_r($data);exit;
        $inst_list = \Bord::getInsList();

        //return view('admin::bord.screen',['data'=>$data, 'inst_list' => $inst_list, 'check_value'=>$check_value,'request_model'=>$request_model]);
        return view('admin::bord.screen',['data'=>$data, 'inst_list' => $inst_list]);

    }

    public function pad(){

        $pageTitle = 'Pad';
        $inst_list = \Bord::getInsList();

        return view('admin::bord.pad',['pageTitle'=>$pageTitle,'inst_list'=>$inst_list]);
    }

    public function store_pad(Request $request){
        $input = $request->all();

        //$unit_lengte = $input['unit_lengte'];
        /*$unit_breedte = $input['unit_breedte'];*/

        $materiaal_input = $input['materiaal'];
        $enkel_bubbel_input = $input['enkel_dubble'];


        $lengte = $input['lengte'];
        $breedte = $input['breedte'];

        $model = $input['model'];
        $request_model = $request->get ('model');

        if(isset($input['myCheck'])) {
            $check_value = ($request->get ('myCheck')== "true")? '1' : '0';
            $installment_param['locatie'] = $input['location'];
            $installment_param['achtergrond'] = $input['background'];
            $installment_param['werkhoogte'] = $input['workheight'];
            //$installment_param['bracket'] = $input['bracket'];
            if(!empty($input['bracket'])) {
                $installment_param['bracket'] = $input['bracket'];
            }else{
                $installment_param['bracket'] = 'Select';
            }
        }else{
            $installment_param = null;
            $check_value = null;
        }

        $data = Screenprint::calculation_screen($materiaal_input,$enkel_bubbel_input,$lengte,$breedte,$model, $installment_param);

        //print_r($data);exit;
        $inst_list = \Bord::getInsList();

        return view('admin::bord.licht',['data'=>$data, 'inst_list' => $inst_list, 'check_value'=>$check_value,'request_model'=>$request_model]);

    }
}