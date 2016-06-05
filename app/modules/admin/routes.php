<?php
/**
 * Created by PhpStorm.
 * User: etsb
 * Date: 1/14/16
 * Time: 3:59 PM
 */

Route::group(array('middleware' => 'auth','modules'=>'Admin', 'namespace' => 'App\Modules\Admin\Controllers'), function() {
    //Your routes belong to this module.
/*Form Components*/
Route::get('form-elements', function () {
    return view('admin::layouts.example_pages.form_elements');
});

/* Form Sample For Registration*/
Route::get('reg-sample', function () {
    return view('admin::layouts.example_pages.reg_form');
});

Route::any('admin', [
    'middleware'=> 'acl_access:admin',
    'as' => 'admin',
    'uses' => 'AdminController@index'
]);

Route::any('content-page', [
    'middleware'=> 'acl_access:content-page',
    'as' => 'content-page',
    'uses' => 'AdminController@content_page'
]);


Route::any('validation-page', [
    'middleware'=> 'acl_access:validation-page',
    'as' => 'validation-page',
    'uses' => 'AdminController@validation_page'
]);

Route::any('homer', [
    'middleware'=> 'acl_access:homer',
    'as' => 'homer',
    'uses' => 'AdminController@homer'
]);


//Bord...............

    Route::any('bord', [
        'middleware'=> 'acl_access:bord',
        'as' => 'bord',
        'uses' => 'BordController@bord_index'
    ]);

    Route::any('channel', [
        'middleware'=> 'acl_access:channel',
        'as' => 'channel',
        'uses' => 'BordController@channel'
    ]);
    Route::any('store-channel', [
        'middleware'=> 'acl_access:store-channel',
        'as' => 'store-channel',
        'uses' => 'BordController@store_channel'
    ]);

    Route::any('flat', [
        'middleware'=> 'acl_access:flat',
        'as' => 'flat',
        'uses' => 'BordController@flat'
    ]);

    Route::any('store-flat', [
        'middleware'=> 'acl_access:store-flat',
        'as' => 'store-flat',
        'uses' => 'BordController@store_flat'
    ]);

    Route::any('achtergrond', [
        'middleware'=> 'acl_access:achtergrond',
        'as' => 'achtergrond',
        'uses' => 'BordController@achtergrond'
    ]);

    Route::any('store-achtergrond', [
        'middleware'=> 'acl_access:store-achtergrond',
        'as' => 'store-achtergrond',
        'uses' => 'BordController@store_achtergrond'
    ]);

    Route::any('lichtbakken', [
        'middleware'=> 'acl_access:lichtbakken',
        'as' => 'lichtbakken',
        'uses' => 'BordController@lichtbakken'
    ]);

    Route::any('store-lichtbakken', [
        'middleware'=> 'acl_access:store-lichtbakken',
        'as' => 'store-lichtbakken',
        'uses' => 'BordController@store_lichtbakken'
    ]);

    /**Menu Panel**/

    Route::get("menu-panel", [
        'middleware'=> 'acl_access:menu-panel',
        "as"   => "menu-panel",
        "uses" => "MenuPanelController@index"
    ]);

    Route::any("store-menu-panel", [
        'middleware'=> 'acl_access:store-menu-panel',
        "as"   => "store-menu-panel",
        "uses" => "MenuPanelController@store"
    ]);

    Route::any("search-menu-panel", [
        'middleware'=> 'acl_access:search-menu-panel',
        "as"   => "search-menu-panel",
        "uses" => "MenuPanelController@search_menu_panel"
    ]);

    Route::any("view-menu-panel/{id}", [
        'middleware'=> 'acl_access:view-menu-panel/{id}',
        "as"   => "view-menu-panel",
        "uses" => "MenuPanelController@show"
    ]);


    Route::any("edit-menu-panel/{id}/{parent_menu_id}", [
        'middleware'=> 'acl_access:edit-menu-panel/{id}/{parent_menu_id}',
        "as"   => "edit-menu-panel",
        "uses" => "MenuPanelController@edit"
    ]);

    Route::any("update-menu-panel/{id}", [
        'middleware'=> 'acl_access:update-menu-panel/{id}',
        "as"   => "update-menu-panel",
        "uses" => "MenuPanelController@update"
    ]);

    Route::any("delete-menu-panel/{id}", [
        'middleware'=> 'acl_access:delete-menu-panel/{id}',
        "as"   => "delete-menu-panel",
        "uses" => "MenuPanelController@delete"
    ]);

    Route::any('menu-list', [
        'middleware'=> 'acl_access:menu-list',
        'as' => 'menu-list',
        'uses' => 'MenuPanelController@get_ajax_menu_list'
    ]);


    //Permission Menu Panel Lists

    Route::any('sidebar-menu', [
        'middleware'=> 'acl_access:sidebar-menu',
        'as' => 'sidebar-menu',
        'uses' => 'AdminController@sidebar_menu'
    ]);




});

