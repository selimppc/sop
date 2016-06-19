<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 4/7/16
 * Time: 10:52 AM
 */

namespace App\Helpers;
use DB;


class Padprint
{
    public  static function calculation_pad($aantalitems,$primary,$aantalkleuren_primary,$secondary,$aantalkleuren_secondary)
    {
        //======= variables ***//
        $r9 = $aantalitems; // Order Quantity
        $r12 = $primary; // Primary Print Location  -("y" for "Yes", blank for "No")
        $r13 = $secondary; // Secondary Print Location - ("y" for "Yes", blank for "No")
        $r14 = $aantalkleuren_primary; // Primary Location - Total Print Colors (used with D12)
        $r15 = $aantalkleuren_secondary; // Secondary Location - Total Print Colors (used with D13)


        //======= Variables From database Config ***//
        $r16 = DB::table('settings')->where('title','r16_pad')->pluck('status');//15; // Screen Preparation charges (per screen)
        $r17 = DB::table('settings')->where('title','r17_pad')->pluck('status'); //0.22; // Ink Charge/per color/per shirt-could reserve for PITA
        $r18 = DB::table('settings')->where('title','r18_pad')->pluck('status'); //0.30; // Primary Base Print Charges (Materials+Labor+Profit)
        $r19 = DB::table('settings')->where('title','r19_pad')->pluck('status'); //0.2; // Secondary Base Print Charges (Labor+Profit)
        $r22 = DB::table('settings')->where('title','r22_pad')->pluck('status'); //0.00; // Artwork - Format is xxxx.xx
        $r28 = DB::table('settings')->where('title','r28_pad')->pluck('status'); //0.08; // Sales Tax Rate - (6 percent Sales Tax is .0600)
        $r11 = DB::table('settings')->where('title','r11_pad')->pluck('status'); //1.5; // Shirt Markup Percent (1.500 is 50% markup)
        $r10 = DB::table('settings')->where('title','r10_pad')->pluck('status'); //0; //Shirt Base (raw) Cost/each (******* May be come from user Input)
        //print_r($r10); exit();


        //======= Currency From Database ***//
        //$usd_to_srd = 7;
        $usd_to_srd = DB::table('currency')->where('title', 'US$')->pluck('value');
        //$euro_to_srd = 7.8;
        $euro_to_srd = DB::table('currency')->where('title', 'Euro')->pluck('value');

        //======= Check Quantity ***//
        $g19 = 0;
        if($r9>0 && $r9<100){
            $g19 = 1.3;
        }
        if($r9>99 && $r9<250){
            $g19 = 1.00;
        }
        if($r9>249 && $r9<500){
            $g19 = 0.90;
        }
        if($r9>499 && $r9<1000){
            $g19 = 0.80;
        }
        if($r9>1000){
            $g19 = 0.70;
        }

        //======= Main Caculation ***//
        $g20 = 0; // Total - (All Materials, Labor and Profit)
        $g23 = 0; // Extension of Screen Preparation Charges

        $g11 = $r10 * $r11;

        if($r12 == 'y')
        {
            if($r13 == 'y')
            {
                $g20 = ($r9*($g11+(1*$r18)+(1*$r19)+($r14*$r17)+($r15*$r17)))*$g19;
            }
            else
            {
                $g20 = ($r9*($g11+(1*$r18)+($r14*$r17)))*$g19;
            }
        }


        $g21 = $g20/$r9;

        $g22 = $r22;

        if($r12 == 'y')
        {
            if($r13 == 'y')
            {
                $g23 = ($r14*$r16)+($r15*$r16);
            }
            else
            {
                $g23 = ($r14*$r16);
            }
        }

        $g24 = $g20+$g22+$g23;

        $g9 = $r9;

        $g25 = $g24/$g9;

        $g27 = $g25 * $usd_to_srd;

        $g26 = $g27/$euro_to_srd;

        $g29 = $g24*$r28;

        $g30 = $g24+$g29;

        $g31 =$g30/$g9;

        $g33 = $g31 * $usd_to_srd;

        $g32 = $g33/$euro_to_srd;

        //return $total = 'G20 = '.$g20.'<br>G21 = '.$g21.'<br>G22 = '.$g22.'<br>G23 = '.$g23.'<br>G24 = '.$g24.'<br>G25 = '.$g25.'<br>G26 = '.$g26.'<br>G27 = '.$g27.'<br><br>G29 = '.$g29.'<br>G30 = '.$g30.'<br>G31 = '.$g31.'<br>G32 = '.$g32.'<br>G33 = '.$g33;

        return $data_arr = [
                    'G20' => $g20,
                    'G21' => $g21,
                    'G22' => $g22,
                    'G23' => $g23,
                    'G24' => $g24,
                    'G25' => $g25,
                    'G26' => $g26,
                    'G27' => $g27,
                    'G29' => $g29,
                    'G30' => $g30,
                    'G31' => $g31,
                    'G32' => $g32,
                    'G33' => $g33
                ];

    }
        /**
         * @param $n
         * @param int $x
         * @return float
         */
        public static function roundUpToAny($n,$x=5) {
            return (ceil($n)%$x === 0) ? ceil($n) : round(($n+$x/2)/$x)*$x;
        }



        /**
         * @param $number
         * @param int $denominator : 1 for ceil, 2 for .5, 3 for .333, 4 for .25, .5, .75
         * @return float
         */
        public static function floorToFraction($number, $denominator = 1)
        {
            $x = $number * $denominator;
            $x = ceil($x);
            $x = $x / $denominator;
            return $x;
        }

}