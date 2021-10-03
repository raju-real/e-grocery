<?php 
Route::get('address','AddressController@address')->name('address');
Route::post('division_store','AddressController@storeDivision')->name('division.store');
Route::put('division_update/{id}','AddressController@updateDivision')
    ->name('division.update');
Route::delete('division_destroy/{id}','AddressController@destroyDivision')
    ->name('division.destroy');

Route::post('district_store','AddressController@storeDistrict')
    ->name('district.store');
Route::put('district_update/{id}','AddressController@updateDistrict')
    ->name('district.update');
Route::delete('district_destroy','AddressController@destroyDivision')
    ->name('district.destroy');

Route::post('upazila_store','AddressController@storeUpazila')
    ->name('upazila.store');
Route::put('upazila_update/{id}','AddressController@updateUpazila')
    ->name('upazila.update');
Route::get('upazila_destroy/{id}','AddressController@destroyUpazila')
    ->name('upazila.destroy');

// Admin Control
Route::resource('admin','AdminsController');