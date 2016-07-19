<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 5/8/16
 * Time: 1:14 PM
 */

Route::group(array('middleware' => 'auth','modules'=>'Sop', 'namespace' => 'App\Modules\Sop\Controllers'), function() {
    Route::get('print-cut',[
        'middleware'=> 'acl_access:print-cut',
        'as'=>'print-cut',
        'uses'=>'PrintCutController@index'
    ]);
    Route::get('formulier-stickers',[
        'middleware'=> 'acl_access:formulier-stickers',
        'as'=>'formulier-stickers',
        'uses'=>'PrintCutController@view_formulier_stickers'
    ]);
    Route::get('formulier-t-shirts',[
        'middleware'=> 'acl_access:formulier-t-shirts',
        'as'=>'formulier-t-shirts',
        'uses'=>'PrintCutController@view_formulier_t_shirts'
    ]);
    Route::get('formulier-gr-formaat',[
        'middleware'=> 'acl_access:formulier-gr-formaat',
        'as'=>'formulier-gr-formaat',
        'uses'=>'PrintCutController@view_formulier_gr_formaat'
    ]);
    Route::get('materialen',[
        'middleware'=> 'acl_access:materialen',
        'as'=>'materialen',
        'uses'=>'PrintCutController@view_materialen'
    ]);
    Route::get('formulier-laser-cards',[
        'middleware'=> 'acl_access:formulier-laser-cards',
        'as'=>'formulier-laser-cards',
        'uses'=>'PrintCutController@view_formulier_laser_cards'
    ]);
    Route::get('formulier-stempels',[
        'middleware'=> 'acl_access:formulier-stempels',
        'as'=>'formulier-stempels',
        'uses'=>'PrintCutController@view_formulier_stempels'
    ]);

    /*
     *
     * Price List
     */


    Route::any('price-list', [
        #'middleware' => 'acl_access:role',
        'as' => 'price-list',
        'uses' => 'PriceListController@index'
    ]);

    Route::any('store-price-list', [
        #'middleware' => 'acl_access:store-role',
        'as' => 'store-price-list',
        'uses' => 'PriceListController@store'
    ]);

    Route::any('view-price-list/{id}', [
        #'middleware' => 'acl_access:view-role/{slug}',
        'as' => 'view-price-list',
        'uses' => 'PriceListController@show'
    ]);

    Route::any('edit-price-list/{id}', [
        #'middleware' => 'acl_access:edit-role/{slug}',
        'as' => 'edit-price-list',
        'uses' => 'PriceListController@edit'
    ]);

    Route::any('update-price-list/{id}', [
        #'middleware' => 'acl_access:update-role/{slug}',
        'as' => 'update-price-list',
        'uses' => 'PriceListController@update'
    ]);

    Route::any('delete-price-list/{id}', [
        #'middleware' => 'acl_access:delete-role/{slug}',
        'as' => 'delete-price-list',
        'uses' => 'PriceListController@destroy'
    ]);






});