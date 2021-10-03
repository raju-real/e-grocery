<?php 
Route::post('a_t_c','CartController@atc')
    ->name('a_t_c');

Route::post('add_to_cart','CartController@addToCart')
    ->name('add_to_cart');

Route::get('shopping_cart','CartController@shoppingCart')
    ->name('shopping_cart');

Route::get('decrement_quantity/{cart_id}','CartController@decrement')
   ->name('decrement_quantity');

Route::get('increment_quantity/{cart_id}','CartController@increment')
   ->name('increment_quantity');

Route::get('product_remove/{product_id}','CartController@productRemove')
   ->name('product_remove');

Route::get('clear_shopping_cart','CartController@clearCart')
   ->name('clear_shopping_cart');

// Using Session
