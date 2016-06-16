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

        //============== Static variables================//
        $shirt_markup_percent = 1.2;
        $screen_preparation_charge_per_screen = 15;
        $ink_charge = 0.10;
        $primary_base_print_charges = 1.10;
        $secondary_base_print_charge = 0.60;
        $artwork_format = 2.00;
        $sales_tax = 0.08;
        $R11 = 0;
        $total_r20 = 0;
        $E23 = 0;

        // Define currency
        $usd_to_srd = 7;
        //$usd_to_srd = DB::table('currency')->where('title', 'US$')->pluck('value');
        $euro_to_srd = 7.8;
        //$euro_to_srd = DB::table('currency')->where('title', 'Euro')->pluck('value');


        $R19 = 0;
        if($aantalshirts>0 && $aantalshirts<20)
        {
            /*----Row 19---*/
            $R19 = 1.3;
            /*---Row 20----*/
            if($primary=='y')
            {
                 if($secondary=='y')
                 {
                     $total_r20 = ($aantalshirts*($R11+(1*$primary_base_print_charges)+(1*$secondary_base_print_charge)+($aantalkleuren_primary*$ink_charge)+($aantalkleuren_secondary*$ink_charge)))*$R19;
                     $E23 = ($aantalkleuren_primary*$screen_preparation_charge_per_screen)+($aantalkleuren_secondary*$screen_preparation_charge_per_screen);
                 }else{
                     $total_r20 = ($aantalshirts*($R11+(1*$primary_base_print_charges)+($aantalkleuren_primary*$ink_charge)))*$R19;
                     $E23 = ($aantalkleuren_primary*$screen_preparation_charge_per_screen);
                 }
            }

            /*for E23
             * =IF(D12="y",
                IF(D13="y",
                ((D14*D16)+(D15*D16)),(D14*D16)
                )
            )*/

            /*For E20
             * =IF
            (D12="y",
            IF(D13="y",
            (
                (E9*(E11+(1*D18)+(1*D19)+(D14*D17)+(D15*D17)))*E19
            ),
            (
                (E9* (E11+(1*D18)+(D14*D17) ) )*E19)
            ),
            IF(D13="y",
            (
                (E9* (E11+ (1*D19)+(D15*D17) ) )*E19), )
            )*/
        }
        if($aantalshirts>19 && $aantalshirts<50){
            $R19 = 1.2;
        }
        if($aantalshirts>49 && $aantalshirts<100){
            $R19 = 1.1;
        }
        if($aantalshirts>99 && $aantalshirts<250){
            $R19 = 1.0;
        }
        if($aantalshirts>249 && $aantalshirts<500){
            $R19 = 0.9;
        }
        if($aantalshirts>499 && $aantalshirts<1000){
            $R19 = 0.8;
        }
        if($aantalshirts>999 ){
            $R19 = 0.7;
        }

        /*--Row 21--*/
        $R21 = $total_r20/$aantalshirts;

        /*-- Row 24--*/
        /*=E20+E22+E23*/
        $E24 = $total_r20+$artwork_format+$E23;


        /*--Row 25--*/
        /*=E24/E9*/
        $E25 = $E24/$aantalshirts;

        $E27 = $E25 * $usd_to_srd;

        $E26 = $E27/$euro_to_srd;

        $E29 = $E24 * $sales_tax;

        $E30 = $E24 + $E29;

        $E31 = $E30/$aantalshirts;

        $E33 = $E31 * $usd_to_srd;

        $E32 = $E33/$euro_to_srd;



        //return $total = $aantalshirts.'/'.$primary.'/-'.$aantalkleuren_primary.'/'.$secondary.'/-'.$aantalkleuren_secondary.'/'.$extraprints.'/'.$R19.'/E20='.$total_r20;
        return $total = 'E19 = '.$R19.'<br>E20 = '.$total_r20.'<br>E21 = '.$R21.'<br>E22 = '.$artwork_format.'<br>E23 = '.$E23.'<br>E24 = '.$E24.'<br>E25 = $'.$E25.'<br>E26 = '.$E26.'<br>E27 = '.$E27.'<br><br>E29 = '.$E29.'<br>E30 = '.$E30.'<br>E31 = '.$E31.'<br>E32 = '.$E32.'<br>E33 = '.$E33;
        //return $total = $R19.'/'.$total_r20.'/'.$R21.'/'.$artwork_format.'/'.$E23.'/'.$E24.'/'.$E25.'/'.$E26.'/'.$E27.'/'.$E29.'/'.$E30.'/'.$E31.'/'.$E32.'/'.$E33;


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