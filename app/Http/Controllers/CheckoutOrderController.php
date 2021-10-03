<?php

namespace App\Http\Controllers;

use App\Mail\OrderShipped;
use App\Model\Modifylist;
use App\Model\Order;
use App\Model\OrderProduct;
use App\Model\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\Product;
use App\Model\Cart;
use App\Model\Buynow;
use App\Model\Coupon;
use App\Model\CouponUser;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use URL;

class CheckoutOrderController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public $totalPrice=0;
    public function checkoutProuduct($status){
        if(Auth::check()){
            $user_id = Auth::id();
            $session_id = Session::get('session_id');
            if($status == 1){
                $carts = Cart::with('product')
                    ->where('session_id',$session_id)
                    ->get();
                $flag = Cart::where('session_id',$session_id)->where('discount',2)->first();
                if($flag){
                    $broken = 'no';
                } else {
                    $broken = 'yes';
                }

            } elseif($status == 2){
                $carts = Modifylist::with('product')
                    ->where('user_id',$user_id)
                    ->get();
                $broken = 'yes';
            }  elseif($status == 3){
                $session_id_buy = Session::get('session_id_buy');
                $carts = Buynow::with('product')
                    ->where('session_id',$session_id_buy)
                    ->get();
                $flag = Buynow::where('session_id',$session_id_buy)
                    ->where('discount',2)->first();
                if($flag){
                    $broken = 'no';
                } else {
                    $broken = 'yes';
                }
            }
            $price = 0;
            if($this->totalPrice == 0){
                foreach($carts as $cart){
                $price += $cart->total_price;
                $this->totalPrice = $price;
                $totalPrice = $this->totalPrice;
                }
            } else {
                $totalPrice = $this->totalPrice;
            }

            return view('pages.checkout',compact('carts','status','totalPrice','broken'));
        } else {
            $current_url = Session::get('current_url');
            if(!empty($current_url)){
                Session::forget('current_url');
                Session::put('current_url',Url::current());

            } else {
                Session::put('current_url',Url::current());
            }

            return redirect()->route('login');
        }
    }

    public $submitMode = false;

    public function applyCoupon(Request $request){
         $status = $request->status;
        if(Auth::check()){
            $checkCoupon = Coupon::where('coupon_code',$request->coupon)->first();
            if(isset($checkCoupon)){
                if($checkCoupon->status == 1 && $checkCoupon->end_date > Carbon::today()){
                    $usesCheck = CouponUser::where('coupon_id',$checkCoupon->id)
                    ->where('user_id',Auth::id())->get();
                    if(sizeof($usesCheck)>0){
                        Toastr::warning('You Already Use This Coupn');
                        return redirect()->route('checkout',$status);
                    } else {
                        if($checkCoupon->user_type == 1){
                        $this->submitMode = true;
                        } elseif($checkCoupon->user_type == 2){
                            $check = Order::where('user_id',Auth::id())->get();
                            if(sizeof($check)>0){
                                Toastr::info('You Are Not Eligible For This Coupon');
                                return redirect()->route('checkout',$status);
                            } else{
                                $this->submitMode = true;
                            }
                        } elseif($checkCoupon->user_type == 3){

                        } else {
                            Toastr::error('Invalid User Type');
                            return redirect()->route('checkout',$status);
                        }
                        // Calculation start
                            if($this->submitMode == true){
                                $total_price = $request->total_price;
                                if($total_price >= $checkCoupon->minimum_cost){
                                    if($checkCoupon->coupon_type == 1){
                                        $totalPrice = $request->total_price - $checkCoupon->discount_amount;
                                    $this->totalPrice = $totalPrice;
                                    } elseif($checkCoupon->coupon_type == 2){
                                        $totalPrice = $request->total_price - $checkCoupon->discount_amount;
                                    $this->totalPrice = $totalPrice;
                                    }
                                } else {
                                    Toastr::info('Minimum Shop '.$checkCoupon->minimum_cost);
                                    return redirect()->route('checkout',$status);
                                }
                                $user_id = Auth::id();
                                    if($status == 1){
                                        $carts = Cart::with('product')
                                                ->where('user_id',$user_id)
                                                ->get();
                                        } elseif($status == 2){
                                            $carts = Modifylist::with('product')
                                                ->where('user_id',$user_id)
                                                ->get();
                                        }  elseif($status == 3){
                                            $carts = Buynow::with('product')
                                                ->where('user_id',$user_id)
                                                ->get();
                                        }
                                $user_coupon = new CouponUser();
                                $user_coupon->coupon_id = $checkCoupon->id;
                                $user_coupon->user_id = Auth::id();
                                $user_coupon->save();
                                //return redirect()->route('checkout',$status);
                                Toastr::success('Coupon Appliyed');
                                return $this->checkoutProuduct($status);
                                // return view('pages.checkout',compact('carts','products','status','totalPrice'));
                            }
                        // Calculation End
                    }

                } else{
                    Toastr::error('Coupon Expired');
                    return redirect()->route('checkout',$status);
                }
            } else{
                Toastr::error('Invalid Coupon Code');
                return redirect()->route('checkout',$status);
            }
        } else {
            Toastr::error('login first');
            return redirect()->route('login');
        }
    }

    public function brokePoints(Request $request){
        $this->validate($request,['points'=>'required']);
        $status = $request->status;
        if(Auth::check()){
            $user = Auth::user();
            $currentPoints = $user->points;
            $brokenPoints = $request->points;
            if($brokenPoints > $currentPoints){
                Toastr::error('Insufficient Points');
                return redirect()->route('checkout',$status);
            } elseif($brokenPoints > $request->total_price){
                Toastr::info('Points should be equal or less from total price');
                return redirect()->route('checkout',$status);
            }
            // Calculation Part
            //$discount = ($brokenPoints * 10) / 100;
            $totalPrice = $request->total_price - $brokenPoints;
            $user->points = $currentPoints - $brokenPoints;
            $user->save();
            $this->totalPrice = $totalPrice;
            Toastr::success('Points Broken');
            return $this->checkoutProuduct($status);
        }
    }

    public function placeOrder(Request $request){
        $status =  $request->status;
        $order = new Order();
        if(Auth::check()){
            $user_id = Auth::id();
            $order->order_number = Order::getOrderNumber();
            $orderInvoice = Order::getInvoiceNumber();
            $order->invoice = $orderInvoice;
            $order->user_id = $user_id;
            $order->payment = $request->payment;
            $order->status = 1;
            $order->total_price = $request->total;
            $order->address = $request->address;
            $order->save();

            foreach($request->products as $product){
                $order_product = new OrderProduct();
                $order_product->order_id = $order->id;
                $order_product->product_id = $product;
                $session_id = Session::get('session_id');
                if($status == 1){
                    $carts = Cart::where('session_id', $session_id)
                        ->where('product_id',$product)
                        ->get();
                } elseif($status == 2){
                    $carts = Modifylist::where('session_id', $session_id)
                        ->where('product_id',$product)
                        ->get();
                } elseif($status == 3){
                    $carts = Buynow::where('session_id', $session_id)
                        ->where('product_id',$product)
                        ->get();
                }

                foreach($carts as $cart){
                    $quantity = $cart->quantity;
                    $order_product->quantity = $quantity;
                    $order_product->unit_price = $cart->unit_price;
                    $price = $cart->unit_price * $quantity;
                    $order_product->total_price = $price;
                    $order_product->status = 1;
                    $order_product->save();
                    $cart->delete();
                }

            }
            // Sms Send
            $user = User::find($user_id);
            $mobile_no = $user->mobile;
            $text = "Dear ".$user->name.","."Your order has been placed . "
                ."Invoice No: ".$orderInvoice."."
                ."Total Amount :". $request->total.".\n"
                ."E-Grocery";
            $message = $text;
            //app('App\Http\Controllers\CommonController')->sendSms($mobile_no,$message);
           // Sms send end
           // Email send start
        //    if($user->email != null){
        //        $mail = [
        //            'name'=>$user->name,
        //            'invoice' => $orderInvoice,
        //            'total' => $request->total
        //         ];
        //        Mail::to($user->email)->send(new OrderShipped($mail));
        //    }
           // Email send End
            Toastr::success('Your Order Placed');
            return redirect()->route('user.dashboard');
        } else {
            Toastr::info('Please Login First');
            return redirect()->route('login');
        }
    }
}
