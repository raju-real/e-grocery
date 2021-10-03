<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Model\Promotion;
use App\Model\Promotionproduct;
use App\Model\Slider;
use App\Model\Sliderproduct;
use App\Model\Weeklyoffer;
use Illuminate\Http\Request;
use App\Model\Todyoffer;
use App\Model\Product;
use Carbon\Carbon;

class OfferController extends Controller
{
 	public function todayOffer(){
        $todayDate = Carbon::now()->toDateString();
 		$todayOffers = Todyoffer::with('product','product.images')
 					->whereDate('offer_date', $todayDate)
                    ->where('status',1)
 					->get();
 		return $todayOffers;
 	}

 	public function weeklyOffer(){
        $todayDate = Carbon::now()->toDateString();
        //return $todayDate; // Equivalent: echo $dt->format('Y-m-d');
        $weeklyOffers = Weeklyoffer::with('product','product.images')
            ->whereDate('start_date','<=',$todayDate)
            ->whereDate('end_date','>=',$todayDate)
            ->where('status',1)
            ->get();
        return $weeklyOffers;
    }

    public function getSliderImage(){
        $sliderImages = Slider::latest()->get();
        return $sliderImages;
    }

    public function getSliderProducts($slider_id){
        $products = Sliderproduct::with('product','product.images')
            ->where('slider_id',$slider_id)->get();
        return $products;
    }

    // Temporary
    public function sliderProducts(){
        $products = Product::where('category_id',10)->get();
        return $products;
    }

    public function allPromotion(){
        $promotions = Promotion::where('status',1)->get();
        return $promotions;
    }

    public function promotionWiseProduct($promotion_id){
        $products = Promotionproduct::with('product','product.images')
            ->where('promotion_id',$promotion_id)->where('status',1)
            ->get();
        return $products;
    }
}
