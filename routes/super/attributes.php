<?php 
Route::resource('category','CategoryController');
Route::resource('subcategory','SubcategoryController');
Route::resource('subsubcategory','SubSubCategoryController');
Route::get('attributes','ProductAttributesController@index')->name('attributes.index');
Route::get('get_unit','ProductAttributesController@getUnit')->name('attributes.get_unit');
Route::post('unit/add','ProductAttributesController@unitStore')->name('unit.store');
Route::put('unit/{id}','ProductAttributesController@unitUpdate')->name('unit.update');
Route::get('unit/{id}','ProductAttributesController@unitDestroy')->name('unit.destroy');
Route::post('size','ProductAttributesController@sizeStore')->name('size.store');
Route::put('size/{id}','ProductAttributesController@sizeUpdate')->name('size.update');
Route::get('size/{id}','ProductAttributesController@sizeDestroy')->name('size.destroy');
Route::post('color','ProductAttributesController@colorStore')->name('color.store');
Route::put('color/{id}','ProductAttributesController@colorUpdate')->name('color.update');
Route::get('color/{id}','ProductAttributesController@colorDestroy')
    ->name('color.destroy');