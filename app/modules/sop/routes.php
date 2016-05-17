<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 5/8/16
 * Time: 1:14 PM
 */

Route::group(array('middleware' => 'auth','modules'=>'Sop', 'namespace' => 'App\Modules\Sop\Controllers'), function() {
    Route::get('print-cut',[
        'as'=>'print-cut',
        'uses'=>'PrintCutController@index'
    ]);
    Route::get('formulier-stickers',[
        'as'=>'formulier-stickers',
        'uses'=>'PrintCutController@view_formulier_stickers'
    ]);
    Route::get('formulier-t-shirts',[
        'as'=>'formulier-t-shirts',
        'uses'=>'PrintCutController@view_formulier_t_shirts'
    ]);
    Route::get('formulier-gr-formaat',[
        'as'=>'formulier-gr-formaat',
        'uses'=>'PrintCutController@view_formulier_gr_formaat'
    ]);
    Route::get('materialen',[
        'as'=>'materialen',
        'uses'=>'PrintCutController@view_materialen'
    ]);
    Route::get('formulier-laser-cards',[
        'as'=>'formulier-laser-cards',
        'uses'=>'PrintCutController@view_formulier_laser_cards'
    ]);
    Route::get('formulier-stempels',[
        'as'=>'formulier-stempels',
        'uses'=>'PrintCutController@view_formulier_stempels'
    ]);

});