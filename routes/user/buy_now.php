<?php 
Route::get('buy_now/{product_id}/{price}/{discount}','BuyNowController@buyNow')
	->name('buy_now');
Route::get('modify_buy_now/{id}','BuyNowController@modifyBuyNow')
	->name('modify_buy_now');
Route::get('delete_buynow_item','BuyNowController@deleteBuynowItem')
   ->name('delete_buynow_item');
Route::get('decrement_buynow_quantity','BuyNowController@decrementBuynow')
   ->name('decrement_buynow_quantity');
Route::get('increment_buynow_quantity','BuyNowController@incrementBuynow')
   ->name('increment_buynow_quantity');	
