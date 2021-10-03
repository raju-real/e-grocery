<?php 
// Api Favorite Part
Route::get('add_to_wishlist/{token}/{product_id}','ApiController@addToFavorite');    
Route::get('wishlist_items/{token}','ApiController@favoriteList');
Route::delete('remove_wishlist_item/{token}/{product_id}','ApiController@removeFavorite');
Route::delete('clear_wishlists/{token}','ApiController@clearWishlist');
Route::post('wishlist_to_cart/{token}','ApiController@addOnCart');    

