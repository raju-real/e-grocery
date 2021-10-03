<?php

namespace App\Http\Controllers;

use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\Product;
use App\Model\Buynow;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
//use URL;

class BuyNowController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function buyNow($product_id,$price,$discount){
        if(Auth::check()){
            $user_id = Auth::id();
        } else {
            $user_id = null;
        }
        $quantity = 1;
        $unitPrice = $price;
        $totalPrice = $price * $quantity;
        $buyNow = new Buynow();
        $buyNow->user_id = $user_id;
        $session_id = Session::get('session_id_buy');
        if(empty($session_id)){
            $session_id = $random = Str::random(40);
            Session::put('session_id_buy',$session_id);
        }
        $buyNow->session_id = $session_id;
        $buyNow->product_id = $product_id;
        $buyNow->quantity = $quantity;
        $buyNow->unit_price = $unitPrice;
        $buyNow->total_price = $totalPrice;
        $buyNow->status = 3;
        $buyNow->discount = $discount;
        $check = Buynow::where('session_id',$session_id)->get();
        if(sizeof($check) > 0){
            foreach($check as $c){
                $c->delete();
            }
            $buyNow->save();
            return redirect()->route('modify_buy_now',$session_id);
        } else {
            $buyNow->save();
            return redirect()->route('modify_buy_now',$session_id);
        }
    }

    public function modifyBuyNow($session_id){
        $lists = Buynow::where('session_id',$session_id)->get();
        return view('pages.buy_now_modify',compact('lists'));
    }

    public function decrementBuynow(){
        $session_id = Session::get('session_id_buy');
        $cart = Buynow::where('session_id', $session_id)->first();
        $currentQuantity = $cart->quantity;

        if ($currentQuantity > 1) {
            $quantity = $cart->quantity - 1;
            $cart->quantity = $quantity;
            $cart->total_price = $cart->unit_price * $quantity;
            $cart->save();
            return redirect()->back();
        } else {
            $cart->delete();
            return redirect()->back();
        }
    }

    public function incrementBuynow(){
        $session_id = Session::get('session_id_buy');
        $cart = Buynow::where('session_id',$session_id)->first();
        $quantity = $cart->quantity + 1;
        $cart->quantity = $quantity;
        $cart->total_price = $cart->unit_price * $quantity;
        $cart->save();
        return redirect()->back();
    }

    public function deleteBuynowItem(){
        $session_id = Session::get('session_id_buy');
        Buynow::where('session_id',$session_id)->delete();
        Toastr::success('Product Successfully Removed');
        return redirect()->back();

    }

    // old
//    public function buyNow($product_id,$price,$discount){
//        if(Auth::check()){
//            $user_id = Auth::id();
//            $quantity = 1;
//            $unitPrice = $price;
//            $totalPrice = $price * $quantity;
//            $buyNow = new Buynow();
//            $buyNow->user_id = $user_id;
//            $session_id = Session::get('session_id');
//            if(empty($session_id)){
//                $session_id = $random = Str::random(40);
//                Session::put('session_id',$session_id);
//            }
//            $buyNow->session_id = $session_id;
//            $buyNow->product_id = $product_id;
//            $buyNow->quantity = $quantity;
//            $buyNow->unit_price = $unitPrice;
//            $buyNow->total_price = $totalPrice;
//            $buyNow->status = 3;
//            $buyNow->discount = $discount;
//            $check = Buynow::where('user_id',$user_id)->get();
//            if(sizeof($check) > 0){
//                foreach($check as $c){
//                    $c->delete();
//                }
//                $buyNow->save();
//                return redirect()->route('modify_buy_now',$user_id);
//            } else {
//                $buyNow->save();
//                return redirect()->route('modify_buy_now',$user_id);
//            }
//        } else {
//            $current_url = Session::get('current_url');
//            if(!empty($current_url)){
//                session()->put('current_url',Url::current());
//            }
//            return redirect()->route('login');
//        }
//    }
}
