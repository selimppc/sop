<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 4/7/16
 * Time: 10:52 AM
 */

namespace App\Helpers;
use DB;


class Screenprint
{
    public  static function calculation_screen($aantalshirts,$primary,$secondary,$aantalkleuren_primary,$aantalkleuren_secondary,$extraprints)
    {

        //========== Variables ***//
        $r9 = $aantalshirts; // Order Quantity
        $e20 = 0;
        $e23 = 0.00;
        $r12 = $primary;
        $r13 = $secondary;
        $r14 = $aantalkleuren_primary;
        $r15 = $aantalkleuren_secondary;



        //========== Variables From database Config ***//
        $r11 = DB::table('settings')->where('title','r11_screen')->pluck('status'); //1.2;     // Shirt Markup Percent (1.500 is 50% markup)
        $r16 = DB::table('settings')->where('title','r16_screen')->pluck('status'); //15;      // Screen Preparation charges (per screen)
        $r17 = DB::table('settings')->where('title','r17_screen')->pluck('status'); //0.10;    // Ink Charge/per color/per shirt-could reserve for PITA
        $r18 = DB::table('settings')->where('title','r18_screen')->pluck('status'); //1.10;    // Primary Base Print Charges (Materials+Labor+Profit)
        $r19 = DB::table('settings')->where('title','r19_screen')->pluck('status'); //0.60;    // Secondary Base Print Charges (Labor+Profit)

        $r22 = DB::table('settings')->where('title','r22_screen')->pluck('status'); //0.00; // Artwork - Format is xxxx.xx (******* May be come From User input )
        $r28 = DB::table('settings')->where('title','r28_screen')->pluck('status'); //0.08; // Sales Tax Rate - (6 percent Sales Tax is .0600) (******* May be come From User input )
        $r10 = DB::table('settings')->where('title','r10_screen')->pluck('status'); //0.0; // Shirt Base (raw) Cost/each (******* Will come from user input)
        //print_r($r10); exit();



        //========== Currency From Database ***//
        //$usd_to_srd = 7;
        $usd_to_srd = DB::table('currency')->where('title', 'US$')->pluck('value');
        //$euro_to_srd = 7.8;
        $euro_to_srd = DB::table('currency')->where('title', 'Euro')->pluck('value');



        //========== Check Quantity ***//
        $e19 = 0;
        if($r9>0 && $r9<20){
            $e19 = 1.3;
        }
        if($r9>19 && $r9<50){
            $e19 = 1.2;
        }
        if($r9>49 && $r9<100){
            $e19 = 1.1;
        }
        if($r9>99 && $r9<250){
            $e19 = 1.0;
        }
        if($r9>249 && $r9<500){
            $e19 = 0.9;
        }
        if($r9>499 && $r9<1000){
            $e19 = 0.8;
        }
        if($r9>999 ){
            $e19 = 0.7;
        }

        //========== Main Calculation ***//
        $e11 = $r10 * $r11;
        if($r12=='y')
        {
            if($r13=='y')
            {
                $e20 = ($r9*($e11+(1*$r18)+(1*$r19)+($r14*$r17)+($r15*$r17)))*$e19;
                $e23 = ($r14*$r16)+($r15*$r16);
            }else{
                $e20 = ($r9*($e11+(1*$r18)+($r14*$r17)))*$e19;
                $e23 = ($r14*$r16);
            }
        }

        $R21 = $e20/$r9;

        $E24 = $e20+$r22+$e23;

        $E25 = $E24/$r9;

        $E27 = $E25 * $usd_to_srd;

        $E26 = $E27/$euro_to_srd;

        $E29 = $E24 * $r28;

        $E30 = $E24 + $E29;

        $E31 = $E30/$r9;

        $E33 = $E31 * $usd_to_srd;

        $E32 = $E33/$euro_to_srd;

        //return $total = $r9.'/'.$r12.'/-'.$aantalkleuren_primary.'/'.$r13.'/-'.$aantalkleuren_secondary.'/'.$extraprints.'/'.$e19.'/E20='.$e20;
        //return $total = 'E19 = '.$e19.'<br>E20 = '.$e20.'<br>E21 = '.$R21.'<br>E22 = '.$r22.'<br>E23 = '.$E23.'<br>E24 = '.$E24.'<br>E25 = $'.$E25.'<br>E26 = '.$E26.'<br>E27 = '.$E27.'<br><br>E29 = '.$E29.'<br>E30 = '.$E30.'<br>E31 = '.$E31.'<br>E32 = '.$E32.'<br>E33 = '.$E33;
        //return $total = $e19.'/'.$e20.'/'.$R21.'/'.$r22.'/'.$E23.'/'.$E24.'/'.$E25.'/'.$E26.'/'.$E27.'/'.$E29.'/'.$E30.'/'.$E31.'/'.$E32.'/'.$E33;
        return $data_arr =
            [
                'E19'=> $e19,
                'E20'=> $e20,
                'E21'=> $R21,
                'E22'=> $r22,
                'E23'=> $e23,
                'E24'=> $E24,
                'E25'=> $E25,
                'E26'=> $E26,
                'E27'=> $E27,
                'E28'=> $r28,
                'E29'=> $E29,
                'E30'=> $E30,
                'E31'=> $E31,
                'E32'=> $E32,
                'E33'=> $E33
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