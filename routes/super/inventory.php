<?php 
Route::get('inventory','InventoryController@inventoryIndex')
	->name('inventory');
Route::get('create_inventory','InventoryController@createInventory')
    ->name('inventory_create');
Route::post('store_inventory','InventoryController@storeInventory')
    ->name('inventory_store');
Route::get('inventory_show{id}','InventoryController@showInventory')
    ->name('inventory_show');
Route::get('inventory_edit/{id}','InventoryController@editInventory')
    ->name('inventory_edit');
Route::put('inventory_update/{id}','InventoryController@updateInventory')
    ->name('inventory_update');


 // ----------Bying Part----------

Route::get('buying_reports','InventoryController@buyingReports')
    ->name('buying_reports');
Route::post('buying_single_date','InventoryController@buyingSingleDate')
    ->name('buying_single_date');  
Route::post('buying_date_wise','InventoryController@buyingDateWise')      
    ->name('buying_date_wise');
Route::get('today_buying_report','InventoryController@todayBuyingReport')
    ->name('today_buying_report');
Route::get('weekly_buying_report','InventoryController@weeklyBuyingReport')
    ->name('weekly_buying_report');
Route::get('monthly_buying_report','InventoryController@monthlyBuyingReport')
    ->name('monthly_buying_report');
    
    // ----------Selling Part ----------

Route::get('selling_reports','InventoryController@sellingReports')    
    ->name('selling_reports');
Route::post('selling_single_date','InventoryController@sellingSingleDate')
    ->name('selling_single_date');  
Route::post('selling_date_wise','InventoryController@sellingDateWise')      
    ->name('selling_date_wise');    
Route::get('today_selling_report','InventoryController@todaySellingReport')
    ->name('today_selling_report');
Route::get('weekly_selling_report','InventoryController@weeklySellingReport')
    ->name('weekly_selling_report');
Route::get('monthly_selling_report','InventoryController@monthlySellingReport')
    ->name('monthly_selling_report');

