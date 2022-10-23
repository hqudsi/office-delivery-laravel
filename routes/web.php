<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/privacy', function () {
    return view('beelivery.privacy');
});

Route::get('/calendar-app-privacy', function () {
    return view('careful-calendar.privacy');
});

Route::get('/order-app-privacy', function () {
    return view('order-quds.privacy');
});

Route::get('/order-app-terms', function () {
    return view('order-quds.terms');
});

Route::get('/terms', function () {
    return view('beelivery.term');
});



Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
