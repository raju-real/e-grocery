<?php

namespace App\Http\Controllers;

use App\Model\Order;
use App\Model\Product;
use App\Model\Bazarlist;
use App\Model\Modifylist;
use App\Model\OrderProduct;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use URL;

class BazarListController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function modifyBazarList(){
        $currentList = Bazarlist::all();
        if(Auth::check()){
            $user_id = Auth::id();
            foreach($currentList as $list){
                $check = Modifylist::where('product_id',$list->product_id)->first();
                if(!isset($check)){
                    $modifyList = new Modifylist();
                    $modifyList->user_id = Auth::id();
                    $modifyList->product_id = $list->product_id;
                    $modifyList->quantity = $list->quantity;
                    $modifyList->unit_price = $list->unit_price;
                    $modifyList->total_price = $list->total_price;
                    $modifyList->save();
                }
            }
            return redirect()->route('modified_bazarlist');
        } else {
            Session::put('current_url', Url::current());
            return redirect()->route('login');
        }

    }

    public function modifiedBazarList(){
        if(Auth::check()){
            $lists = Modifylist::where('user_id',Auth::id())->get();
            return view('pages.bazarlist_modify',compact('lists'));
        } else {
            return redirect()->route('login');
        }
    }

    public function addBazarList(Request $request){
        $this->validate($request,[
            'product_id' => 'required',
            'quantity' => 'required'
        ]);
        if(Auth::check()){
            $user_id = Auth::id();
            $product_id = $request->product_id;
            $quantity = $request->quantity;
            $product = Product::where('id',$product_id)->first();
            if($product->discount_price != null){
                $price = $product->discount_price;
                $totalPrice = $price * $quantity;
            } else{
                $price = $product->unit_price;
                $totalPrice = $price * $quantity;
            }
            $list = new Modifylist();
            $list->user_id = $user_id;
            $list->quantity = $quantity;
            $list->product_id = $product_id;
            $list->unit_price = $price;
            $list->total_price = $totalPrice;
            $check = Modifylist::where('product_id',$product_id)
                ->where('user_id',$user_id)->get();
            if(sizeof($check) > 0){
                Toastr::info('Product Already Added To Bazar List');
                return redirect()->route('modified_bazarlist');

            } else {
                $list->save();
                Toastr::success('Product Successfully Added To Bazar List');
                return redirect()->back();
            }

        } else {
            return redirect()->route('login');
        }
    }

    public function decrementList($list_id){
        if(Auth::check()) {
            $user_id = Auth::id();
            $cart = Modifylist::where('id', $list_id)->where('user_id', $user_id)->first();
            $currentQuantity = $cart->quantity;
            if ($currentQuantity > 1) {
                $quantity = $cart->quantity - 1;
                $price = $cart->unit_price * $quantity;
                $cart->total_price = $price;
                $cart->quantity = $quantity;
                $cart->save();
                return redirect()->route('modified_bazarlist');
            } else {
                $cart->delete();
                return redirect()->route('modified_bazarlist');
            }
        }
    }

    public function incrementList($list_id){
        if(Auth::check()){
            $user_id = Auth::id();
            $cart = Modifylist::where('id',$list_id)
                ->where('user_id',$user_id)->first();
            $quantity = $cart->quantity + 1;
            $price = $cart->unit_price * $quantity;
            $cart->total_price = $price;
            $cart->quantity = $quantity;
            $cart->save();
            return redirect()->route('modified_bazarlist');
        }
    }

    public function deleteBazarlistItem($id){
        if(Auth::check()){
            $user_id = Auth::id();
            $list = Modifylist::find($id);
            $list->delete();
            Toastr::success('Product Successfully Removed');
            return redirect()->route('modified_bazarlist');
        } else {
            return redirect()->route('login');
        }
    }

    public function checkoutBazarList(){
        if(Auth::check()){
            $user_id = Auth::id();
            $carts = Modifylist::with('product')->where('user_id',$user_id)
                ->get();

            return view('pages.bazarlist_checkout',compact('carts','products'));
        } else {
            return redirect()->route('login');
        }
    }

    public function placeBazarListOrder(Request $request){
        $order = new Order();
        if(Auth::check()){
            $user_id = Auth::id();

            $latestOrder = Order::latest()->first();
            if($latestOrder){
                $orderNumber = $latestOrder->order_number;
                if($orderNumber != null){
                    $order->order_number = sprintf('%04d',$orderNumber + 1);;
                } else {
                    $order->order_number = sprintf('%04d',0 + 1);
                }
            } else{
                $order->order_number = sprintf('%04d',0 + 1);
            }

            $order->user_id = $user_id;
            //$randomString = Str::random(10);
            $randomString = "EG-".mt_rand(100000,999999);
            $order->invoice = $randomString;
            $order->payment = $request->payment;
            $order->status = 1;
            $order->total_price = $request->total;
            $order->address = $request->address;
            $order->save();

            foreach($request->products as $product){
                $order_product = new OrderProduct();
                $order_product->order_id = $order->id;
                $order_product->product_id = $product;
                $getProduct = Product::find($product);
                $carts = Modifylist::where('user_id',$user_id)
                    ->where('product_id',$product)
                    ->get();
                foreach($carts as $cart){
                    $quantity = $cart->quantity;
                    $order_product->quantity = $quantity;
                    $cart->delete();
                }

                if($getProduct->discount_price != null){
                    $price = $getProduct->discount_price * $quantity;
                } else {
                    $price = $getProduct->unit_price * $quantity;
                }
                $order_product->total_price = $price;
                $order_product->status = 1;
                $order_product->save();
            }
            Toastr::success('Your Order Placed');
            return redirect()->route('home');
        } else {
            Toastr::info('Please Login First');
            return redirect()->route('login');
        }
    }

}
