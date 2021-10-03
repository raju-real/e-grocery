<?php 
Route::get('get_user/{token}','ProfileController@getUser');
Route::get('user_image/{token}','ProfileController@getUserImage');
Route::post('user_image_post/{token}','ProfileController@postUserImage');
Route::put('user_image_update/{token}','ProfileController@updateUserImage');
Route::post('user_info_update/{token}','ProfileController@userInfoUpdate');
Route::post('password_update/{token}','ProfileController@updatePassword');
Route::post('varify_mobile','ProfileController@varifyMobile');