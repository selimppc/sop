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

        /**
         * Retrieve Data to derive the value of $k46 and $k47
         */
        $r38 = DB::table('settings')->where('title','r38_screen')->pluck('status'); //500       //Primary Prints/Month
        $r39 = DB::table('settings')->where('title','r39_screen')->pluck('status'); //2500      //Secondary Prints/Month
        $r40 = DB::table('settings')->where('title','r40_screen')->pluck('status'); //1000      //Monthly Rent
        $r41 = DB::table('settings')->where('title','r41_screen')->pluck('status'); //300       //Monthly Electric
        $r42 = DB::table('settings')->where('title','r42_screen')->pluck('status'); //30        //Monthly Water
        $r43 = DB::table('settings')->where('title','r43_screen')->pluck('status'); //1500      //Monthly Payroll
        $r44 = DB::table('settings')->where('title','r44_screen')->pluck('status'); //3000      //Monthly Profit (Clear)
        $r45 = DB::table('settings')->where('title','r45_screen')->pluck('status'); //500       //Monthly Equip Pmts
        $r46 = DB::table('settings')->where('title','r46_screen')->pluck('status'); //200       //Ink/Wash/Emul
        $r47 = DB::table('settings')->where('title','r47_screen')->pluck('status'); //100       //Miscellaneous

        //$r18 = DB::table('settings')->where('title','r18_screen')->pluck('status'); //1.10;    // Primary Base Print Charges (Materials+Labor+Profit)
        //$r19 = DB::table('settings')->where('title','r19_screen')->pluck('status'); //0.60;    // Secondary Base Print Charges (Labor+Profit)

        $r22 = DB::table('settings')->where('title','r22_screen')->pluck('status'); //0.00; // Artwork - Format is xxxx.xx (******* May be come From User input )
        $r28 = DB::table('settings')->where('title','r28_screen')->pluck('status'); //0.08; // Sales Tax Rate - (6 percent Sales Tax is .0600) (******* May be come From User input )
        $r10 = DB::table('settings')->where('title','r10_screen')->pluck('status'); //0.0; // Shirt Base (raw) Cost/each (******* Will come from user input)
        //print_r($r10); exit();



        //========== Currency From Database ***//
        //$usd_to_srd = 7;
        $usd_to_srd = DB::table('currency')->where('title', 'US$')->pluck('value');
        //$euro_to_srd = 7.8;
        $euro_to_srd = DB::table('currency')->where('title', 'Euro')->pluck('value');


        //========== Derivation of K46 and K46 according to excel sheet ***//
        $k46 = (($r43+$r44)*($r38/($r38+$r39))+$r40+$r41+$r42+$r45+$r46+$r47)/$r38;
        $k47 = (($r43+$r44)*($r39/($r38+$r39)))/$r39;
        #$print = $k46.'and'.$k47;
        #print_r($print);exit();

        //========== Derivation of $r18 and $r19 according to the excel sheet. where D18 = $r18 and D19 = $r19
        $x = 0.1;
        $r18 = round(($k46+$x/2)/$x)*$x;    // =+CEILING(K46,0.1) in Excel sheet
        $r19 = round(($k47+$x/2)/$x)*$x;    // =+CEILING(K47,0.1) in Excel sheet
        #$ceil = $r18.'and'.$r19;
        #print_r($ceil);exit();


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