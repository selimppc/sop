<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('welcome', function () {
    return view('welcome');
});


/*Route::any('inactive-user', [
    'as' => 'inactive-user',
    'uses' => 'UserController@postLogin'
]);*/

/*reset password route for first-time login */
Route::any('reset-password/{user_id}', [
    //'middleware'=> 'acl_access:reset-password/{user_id}',
    'as' => 'reset-password',
    'uses' => 'Auth\AuthController@reset_password'
]);

Route::any('update-new-password', [
    //'middleware'=> 'acl_access:update-new-password',
    'as' => 'update-new-password',
    'uses' => 'Auth\AuthController@update_new_password'
]);



Route::get('get-user-login', [
    //'middleware'=> 'acl_access:get-user-login',
    'as' => 'get-user-login',
    'uses' => 'Auth\AuthController@getLogin'
]);

Route::any('post-user-login', [
    //'middleware'=> 'acl_access:post-user-login',
    'as' => 'post-user-login',
    'uses' => 'Auth\AuthController@postLogin'
]);


Route::group(['middleware' => 'auth'], function()
{

Route::any('/', [
    'middleware'=> 'acl_access:/',
    'as' => 'dashboard',
    'uses' => 'HomeController@dashboard'
]);

Route::any('dashboard', [
    'middleware'=> 'acl_access:dashboard',
    'as' => 'dashboard',
    'uses' => 'HomeController@dashboard'
]);

Route::any('all_routes_uri', [
    'middleware'=> 'acl_access:all_routes_uri',
    'as' => 'all_routes_uri',
    'uses' => 'HomeController@all_routes_uri'
]);

});

