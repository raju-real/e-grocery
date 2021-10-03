<?php

use Illuminate\Support\Facades\Route;
// Home Page Controll Routes
Route::get('/','HomePageController@homePage')->name('home');

Auth::routes();
Route::post('logout','Auth\LoginController@logout')->name('logout');
Route::get('user-register','Auth\RegisterController@showForm')->name('user-register');
Route::post('registration','Auth\RegistrationController@showRegistrationForm')->name('registration');
Route::post('register-user','Auth\RegisterController@userRegister')->name('register-user');
Route::get('reset-password','Auth\LoginController@showPasswordReset')->name('reset-password');
Route::post('user-login','Auth\LoginController@userLogin')->name('user-login');

include 'super/super.php';      // Super Admin Routes Part

include 'user.php';             // User Part Routes

include 'user/profile.php';      // User Profile Activity

// General Website Controll
// For Ajax Search
Route::post('search','HomePageController@searchResult')
    ->name('search');
// For manual search
Route::post('product_search','HomePageController@productSearch')
    ->name('product_search');
Route::get('search-product','HomePageController@searchProduct')
    ->name('search-product');    
Route::post('product_details/{price}','HomePageController@productDetails')->name('product_details');
Route::get('product_detail/{slug}','HomePageController@productDetailBySearch')
    ->name('product_detail');
Route::get('bazarlist','HomePageController@bazarList')
    ->name('bazarlist');
Route::get('about-us','HomePageController@aboutUs')
    ->name('about-us');
Route::get('contact-us','HomePageController@contactUs')
    ->name('contact-us');
Route::post('send_message','HomePageController@sendMessage')
    ->name('send_message');
Route::get('subcategories/{slug}','HomePageController@subCategories')
    ->name('subcategories');
Route::get('subsubcategories/{slug}','HomePageController@subSubCategories')
    ->name('subsubcategories');
Route::get('category/{slug}','HomePageController@categoryWiseProduct')
    ->name('category');
Route::get('subcategory/{slug}','HomePageController@subCategoryWiseProduct')
    ->name('subcategory');
Route::get('subsubcategory/{slug}','HomePageController@subSubCategoryWiseProduct')
    ->name('subsubcategory');
Route::get('products','HomePageController@featuredProducts')
    ->name('products');
 //Sort from category,subcategory,subsubcategory
Route::get('sort_by/{name}/{slug}/{sort}','HomePageController@sortBy')->name('sort_by');
//Sort from all product
Route::get('sort_by_all/{name}/{sort}','HomePageController@sortByFromAll')->name('sort_by_all');
//sort from slider, promotion
Route::get('sort_by_offer/{name}/{slug}/{sort}','HomePageController@sortByPromotionSlider')
->name('sort_by_offer');
Route::get('sort_offer/{name}/{sort}','HomePageController@sortFromTodayWeekly')
->name('sort_offer');

Route::get('todayoffer','HomePageController@todayOfferProducts')
    ->name('todayoffer');
Route::get('weeklyoffer','HomePageController@weeklyOfferProducts')
->name('weeklyoffer');
//Sliders
Route::get('offers/{title}','HomePageController@sliderProducts')
    ->name('offers');
//Promotion
Route::get('campaigns','HomePageController@allPromotion')->name('campaigns');
Route::get('campaign/{slug}','HomePageController@promotionProducts')
    ->name('campaign');

    // Review
Route::post('save_review','HomePageController@saveReview')->name('save_review');

//franchises
Route::get('franchises','HomePageController@franchises')->name('franchises');
Route::post('apply_franchises','HomePageController@applyFranchises')
    ->name('apply_franchises');

Route::post('subscribe','HomePageController@subscribe')->name('subscribe');

// SSL COMMERZE

