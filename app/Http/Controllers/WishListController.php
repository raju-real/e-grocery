<?php

namespace App\Http\Controllers;

use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\Product;
use App\Model\Cart;
use App\Model\Favorite;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class WishListController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }


    public function favoriteToCart($product_id,$price){
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

        $quantity = 1;
        $totalPrice = $price * $quantity;
        $cart = new Cart();
        $cart->session_id = $session_id;
        $cart->user_id = $user_id;
        $cart->quantity = $quantity;
        $cart->product_id = $product_id;
        $cart->unit_price = $price;
        $cart->total_price = $totalPrice;
        $cart->status = 1;
        if(isset($discount)){
            $cart->discount = $discount;
        } else {
            $cart->discount = 1;
        }

        $check = Cart::where('session_id',$session_id)->where('product_id',$product_id)
            ->get();
        if(sizeof($check) > 0){
            Toastr::info('Product Already Added To Cart');
            return redirect()->back();

        } else {
            $cart->save();
            Toastr::success('Product Successfully Added ');
            return redirect()->back();
        }
    }

    public function addToFavorite($product_id){
        if(Auth::check()){
            $user_id = Auth::id();
            $check = Favorite::where('user_id',$user_id)->where('product_id',$product_id)
                ->get();
            if(sizeof($check) > 0){
                Toastr::error('Product Already Added To Favorite List');
                return redirect()->back();
            } else{
                $favorite = new Favorite();
                $favorite->user_id = $user_id;
                $favorite->product_id = $product_id;
                $favorite->save();
                Toastr::success('Product Added To Favorite List');
                return redirect()->back();
            }
        } else {
            return redirect()->route('login');
        }
    }

    public function favoriteList(){
        if(Auth::check()){
            $favorites = Favorite::with('product')->where('user_id',Auth::user()->id)->get();
            return view('pages.favorite_list',compact('favorites'));
        } else{
            Toastr::info('Login In First');
            return redirect()->route('login');
        }
    }

    public function removeFavorite($product_id){
        if(Auth::check()){
            $favorite = Favorite::where('user_id',Auth::id())
                ->where('product_id',$product_id)
                ->first();
            $favorite->delete();
            Toastr::success('Product Removed From Favorite List');
            return redirect()->back();
        }
    }

    public function clearWishlist(){
        $favorites = Favorite::where('user_id',Auth::id())->get();
        foreach ($favorites as $favorite) {
            $favorite->delete();
        }
        Toastr::info('Your WishLists Successfully Removed');
        return redirect()->back();
    }

    public function addOnCart(){
        $favorites = Favorite::where('user_id',Auth::id())->get();
        foreach ($favorites as $favorite) {
            $cart = new Cart();
            $cart->user_id = Auth::id();
            $cart->product_id = $favorite->product_id;
            $cart->quantity = 1;
            $product = Product::where('id',$favorite->product_id)->first();
            if($product->discount_price != null){
                $price = $product->discount_price;
                $totalPrice = $price * $cart->quantity;
            } else {
                $price = $product->unit_price;
                $totalPrice = $price * $cart->quantity;
            }
            $cart->unit_price = $price;
            $cart->total_price = $totalPrice;
            $cart->status = 1;
            $cart->save();
        }
        Toastr::info('Your WishLists Product Added ON Your Cart');
        return redirect()->back();
    }
}
