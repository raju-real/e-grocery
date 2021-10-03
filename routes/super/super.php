<?php 

// Super Admin Login
Route::get('/super', 'Auth\AdminLoginController@showSuperLoginForm')->name('super');
Route::get('admin', 'Auth\AdminLoginController@showAdminLoginForm')->name('admin');
Route::post('/login/super', 'Auth\AdminLoginController@superAdminLogin')
    ->name('super-admin-login');
Route::post('admin/login', 'Auth\AdminLoginController@adminLogin')->name('admin-login');
Route::get('super-logout','Auth\AdminLoginController@superLogout')->name('super-logout');
Route::get('admin-logout','Auth\AdminLoginController@adminLogout')->name('admin-logout');

Route::group(['as'=>'super.','prefix'=>'super','namespace'=>'Super',
    'middleware'=>['auth:admin','super']],function(){
    Route::get('send_image','DashboardController@image')->name('send_image');
    Route::get('dashboard','DashboardController@superAdminDashboard')->name('dashboard');
    // User Activity
    Route::get('get_user','DashboardController@getUser')->name('get_user');
    Route::post('search_user','DashboardController@searchUser')
        ->name('search_user');
    Route::get('user_message','DashboardController@userMessage')->name('user_message');
    Route::get('message_read/{id}','DashboardController@messageRead')
        ->name('message_read');
    Route::delete('message_destroy/{id}','DashboardController@messageDestroy')
        ->name('message_destroy');
    Route::post('user_message_send','DashboardController@userMessageSend')
        ->name('user_message_send');
    Route::resource('bazar','BazarListController');
    Route::resource('popular','PopularController');
    Route::resource('company','CompanyController');

    include 'promotion.php';         // Promotion, Promotion Product

    include 'slider.php';            // Slider, Slider Product

    include 'attributes.php';       // Product Attributes

    include 'product.php';          // Product

    include 'offer.php';            // Offer Management

    include 'order.php';            // Order ManageMent

    include 'inventory.php';        // Inventory Management
    
    include 'basic.php';            // Basic Information Controll

    include 'coupon.php';           // Coupon Mangement

    Route::get('franchises','FranchisesController@allFranchises')
        ->name('franchises');
    Route::get('subscribers','DashboardController@allSubscribers')
        ->name('subscribers');    

});