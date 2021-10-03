<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Model\Product;
use Illuminate\Support\Str;
use App\Model\Cart;


class CartController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    // Add TO cart with session
    public function addToCart(Request $request){
        if(Auth::check()){
            $user_id = Auth::id();
        } else {
            $user_id = null;
        }
        $session_id = Session::get('session_id');
        if(empty($session_id)){
            $session_id = $random = Str::random(40);
            Session::put('session_id',$session_id);
        }
        $product_id = $request->product_id;
        if($request->has('quantity')){
            $quantity = $request->quantity;
        } else {
            $quantity = 1;
        }
        $product = Product::where('id',$product_id)->first();
        $totalPrice = $request->price * $quantity;
        $cart = new Cart();
        $cart->session_id = $session_id;
        $cart->user_id = $user_id;
        $cart->quantity = $quantity;
        $cart->product_id = $product_id;
        $cart->unit_price = $request->price;
        $cart->total_price = $totalPrice;
        $cart->status = 1;
        if(isset($request->discount)){
            $cart->discount = $request->discount;
        } else {
            $cart->discount = 1;
        }
        $check = Cart::where('session_id',$session_id)->where('product_id',$product_id)
            ->get();
        if(sizeof($check) > 0){
            Toastr::info('Product Already Added To Cart');
            return redirect()->route('home');

        } else {
            $cart->save();
            Toastr::success('Product Successfully Added ');
            return redirect()->route('home');
        }
    }

    public function atc(Request $request){
        if(Auth::check()){
            $user_id = Auth::id();
        } else {
            $user_id = null;
        }
        $session_id = Session::get('session_id');
        if(empty($session_id)){
            $session_id = $random = Str::random(40);
            Session::put('session_id',$session_id);
        }

        $product_id = $request->product_id;
        $product = Product::where('id',$product_id)->first();
        $quantity = 1;
        $totalPrice = $request->price * $quantity;
        $cart = new Cart();
        $cart->session_id = $session_id;
        $cart->user_id = $user_id;
        $cart->quantity = $quantity;
        $cart->product_id = $product_id;
        $cart->unit_price = $request->price;
        $cart->total_price = $totalPrice;
        $cart->status = 1;
        if(isset($request->discount)){
            $cart->discount = $request->discount;
        } else {
            $cart->discount = 1;
        }

        $check = Cart::where('session_id',$session_id)->where('product_id',$product_id)
            ->get();

        if(sizeof($check) > 0){
            Toastr::info('Product Already Added To Cart');
            if(isset($request->from_single_page)){
                return redirect()->route('shopping_cart');
            } else {
                return redirect()->back();
            }
            

        } else {
            $cart->save();
            Toastr::success('Product Successfully Added ');
            if(isset($request->from_single_page)){
                return redirect()->route('shopping_cart');
            } else {
                return redirect()->back();
            }
        }
    }


    public function shoppingCart(){
        $session_id = Session::get('session_id');
        if(empty($session_id)){
            $carts = array();
        } else {
            $carts = Cart::with('product')->where('session_id',$session_id)
                ->get();
        }
        return view('pages.shopping_cart',compact('carts'));
//        if(sizeof($carts) > 0){
//            return view('pages.shopping_cart',compact('carts','products'));
//        } else {
//            Toastr::warning('Your Cart Is Empty');
//            return redirect()->back();
//        }

    }

    public function decrement($cart_id)
    {
        $session_id = Session::get('session_id');
        $cart = Cart::where('id', $cart_id)->where('session_id', $session_id)->first();
        $currentQuantity = $cart->quantity;

        if ($currentQuantity > 1) {
            $quantity = $cart->quantity - 1;
            $price = $cart->unit_price * $quantity;
            $cart->total_price = $price;
            $cart->quantity = $quantity;
            $cart->save();
            return redirect()->back();
        } else {
            $cart->delete();
            return redirect()->back();
        }
    }


    public function increment($cart_id){
        $session_id = Session::get('session_id');
        $cart = Cart::where('id',$cart_id)
            ->where('session_id',$session_id)->first();
        $quantity = $cart->quantity + 1;
        $incrementPrice =  $cart->unit_price * $quantity;
        $cart->total_price = $incrementPrice;
        $cart->quantity = $quantity;
        $cart->save();
        return redirect()->back();
    }

    public function productRemove($product_id){
        $session_id = Session::get('session_id');
        $cart = Cart::where('session_id',$session_id)->where('product_id',$product_id)
            ->first();
        $cart->delete();
        Toastr::success('Product Successfully Remove From Cart');
        return redirect()->back();
    }

    public function clearCart(){
        $session_id = Session::get('session_id');
        $carts = Cart::where('session_id',$session_id)->get();
        foreach($carts as $cart){
            $cart->delete();

        }
        return redirect()->back();
    }


    // Auth User Add To Cart
