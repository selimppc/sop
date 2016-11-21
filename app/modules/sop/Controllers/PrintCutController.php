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

class PrintCutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('sop::print_cut.index');
    }

    public function view_formulier_stickers()
    {

        $currency = DB::table('currency')->get();

        $usd = $currency[0]->value;
        $euro = $currency[1]->value;

        return view('sop::print_cut.formulier_stickers', [
            'usd'=>$usd,
            'euro'=>$euro
        ]);

    }

    public function view_formulier_t_shirts()
    {
        $currency = DB::table('currency')->get();

        $usd = round($currency[0]->value, 2);
        $euro = round($currency[1]->value, 2);

        return view('sop::print_cut.formulier_t_shirts',[
            'usd'=>$usd,
            'euro'=>$euro
        ]);
        // return view('sop::print_cut.formulier_t_shirts');

    }

    public function view_formulier_gr_formaat()
    {
        $currency = DB::table('currency')->get();

        $usd = round($currency[0]->value, 2);
        $euro = round($currency[1]->value, 2);

        return view('sop::print_cut.formulier_gr_formaat',[
            'usd'=>$usd,
            'euro'=>$euro
        ]);
    }

    public function view_materialen()
    {
        $currency = DB::table('currency')->get();

        $usd = $currency[0]->value;
        $euro = $currency[1]->value;
        
        return view('sop::print_cut.materialen', [
            'usd'=>$usd,
            'euro'=>$euro
        ]);

    }

    public function view_formulier_laser_cards()
    {
        return view('sop::print_cut.formulier_laser_cards');

    }

    public function view_formulier_stempels()
    {
        return view('sop::print_cut.formulier_stempels');

    }
}
