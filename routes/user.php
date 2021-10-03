<?php
Route::group(['middleware'=>['auth','user']],function(){

  	include 'user/favorite.php';			// Favorite part

//	Route::get('checkout/{status}','CheckoutOrderController@checkoutProuduct')
//        ->name('checkout');
    Route::post('apply_coupon','CheckoutOrderController@applyCoupon')->name('apply_coupon');
    Route::post('broke_points','CheckoutOrderController@brokePoints')->name('broke_points');
	Route::post('place_order','CheckoutOrderController@placeOrder')
        ->name('place_order');

});
Route::get('checkout/{status}','CheckoutOrderController@checkoutProuduct')
    ->name('checkout');
include 'user/cart.php';				// Cart Part
include 'user/buy_now.php';                //Buy Now Part
include 'user/bazarlist.php';		// Bazar List Part