//    public function addToCart(Request $request){
//        if(Auth::check()){
//            $user_id = Auth::id();
//            $product_id = $request->product_id;
//            if($request->has('quantity')){
//                $quantity = $request->quantity;
//            } else {
//                $quantity = 1;
//            }
//            $product = Product::where('id',$product_id)->first();
//            $totalPrice = $request->price * $quantity;
//            $cart = new Cart();
//            $cart->user_id = $user_id;
//            $cart->quantity = $quantity;
//            $cart->product_id = $product_id;
//            $cart->unit_price = $request->price;
//            $cart->total_price = $totalPrice;
//            $cart->status = 1;
//            $check = Cart::where('user_id',$user_id)->where('product_id',$product_id)
//                ->get();
//            if(sizeof($check) > 0){
//                Toastr::info('Product Already Added To Cart');
//                return redirect()->back();
//
//            } else {
//                $cart->save();
//                Toastr::success('Product Successfully Added ');
//                return redirect()->back();
//            }
//
//        } else {
//            return redirect()->route('login');
//        }
//    }
//
//    public function atc(Request $request){
//        if(Auth::check()){
//            $user_id = Auth::id();
//            $product_id = $request->product_id;
//            $quantity = 1;
//            $totalPrice = $request->price * $quantity;
//            $cart = new Cart();
//            $cart->user_id = $user_id;
//            $cart->quantity = $quantity;
//            $cart->product_id = $product_id;
//            $cart->unit_price = $request->price;
//            $cart->total_price = $totalPrice;
//            $cart->status = 1;
//            $check = Cart::where('user_id',$user_id)->where('product_id',$product_id)
//                ->get();
//            if(sizeof($check) > 0){
//                Toastr::info('Product Already Added To Cart');
//                return redirect()->back();
//
//            } else {
//                $cart->save();
//                Toastr::success('Product Successfully Added ');
//                return redirect()->back();
//            }
//
//        } else {
//            return redirect()->route('login');
//        }
//    }
//
//    public function shoppingCart(){
//        if(Auth::check()){
//            $user_id = Auth::id();
//            $carts = Cart::with('product')->where('user_id',$user_id)
//                ->get();
//
//            return view('pages.shopping_cart',compact('carts','products'));
//        } else {
//            return redirect()->route('login');
//        }
//    }
//
//    public function decrement($cart_id)
//    {
//        if (Auth::check()) {
//            $user_id = Auth::id();
//            $cart = Cart::where('id', $cart_id)->where('user_id', $user_id)->first();
//            $currentQuantity = $cart->quantity;
//
//            if ($currentQuantity > 1) {
//                $quantity = $cart->quantity - 1;
//                $price = $cart->unit_price * $quantity;
//                $cart->total_price = $price;
//                $cart->quantity = $quantity;
//                $cart->save();
//                return redirect()->back();
//            } else {
//                $cart->delete();
//                return redirect()->back();
//            }
//        }
//    }
//
//
//    public function increment($cart_id){
//        if(Auth::check()){
//            $user_id = Auth::id();
//            $cart = Cart::where('id',$cart_id)
//                ->where('user_id',$user_id)->first();
//            $quantity = $cart->quantity + 1;
//            $incrementPrice =  $cart->unit_price * $quantity;
//            $cart->total_price = $incrementPrice;
//            $cart->quantity = $quantity;
//            $cart->save();
//            return redirect()->back();
//        }
//    }
//
//    public function productRemove($product_id){
//        if(Auth::check()){
//            $cart = Cart::where('user_id',Auth::user()->id)->where('product_id',$product_id)
//                ->first();
//            $cart->delete();
//            Toastr::success('Product Successfully Remove From Cart');
//            return redirect()->back();
//        }
//    }
//
//    public function clearCart(){
//        if(Auth::check()){
//            $user = Auth::id();
//            $carts = Cart::where('user_id',$user)->get();
//            foreach($carts as $cart){
//                $cart->delete();
//
//            }
//            return redirect()->back();
//        } else {
//            return redirect()->back();
//        }
//    }
}
