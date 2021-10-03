<?php 
Route::resource('product','ProductController');
Route::post('category_wise_product','ProductController@categoryWiseProduct')
    ->name('category_wise_product');
Route::post('subcategory_wise_product','ProductController@subCategoryWiseProduct')
    ->name('subcategory_wise_product');