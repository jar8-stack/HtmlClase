<?php

use App\Http\Middleware\Checktoken;
use App\Http\Middleware\checkStartedSession;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/iniciodesesion', function () {
    return view('login');
});*/

Route::get('/', function () {
    return view('home');
});


//Route::get('terminosycondiciones', 'App\Http\Controllers\EstaticosController@terminosycondiciones');
//Route::post('ajaxPrelogin', 'App\Http\Controllers\LoginController@prelogin')->name('ajaxPrelogin');

