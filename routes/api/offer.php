<?php 
Route::get('today_offers','OfferController@todayOffer');
Route::get('weekly_offers','OfferController@weeklyOffer');
Route::get('slider_images','OfferController@getSliderImage');
Route::get('slider_products/{slider_id}','OfferController@getSliderProducts');
Route::get('all_promotion','OfferController@allPromotion')->name('all_promotion');
Route::get('promotion_wise_product/{promotion_id}','OfferController@promotionWiseProduct')
    ->name('promotion_wise_product');

Route::get('slider_products','OfferController@getSliderProducts');   // Temporary