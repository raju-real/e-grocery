<?php

Route::resource('promotion','PromotionController');
Route::get('promotion_product/{id}','PromotionController@promotionProducts')
    ->name('promotion_product');
Route::post('promotion_product_store','PromotionController@promotionProductStore')
    ->name('promotion_product_store');
Route::put('promotion_product_update/{id}','PromotionController@promotionProductUpdate')
    ->name('promotion_product_update');
Route::delete('promotion_product_destroy/{id}','PromotionController@promotionProductDestroy')
    ->name('promotion_product_destroy');