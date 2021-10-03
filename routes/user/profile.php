<?php

Route::group(['as'=>'user.','prefix'=>'user','namespace'=>'User',
'middleware'=>['auth','user']],function(){

	Route::get('dashboard','DashboardController@userDashboard')->name('dashboard');
	Route::post('home_address_add/{id}','ProfileController@homeAddressAdd')
        ->name('home_address_add');
    Route::put('home_address_update/{id}','ProfileController@homeAddressUpdate')
        ->name('home_address_update');

    Route::post('office_address_add/{id}','ProfileController@officeAddressAdd')
        ->name('office_address_add');
    Route::put('office_address_update/{id}','ProfileController@officeAddressUpdate')
        ->name('office_address_update');

    Route::post('gift_address_add/{id}','ProfileController@giftAddressAdd')
        ->name('gift_address_add');
    Route::put('gift_address_update/{id}','ProfileController@giftAddressUpdate')
        ->name('gift_address_update');

    Route::put('user_info_update/{id}','ProfileController@userInfoUpdate')
        ->name('user_info_update');
    Route::post('change_mobile_no/{id}','ProfileController@changeMobile')
        ->name('change_mobile_no');
    Route::post('update_password/{id}','ProfileController@updatePassword')
        ->name('update_password');
    Route::get('invoice/{order_id}','ProfileController@invoice')->name('invoice');

});
