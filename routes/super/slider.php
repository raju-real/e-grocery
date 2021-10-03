<?php

Route::resource('slider','SliderController');
Route::get('slider_product/{id}','SliderController@sliderProducts')
    ->name('slider_product');
Route::post('slider_product_store','SliderController@sliderProductStore')
    ->name('slider_product_store');
Route::put('slider_product_update/{id}','SliderController@sliderProductUpdate')
    ->name('slider_product_update');
Route::delete('slider_product_destroy/{id}','SliderController@sliderProductDestroy')
    ->name('slider_product_destroy');