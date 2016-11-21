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
        'middleware' => 'acl_access:price-list',
        'as' => 'price-list',
        'uses' => 'PriceListController@index'
    ]);

    Route::any('store-price-list', [
        'middleware' => 'acl_access:store-price-list',
        'as' => 'store-price-list',
        'uses' => 'PriceListController@store'
    ]);

    Route::any('view-price-list/{id}', [
        'middleware' => 'acl_access:view-price-list/{id}',
        'as' => 'view-price-list',
        'uses' => 'PriceListController@show'
    ]);

    Route::any('edit-price-list/{id}', [
        'middleware' => 'acl_access:edit-price-list/{id}',
        'as' => 'edit-price-list',
        'uses' => 'PriceListController@edit'
    ]);

    Route::any('update-price-list/{id}', [
        'middleware' => 'acl_access:update-price-list/{id}',
        'as' => 'update-price-list',
        'uses' => 'PriceListController@update'
    ]);

    Route::any('search-price-list', [
        'middleware' => 'acl_access:search-price-list',
        'as' => 'search-price-list',
        'uses' => 'PriceListController@search'
    ]);

    Route::any('delete-price-list/{id}', [
        'middleware' => 'acl_access:delete-price-list/{id}',
        'as' => 'delete-price-list',
        'uses' => 'PriceListController@destroy'
    ]);

    /*
     *
     * Leave Applications
     */


    Route::any('leave-application', [
        'middleware' => 'acl_access:leave-application',
        'as' => 'leave-application',
        'uses' => 'LeaveController@index'
    ]);

    Route::any('store-leave-application', [
        'middleware' => 'acl_access:store-leave-application',
        'as' => 'store-leave-application',
        'uses' => 'LeaveController@store'
    ]);

    Route::any('leave-approve/{id}', [
        'middleware' => 'acl_access:leave-approve/{id}',
        'as' => 'leave-approve',
        'uses' => 'LeaveController@leave_approve'
    ]);

    Route::any('leave-decline/{id}', [
        'middleware' => 'acl_access:leave-decline/{id}',
        'as' => 'leave-decline',
        'uses' => 'LeaveController@leave_decline'
    ]);

    Route::any('leave-cancel/{id}', [
        // 'middleware' => 'acl_access:leave-cancel/{id}',
        'as' => 'leave-cancel',
        'uses' => 'LeaveController@leave_cancel'
    ]);

    Route::any('leave-accept/{id}', [
        'middleware' => 'acl_access:leave-accept/{id}',
        'as' => 'leave-accept',
        'uses' => 'LeaveController@leave_accept'
    ]);

    Route::any('search-worker', [
        'middleware' => 'acl_access:search-worker',
        'as' => 'search-worker',
        'uses' => 'LeaveController@search'
    ]);









});