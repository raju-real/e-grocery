<?php 
Route::get('modify_bazar_list','BazarListController@modifyBazarList')
    ->name('modify_bazar_list');
Route::get('modified_bazarlist','BazarListController@modifiedBazarList')
    ->name('modified_bazarlist');
Route::post('add_bazar_list','BazarListController@addBazarList')
   ->name('add_bazar_list');
Route::get('delete_bazarlist_item/{id}','BazarListController@deleteBazarlistItem')
   ->name('delete_bazarlist_item');
Route::get('decrement_list_quantity/{list_id}','BazarListController@decrementList')
   ->name('decrement_list_quantity');
Route::get('increment_list_quantity/{list_id}','BazarListController@incrementList')
   ->name('increment_list_quantity');
Route::get('bazarlist_checkout','BazarListController@checkoutBazarList')
   ->name('bazarlist_checkout');
Route::post('place_bazarlist_order','BazarListController@placeBazarListOrder')
   ->name('place_bazarlist_order');