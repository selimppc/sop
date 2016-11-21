<?php

namespace App\Modules\Sop\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

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
        return view('sop::print_cut.formulier_stickers');

    }

    public function view_formulier_t_shirts()
    {
        return view('sop::print_cut.formulier_t_shirts');

    }

    public function view_formulier_gr_formaat()
    {
        return view('sop::print_cut.formulier_gr_formaat');

    }

    public function view_materialen()
    {
        return view('sop::print_cut.materialen');

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
