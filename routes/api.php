<?php
use Illuminate\Support\Facades\Route;

Route::post('send_otp','UserController@otpGenerate');
Route::post('old_user_otp','UserController@otpGenerate2');
Route::post('reset_password_otp','UserController@forResetPassword');
Route::post('login', 'UserController@login');
Route::post('reset_password','UserController@resetPassword')->name('reset_password');
Route::post('register', 'UserController@register');
Route::post('/password/email', 'Api\ForgotPasswordController@sendResetLinkEmail');
Route::post('/password/reset', 'Api\ResetPasswordController@reset');

// Cart Releated Routes
Route::get('shopping_cart/{token}', 'ApiController@shoppingCart');
Route::post('add_to_cart/{token}', 'ApiController@addToCart')->name('add_to_cart');
Route::get('single_product_clear/{token}/{product_id}', 'ApiController@singleProductClear');
Route::get('increment_product/{token}/{product_id}', 'ApiController@increment');
Route::post('decrement_quantity/{token}', 'ApiController@decrement');
Route::delete('clear_shopping_cart/{token}', 'ApiController@clearShoppingCart');

Route::group(['middleware'=>'auth:api'],function () {
    Route::post('apply_coupon/{token}', 'ApiController@applyCoupon');
    Route::post('broke_points/{token}', 'ApiController@brokePoints');
    Route::post('place_order/{token}', 'ApiController@placeOrder');
    Route::post('save_review/{token}', 'ApiController@saveReview');
    // User Order Activity
    Route::get('user_all_orders/{token}', 'ApiController@userOrders');
    Route::get('cancle_order/{token}/{order_id}', 'ApiController@cancleOrder');

    include 'api/address.php';            // Address Part
    include 'api/bazarlist.php';        // Bazar List Part
    include 'api/buy_now.php';            // Buy Now Part
    include 'api/user_basic.php';        //Basic Info Part
    include 'api/favorite.php';            // Favorite Part

    Route::get('logout/{token}', 'UserController@logout');

});

// Api Call
Route::get('all_product','ApiController@allProduct')->name('all_product');
Route::post('search_product','ApiController@searchProduct')->name('search_product');
Route::get('paginate_product','ApiController@paginateProduct')->name('paginate_product');
Route::get('popular_product','ApiController@popularProduct')->name('paginate_product');
Route::get('product_details/{product_id}','ApiController@productDetails');
Route::get('all_category','ApiController@getCategory')->name('all_category');
Route::get('get_subcategory/{category_id}','ApiController@getSubCategory');
Route::get('get_product/{category_id}/{subcategory_id}/{subsubcategory_id}',
		'ApiController@getProduct');
Route::get('get_subsubcategory/{subcategory_id}','ApiController@subSubCategory');
Route::get('category_wise_product/{category_id}','ApiController@categoryProduct');
Route::get('subcategory_wise_product/{subcategory_id}','ApiController@subCategoryProduct');

// Offer Part
include 'api/offer.php';

// For backend
Route::resource('category','CategoryController');

// Review
Route::get('prodct_review/{product_id}','ApiController@productReview');

// Basic Uses Routes
Route::get('get_district/{division_id}','ApiController@getDistrict');
Route::get('get_upazila/{district_id}','ApiController@getUpazila');

