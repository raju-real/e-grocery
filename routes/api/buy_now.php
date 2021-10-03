<?php 
Route::get('buy_now/{token}/{product_id}/{price}','ApiController@buyNow');
Route::get('modify_buy_now/{id}','ApiController@modifyBuyNow');
Route::delete('delete_buynow_item/{token}/{product_id}','ApiController@deleteBuynowItem');
Route::get('decrement_buynow_quantity/{token}/{product_id}','ApiController@decrementBuynow');
Route::get('increment_buynow_quantity/{token}/{product_id}','ApiController@incrementBuynow');