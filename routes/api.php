<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Intervention\Image\Facades\Image;

Route::group(['middleware' => ['json.response']], function () {

    //test routes
    // Route::post('testorder', 'Api\GeneralController@testorder');
    Route::post('testImage', 'Api\GeneralController@testImage');

    Route::get('getImage/{company_id?}', 'Api\GeneralController@getImage');
    // Route::get('storage', function ()
    // {
    //     return Image::make(storage_path('public/users/default1.png'))->response();
    // });

    // public user routes
    // Route::post('register', 'Api\AuthController@register');
    // Route::post('logisticsRegister', 'Api\AuthController@logisticsRegister');
    Route::post('login', 'Api\AuthController@login')->name('login');
    Route::post('recover-email', 'Api\AuthController@recover');
    Route::put('reset-pass', 'Api\AuthController@reset');

    // public routes
    Route::get('getCities', 'Api\GeneralController@getCities');
    // Route::get('categories','Api\GeneralController@getCategories');
    // Route::get('testOrdersStatistics', 'Api\LogisticsController@testOrdersStatistics');
    // Route::get('testCollectionStatistics', 'Api\LogisticsController@testCollectionStatistics');
    // auth routes
    Route::group(['middleware' => 'auth:api'], function() {
        Route::get('logout', 'Api\AuthController@logout');
        Route::post('deleteAccount', 'Api\AuthController@deleteAccount');
        Route::get('getUser', 'Api\AuthController@getUser');
        Route::post('changePassword', 'Api\AuthController@changePassword');
        // logistics routes
        Route::group(['prefix' => 'logistics'], function () {
            Route::post('editUser', 'Api\LogisticsController@editUser');

            Route::post('addCity', 'Api\GeneralController@addCity');
            Route::post('addUserByCompany', 'Api\LogisticsController@addUserByCompany');
            Route::post('addCompanyCustomer', 'Api\LogisticsController@addCompanyCustomer');
            Route::post('addNewCompanyCustomer', 'Api\LogisticsController@addNewCompanyCustomer');
            Route::post('addNewCompanyUser', 'Api\LogisticsController@addNewCompanyUser');
            Route::get('getCompanies', 'Api\LogisticsController@getCompanies');
            Route::get('getServices', 'Api\LogisticsController@getServices');
            Route::get('getStatuses', 'Api\LogisticsController@getStatuses');
            Route::get('getMyUsers', 'Api\LogisticsController@getMyUsers');
            Route::get('getMyCustomers', 'Api\LogisticsController@getMyCustomers');
            Route::get('getMyDrivers', 'Api\LogisticsController@getMyDrivers');
            Route::get('getMyCompanies', 'Api\LogisticsController@getMyCompanies');
            Route::get('getMyDriverCollection', 'Api\LogisticsController@getMyDriverCollection');
            Route::get('getMyCustomersWithCollection', 'Api\LogisticsController@getMyCustomersWithCollection');
            Route::post('changeUserStatus', 'Api\LogisticsController@changeUserStatus');
            Route::post('changeDriverStatus', 'Api\LogisticsController@changeDriverStatus');
            Route::post('addOrder', 'Api\LogisticsController@addOrder');
            Route::post('editOrder', 'Api\LogisticsController@editOrder');
            Route::post('deleteOrder', 'Api\LogisticsController@deleteOrder');
            Route::post('editOrderDriver', 'Api\LogisticsController@editOrderDriver');
            Route::get('getMyOrdersStatistics', 'Api\LogisticsController@getMyOrdersStatistics');
            Route::get('getUserOrdersStatistics', 'Api\LogisticsController@getUserOrdersStatistics');
            Route::get('getMyCollectionStatistics', 'Api\LogisticsController@getMyCollectionStatistics');
            Route::get('getMyCollectionDashboard', 'Api\LogisticsController@getMyCollectionDashboard');
            Route::get('getMyTransactionsDashboard', 'Api\LogisticsController@getMyTransactionsDashboard');
            Route::get('getMyCompaniesCollection', 'Api\LogisticsController@getMyCompaniesCollection');
            Route::get('getMyCustomerCollection', 'Api\LogisticsController@getMyCustomerCollection');
            Route::get('getOrders', 'Api\LogisticsController@getOrders');
            Route::post('getOrders', 'Api\LogisticsController@getOrders');
            Route::get('getLoadingOrders', 'Api\LogisticsController@getLoadingOrders');
            Route::get('getDriverCollectedOrders', 'Api\LogisticsController@getDriverCollectedOrders');
            Route::post('addDriverCollectedOrders', 'Api\LogisticsController@addDriverCollectedOrders');
            Route::get('getCustomerCollectedOrders', 'Api\LogisticsController@getCustomerCollectedOrders');
            Route::post('addCustomerPaymentOrders', 'Api\LogisticsController@addCustomerPaymentOrders');
            Route::get('getCustomerPayments', 'Api\LogisticsController@getCustomerPayments');
            Route::post('editPackage', 'Api\LogisticsController@editPackage');
            Route::post('editTansCost', 'Api\LogisticsController@editTansCost');
            Route::post('editWhoPay', 'Api\LogisticsController@editWhoPay');
            Route::get('getPackChange', 'Api\LogisticsController@getPackChange');
            Route::get('getDriversCollection', 'Api\LogisticsController@getDriversCollection');
            Route::post('approveCustomerPayment', 'Api\LogisticsController@approveCustomerPayment');
            Route::post('loadingOrdersDriver', 'Api\LogisticsController@loadingOrdersDriver');
            Route::get('getOrderStatuses', 'Api\LogisticsController@getOrderStatuses');
            Route::get('getOrderStatusesByOid', 'Api\LogisticsController@getOrderStatusesByOid');
            Route::post('changeOrderStatus', 'Api\LogisticsController@changeOrderStatus');
            Route::post('addOrderPayment', 'Api\LogisticsController@addOrderPayment');
            Route::post('addReceipt', 'Api\LogisticsController@addReceipt');
            Route::get('getPackSizes', 'Api\LogisticsController@getPackSizes');
            Route::get('getTransactions', 'Api\LogisticsController@getTransactions');

            Route::post('addCompanyLogo', 'Api\LogisticsController@addCompanyLogo');
            // Reports -----------
            Route::get('getReportDriver', 'Api\LogisticsController@getReportDriver');
            // Route::get('getDriverOrdersReport', 'Api\LogisticsController@getDriverOrdersReport');
            Route::post('getDriverOrdersReport', 'Api\LogisticsController@getDriverOrdersReport');
            // Route::get('getCustomerOrdersReport', 'Api\LogisticsController@getCustomerOrdersReport');
            Route::post('getCustomerOrdersReport', 'Api\LogisticsController@getCustomerOrdersReport');
        });
    });

});

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
