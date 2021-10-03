<?php 
Route::post('home_address_post/{token}','ProfileController@homeAddressPost');
Route::get('home_address_get/{token}','ProfileController@homeAddressGet');
Route::post('home_address_update/{token}','ProfileController@homeAddressUpdate');

Route::post('office_address_post/{token}','ProfileController@officeAddressPost');
Route::get('office_address_get/{token}','ProfileController@officeAddressGet');
Route::post('office_address_update/{token}','ProfileController@officeAddressUpdate');

Route::post('gift_address_post/{token}','ProfileController@giftAddressPost');
Route::get('gift_address_get/{token}','ProfileController@giftAddressGet');
Route::post('gift_address_update/{token}','ProfileController@giftAddressUpdate');