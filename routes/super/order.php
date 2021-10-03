<?php 
// ----------Order Management----------

Route::get('new_order','OrderController@newOrder')->name('new_order');
Route::get('order_view/{order_id}','OrderController@orderView')
    ->name('order_view');
Route::get('receive_order/{order_id}','OrderController@receiveOrder')
    ->name('receive_order');
Route::get('process_order/{order_id}','OrderController@processOrder')
    ->name('process_order');
Route::get('cancel_order/{order_id}','OrderController@cancelOrder')
    ->name('cancel_order');
Route::get('deliver_order/{order_id}','OrderController@deliverOrder')
    ->name('deliver_order');
Route::get('make_invoice/{order_id}','OrderController@makeOrderInvoice')
    ->name('make_invoice');
Route::get('received_order','OrderController@receivedOrder')->name('received_order');
Route::get('pending_order','OrderController@pendingOrder')->name('pending_order');
Route::get('processed_order','OrderController@processedOrder')->name('processed_order');
Route::get('cancelled_order','OrderController@cancelledOrder')->name('cancelled_order');
Route::get('delivered_order','OrderController@deliveredOrder')->name('delivered_order');
Route::delete('delete_order/{id}','OrderController@deleteOrder')->name('delete_order');
Route::get('order_search_page','OrderController@orderSearchPage')->name('order_search_page');
Route::post('search_order','OrderController@searchOrder')->name('search_order');