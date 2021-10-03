<?php 
Route::resource('today_offer','TodayOfferController');
Route::post('today_offer_search','TodayOfferController@searchOffer')
    ->name('today_offer_search');
Route::resource('weekly_offer','WeeklyOfferController');
Route::post('weekly_offer_search','WeeklyOfferController@searchOffer')
    ->name('weekly_offer_search');