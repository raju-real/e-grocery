<?php
namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Model\Cart;
use App\Model\User;
use App\Model\Order;
use App\Model\Buynow;
use App\Model\Coupon;
use App\Model\Review;
use App\Model\Slider;
use App\Model\Popular;
use App\Model\Product;
use App\Model\Upazila;
use App\Model\Category;
use App\Model\District;
use App\Model\Favorite;
use App\Model\Bazarlist;
use App\Model\Promotion;
use App\Model\CouponUser;
use App\Model\Modifylist;
use App\Mail\OrderShipped;
use App\Model\Subcategory;
use App\Model\OrderProduct;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Model\Subsubcategory;
use App\Model\Promotionproduct;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;


class ApiController extends Controller
{
    public function allProduct(){
        $products = Product::with('images','sizes','colors','units')
            ->get();
        return $products;
    }

    public function searchProduct(Request $request){
        // return ['redirect' => route('login')];
        $query = $request->get('query');
        $products = Product::where('product_name','LIKE',"%$query%")
            ->get();
        return [ 'products' => $products ];
    }

    public function paginateProduct(){
        $products = Product::with('images','sizes','colors','units','todayoffer','weeklyoffer')
            ->paginate(10);
        return $products;
    }

    public function popularProduct(){
        $populars = Popular::with('product','product.images','product.todayoffer','product.weeklyoffer')
        ->latest()->get();
        return $populars;
    }


    public function productDetails($id){
        $product = Product::with('images','sizes','colors','units','todayoffer','weeklyoffer')
            ->where('id',$id)->first();
        return $product;
    }

    public function todayOffer(){
        $products = Product::with('images','sizes','colors')
            ->where('discount_price', '!=', null)->latest()->get();
        return $products;
    }

    public function getCategory(){
        $category = Category::with('subcategories')->get();
        return $category;
    }

    public function getSubCategory($category_id){
    	$sub_category = Subcategory::where('category_id',$category_id)->get();
    	return $sub_category;
    }

    public function subSubCategory($subcategory_id){
        $subsubcategories = Subsubcategory::where('subcategory_id',$subcategory_id)->get();
        return $subsubcategories;
    }

    public function getProduct($category_id,$subcategory_id,$subsubcategory_id){
        if($subsubcategory_id == "NULL"){
            $subsubcategory_id = null;
        } elseif ($subcategory_id == "NULL") {
            $subcategory_id = null;
        }
        $products = Product::with('todayoffer','weeklyoffer')->where('category_id',$category_id)
                    ->where('subcategory_id',$subcategory_id)
                    ->where('subsubcategory_id',$subsubcategory_id)->get();
        return $products;
    }

    public function categoryProduct($id){
        $products = Product::with('images','sizes','colors','todayoffer','weeklyoffer')
            ->where('category_id',$id)->latest()->get();
        return $products;
    }

    public function subCategoryProduct($id){
        $products = Product::with('images','sizes','colors','todayoffer', 'weeklyoffer')
            ->where('subcategory_id',$id)->latest()->get();
        return $products;
    }

    public function addToCart(Request $request,$token){
        //$user = User::where('token',$token)->first();
        // if(auth('api')->check()){
        //     $user_id = auth('api')->user()->id;
        // } else {
        //     $user_id = null;
        // }
        $user_id = null;
        $device_id = $token;
        $product_id = $request->product_id;
        $price = $request->price;
        $cart = Cart::where('device_id',$device_id)->where('product_id',$product_id)->first();
        if($cart){
            $quantity = $cart->quantity + 1;
            $totalPrice = $cart->unit_price * $quantity;
            $cart->user_id = $user_id;
            $cart->device_id = $device_id;
            $cart->quantity = $quantity;
            $cart->product_id = $product_id;
            $cart->total_price = $totalPrice;
            $cart->status = 1;
            if(isset($request->discount)){
                $cart->discount = $request->discount;
            } else {
                $cart->discount = 1;
            }
            $cart->save();
            return $cart;
        } else{
            $quantity           = 1;
            $totalPrice         = $price * $quantity;
            $cart               = new Cart();
            $cart->device_id    = $device_id;
            $cart->quantity     = $quantity;
            $cart->product_id   = $product_id;
            $cart->unit_price   = $price;
            $cart->total_price  = $totalPrice;
            $cart->size         = $request->size;
            $cart->color        = $request->color;
            $cart->status       = 1;
            if(isset($request->discount)){
                $cart->discount = $request->discount;
            } else {
                $cart->discount = 1;
            }
            $cart->save();
            return $cart;
        }
    }

    public function shoppingCart($token){
        //$user = User::where('token',$token)->first();
        //$user_id =$user->id;
        // $carts = Cart::with('product','product.images','product.todayoffer','product.weeklyoffer')
        // ->where('user_id',$user_id)
        //     ->get()->toArray();
        $device_id = $token;
        $carts = Cart::with('product', 'product.images',
        'product.todayoffer', 'product.weeklyoffer')->where('device_id', $device_id)->get();
        if(isset($carts)){
            return $carts;
        } else {
            return response()->json(['message','Invalid Request']);
        }

    }

    public function decrement(Request $request,$token){
        //$user = User::where('token',$token)->first();
        //$user_id = $user->id;
        $device_id = $token;
        $cart = Cart::where('device_id',$device_id)
            ->where('product_id',$request->product_id)->first();
        if(isset($cart)){
            $currentQuantity = $cart->quantity;
            if ($currentQuantity > 1) {
                $quantity = $cart->quantity - 1;
                $cart->total_price = $cart->unit_price * $quantity;
                $cart->quantity = $quantity;
                $cart->save();
                return response()->json(['success' => 'Operatoin Successfull']);
            } else {
                $cart->delete();
                return response()->json(['success' => 'Your Product Has Been Removed Form Cart']);
            }
        } else {
            return response()->json(['error' => 'Invalid Request']);
        }

    }

    public function increment($token,$product_id){
        //$user = User::where('token',$token)->first();
        //$user_id = $user->id;
        $device_id = $token;
        $cart = Cart::where('device_id',$device_id)
            ->where('product_id',$product_id)->first();
        if(isset($cart)){
            $quantity = $cart->quantity + 1;
            $cart->total_price = $cart->unit_price * $quantity;
            $cart->quantity = $quantity;
            $cart->save();
            return response()->json(['Success' => 'Product Added To Cart']);
        } else {
            return response()->json(['error' => 'Invalid Request']);
        }
    }

    public function singleProductClear($token,$product_id){
        //$user = User::where('token',$token)->first();
        $product = $product_id;
        $device_id = $token;
        Cart::where('device_id',$device_id)->where('product_id',$product)
            ->delete();
        $carts = Cart::with('product')->where('device_id',$device_id)
            ->get();
        return $carts;
    }

    public function clearShoppingCart($token){
        //$user = User::where('token',$token)->first();
        $device_id = $token;
        $carts = Cart::where('device_id',$device_id)->get();
        foreach($carts as $cart){
            $cart->delete();
        }
        return response()->json(['success'=>'Cart Removed Successfully']);
    }

    // New Place Order Function

    public $submitMode = false;

    public $totalPrice=0;

    public function applyCoupon(Request $request,$token){
        //$user = User::where('token',$token)->first();
        //$user_id = $user->id;
        $user_id = auth('api')->user()->id;
        $status = $request->status;
        $checkCoupon = Coupon::where('coupon_code',$request->coupon)->first();
        if(isset($checkCoupon)){
            if($checkCoupon->status == 1 && $checkCoupon->end_date > Carbon::today()){
                $usesCheck = CouponUser::where('coupon_id',$checkCoupon->id)
                    ->where('user_id',$user_id)->get();
                if(sizeof($usesCheck)>0){
                    return response()->
                    json(['message'=>'You Already Use This Coupn']);

                } else {
                    if($checkCoupon->user_type == 1){
                        $this->submitMode = true;
                    } elseif($checkCoupon->user_type == 2){
                        $check = Order::where('user_id',$user_id)->get();
                        if(sizeof($check)>0){
                            return response()->json(
                                [
                                'message'=>'You Are Not Eligible For This Coupon'
                                ]);
                        } else{
                            $this->submitMode = true;
                        }
                    } elseif($checkCoupon->user_type == 3){

                    } else {
                        return response()->json(['message'=>'Invalid User Type']);
                    }
                    // Calculation start
                    if($this->submitMode == true){
                        $total_price = $request->total_price;
                        if($total_price >= $checkCoupon->minimum_cost){
                            if($checkCoupon->coupon_type == 1){
                                $totalPrice = $request->total_price -
                                    $checkCoupon->discount_amount;
                                $this->totalPrice = $totalPrice;
                            } elseif($checkCoupon->coupon_type == 2){
                                $totalPrice = $request->total_price -
                                    $checkCoupon->discount_amount;
                                $this->totalPrice = $totalPrice;
                            }
                        } else {
                            return response()
                                ->json(['message','Minimum Shop '
                                    .$checkCoupon->minimum_cost]);
                        }
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
                        $user_coupon->user_id = $user_id;
                        $user_coupon->save();
                        //return redirect()->route('checkout',$status);
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
                        return response()->json([
                            'message' => 'Coupon Applied',
                            'total' => $totalPrice
                        ]);
                    }
                    // Calculation End
                }

            } else{
                return response()->json([
                    'message' => 'Coupon Expired',
                ]);
            }
        } else{
            return response()->json([
                'message' => 'Invalid Coupon Code',
            ]);
        }

    }

    public function brokePoints(Request $request,$token){
        $this->validate($request,['points'=>'required']);
        $status = $request->status;
        $user = User::where('token',$token)->first();
        $currentPoints = $user->points;
        $brokenPoints = $request->points;
        if($brokenPoints > $currentPoints){
            return response()->json(['message','Insufficient Points']);
        } elseif ($brokenPoints > $request->total_price) {
            return response()->json(['message', 'Points should be equal or less from total price']);
        }
        // Calculation Part
        //$discount = ($brokenPoints * 10) / 100;
        $totalPrice = $request->total_price - $brokenPoints;
        $user->points = $currentPoints - $brokenPoints;
        $user->save();
        $this->totalPrice = $totalPrice;
        return response()->json([
            'message' => 'Points Broken',
            'total' => $totalPrice
        ]);
    }

    public function placeOrder(Request $request,$token){
        $status =  $request->status;
        $order = new Order();
            //$user = User::where('token',$token)->first();
            $user                   = auth('api')->user();
            $user_id                = auth('api')->user()->id;
            $order->order_number    = Order::getOrderNumber();
            $orderInvoice           = Order::getInvoiceNumber();
            $order->invoice         = $orderInvoice;
            $order->user_id         = $user_id;
            $order->payment         = $request->payment;
            $order->status          = 1;
            $order->total_price     = $request->total;
            $order->address         = $request->address;
            $order->save();

            foreach($request->products as $product){
                $order_product = new OrderProduct();
                $order_product->order_id = $order->id;
                $order_product->product_id = $product;
                $getProduct = Product::find($product);
                $device_id = $token;
                if($status == 1){
                    $carts = Cart::where('device_id', $device_id)
                            ->where('product_id',$product)
                            ->get();
                } elseif($status == 2){
                    $carts = Modifylist::where('user_id',$user_id)
                            ->where('product_id',$product)
                            ->get();
                } elseif($status == 3){
                    $carts = Buynow::where('user_id',$user_id)
                            ->where('product_id',$product)
                            ->get();
                } else {
                    return "Faceing Error";
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
            // Sms Sending
            $mobile_no = $user->mobile;
            $text = "Dear ".$user->name.","."Your order has been placed . "
                ."Invoice No: ".$orderInvoice."."
                ."Total Amount :". $request->total.".\n"
                ."E-Grocery";
            $message = $text;
            //app('App\Http\Controllers\CommonController')->sendSms($mobile_no,$message);
            //$this->sendSms($mobile_no,$message);
            // Sms send end
            // Email send start
            // if ($user->email != null) {
            //     $mail = [
            //         'name' => $user->name,
            //         'invoice' => $orderInvoice,
            //         'total' => $request->total
            //     ];
            //     Mail::to($user->email)->send(new OrderShipped($mail));
            // }
           // Email send End
            return $order;
            //return response()->json(['success'=>'Your Order Has Been Received']);
    }


    // Bazar List Part
    public function bazarList(){
        $bazarLists = Bazarlist::with('product')->latest()->get();
        return $bazarLists;
    }

    public function modifyBazarList($token){
        $currentList = Bazarlist::all();
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        foreach($currentList as $list){
            $modifyList = new Modifylist();
            $modifyList->user_id = $user_id;
            $modifyList->product_id = $list->product_id;
            $quantity = $list->quantity;
            $modifyList->quantity = $quantity;
            $product = Product::where('id',$list->product_id)->first();
            if($product->discount_price != null){
                $price = $product->discount_price;
                $totalPrice = $price * $quantity;
            } else{
                $price = $product->unit_price;
                $totalPrice = $price * $quantity;
            }
            $modifyList->unit_price = $price;
            $modifyList->total_price = $totalPrice;
            $check = Modifylist::where('user_id',$user_id)
                ->where('product_id',$list->product_id)->first();
            if(!($check)){
                $modifyList->save();
            }
        }
        $lists = Modifylist::with('product')->where('user_id',$user_id)->get();
        return $lists;
    }

    public function modifiedBazarlist($token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $lists = Modifylist::with('product')->where('user_id',$user_id)->get();
        return $lists;
    }

    public function addBazarList(Request $request,$token){
        $this->validate($request,[
            'product_id' => 'required',
            'quantity' => 'required'
        ]);
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
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
            return response()->json(['error'=>'Product Already Added To Bazar List']);

        } else {
            $list->save();
            $lists = Modifylist::with('product')
                ->where('user_id',$user_id)
                ->get();
            return $lists;
        }
    }

    public function singleItemClear($token,$product_id){
        $user = User::where('token',$token)->first();
        $product = $product_id;
        $cart = Modifylist::where('user_id',$user->id)->where('product_id',$product)
            ->first();
        $cart->delete();
        $carts = Modifylist::with('product')->where('user_id',$user->id)
            ->get();
        return $carts;
    }

    public function decrementBazarlist(Request $request,$token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $cart = Modifylist::where('user_id',$user_id)
            ->where('product_id',$request->product_id)->first();
        $currentQuantity = $cart->quantity;

        if($currentQuantity > 1){
            $quantity = $cart->quantity - 1;
            $price = $cart->unit_price * $quantity;
            $cart->quantity = $quantity;
            $cart->total_price = $price;
            $cart->save();
            return response()->json(['success'=>'Operatoin Successfull']);
        } else{
            $cart->delete();
            return response()->json(['success'=>'ProductRemoved Form Bazar List']);
        }
    }

    public function incrementBazarList($token,$product_id){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $cart = Modifylist::where('product_id',$product_id)
            ->where('user_id',$user_id)->first();
        $quantity = $cart->quantity + 1;
        $price = $cart->unit_price * $quantity;
        $cart->quantity = $quantity;
        $cart->total_price = $price;
        $cart->save();
        return response()->json(['success'=>'Product Added On Bazar List']);
    }

    public function checkoutBazarList($token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $carts = Modifylist::with('product')->where('user_id',$user_id)
            ->get();
        return $carts;
    }

    public function placeBazarListOrder(Request $request,$token){
        $order = new Order();
        $user = User::where('token',$token)->first();
        $user_id =$user->id;

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
        $randomString = Str::random(10);
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
        return $order;
    }

    // Bazar List Part End

    // Favorite Part Start

    public function addToFavorite($token,$product_id){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $check = Favorite::where('user_id',$user_id)->where('product_id',$product_id)
            ->get();
        if(sizeof($check) > 0){
            return response()->json(['success'=>'Product Already Added On WishList']);
        } else{
            $favorite = new Favorite();
            $favorite->user_id = $user_id;
            $favorite->product_id = $product_id;
            $favorite->save();
            return response()->json(['success'=>'Product Successfully Added On WishLis']);
        }
    }

    public function favoriteList($token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $favorites = Favorite::with('product')->where('user_id',$user_id)->get();
        return $favorites;
    }

    public function removeFavorite($token,$product_id){
        $user = User::where('token',$token)->first();
        $favorite = Favorite::where('user_id',$user->id)
                    ->where('product_id',$product_id)
                    ->first();
        $favorite->delete();
        return response()->json(['Success'=>'Product Removed From Favorite List']);
    }

    public function clearWishlist($token){
        $user = User::where('token',$token)->first();
        $favorites = Favorite::where('user_id',$user->id)->get();
        if(sizeof($favorites) > 0){
            foreach ($favorites as $favorite) {
            $favorite->delete();
        }
            return response()->json(['Success'=>'WishLists Removed Successfully']);
        } else {
            return response()->json(['Messege '=>'Your WishList Is Empty']);
        }
    }

    public function addOnCart(Request $request, $token){
        $user = User::where('token',$token)->first();
        $favorites = Favorite::where('user_id',$user->id)->get();
        if(sizeof($favorites) > 0){
            foreach ($favorites as $favorite) {
            $cart = new Cart();
            $cart->user_id = $user->id;
            $cart->product_id = $favorite->product_id;
            $cart->quantity = 1;
            $product = Product::where('id',$favorite->product_id)->first();
            if($product->discount_price != null){
                $totalPrice = $product->discount_price * $cart->quantity;
            } else {
                $totalPrice = $product->unit_price * $cart->quantity;
            }
            $cart->total_price = $totalPrice;
            $cart->status = 1;
            $cart->save();
        }
            return response()->json(['Messege '=>'WishLists Products Successfully Added On Cart']);
        } else {
            return response()->json(['Messege '=>'You WishLists Is Empty']);
        }
    }

    // Favorite Part End

    // Start Buy Now Part

    public function buyNow($token,$product_id,$price){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $quantity = 1;
        $buyNow = new Buynow();
        $buyNow->user_id = $user_id;
        $buyNow->product_id = $product_id;
        $buyNow->quantity = $quantity;
        $buyNow->unit_price = $price;
        $buyNow->total_price = $price * $quantity;
        $buyNow->status = 3;
        $check = Buynow::where('user_id',$user->id)->get();
        if(sizeof($check) > 0){
            return response()->json(['Message'=>'Accept  Only One Product']);
        } else {
            $buyNow->save();
            $buyNowProduct = Buynow::with('product','product.images')
                ->where('user_id',$user->id)->get();
            return  $buyNowProduct;
        }
    }

    public function decrementBuynow($token,$product_id){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $cart = Buynow::where('user_id',$user_id)
            ->where('product_id',$product_id)->first();
        $currentQuantity = $cart->quantity;

        if($currentQuantity > 1){
            $quantity = $cart->quantity - 1;
            $cart->quantity = $quantity;
            $cart->total_price = $cart->unit_price * $quantity;
            $cart->save();
            $buyNowProduct = Buynow::with('product')
                ->where('user_id',$user->id)->get();
            return  $buyNowProduct;
            //return response()->json(['Message'=>'Success']);
        } else{
            $cart->delete();
            return response()->json(['Message'=>'Product Removed']);
        }
    }

    public function incrementBuynow($token,$product_id){
        $user = User::where('token',$token)->first();
        $cart = Buynow::where('user_id',$user->id)
            ->where('product_id',$product_id)
            ->first();
        $quantity = $cart->quantity + 1;
        $cart->quantity = $quantity;
        $cart->total_price = $cart->unit_price * $quantity;
        $cart->save();
        $buyNowProduct = Buynow::with('product')
            ->where('user_id',$user->id)->get();
        return  $buyNowProduct;
        //return response()->json(['Message'=>'Success']);
    }

    public function deleteBuynowItem($token,$product_id){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $list = Buynow::where('user_id',$user_id)->where('product_id',$product_id)
            ->first();
        if($list){
            $list->delete();
            return response()->json(['Message'=>'Successfully Removed']);
        } else {
            return response()->json(['Message'=>'Invalid Request']);

        }
    }

    // End Buy Now

    // User Order Activity

    public function userOrders($token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $orders = Order::with('products.product')
            ->where('user_id',$user_id)->get();
        if(sizeof($orders) > 0){
            return response()->json([
                'status' => 'Data Found',
                'total_order' => $orders->count(),
                'orders' => $orders
            ]);
        } else {
            return response()->json([
                'status' => 'No Order Found',
                'total_order' => 0,
                'orders' => []
            ]);
        }
    }

    public function cancleOrder($token,$order_id){
        $user = User::where('token',$token)->first();
        $order = Order::where('user_id',$user->id)->where('id',$order_id)->first();
        if($order->status == 1){
            $order->status = '5';
            $order->save();
            return response()->json(['success'=>'Your Order Has Been Cancled']);
        } else {
            return response()->json(['success'=>'Your Order Is In On Process,You Can Not Cancle Now']);
        }
    }

    // User Order Activity End

    // Review Activity Start

    public function productReview($product_id){
        $review = Review::with('user')
            ->where('product_id',$product_id)->get();
        return $review;
    }

    public function saveReview(Request $request,$token){
        $user = User::where('token',$token)->first();
        if(isset($user)){
            $orders = Order::where('user_id',$user->id)->get();
            if(sizeof($orders)>0){
                foreach($orders as $order){
                    $orderProducts = OrderProduct::where('order_id',$order->id)
                        ->where('product_id',$request->product_id)->get();
                }
                if(sizeof($orderProducts) > 0){
                    $review = new Review();
                    $review->user_id = $user->id;
                    $review->product_id = $request->product_id;
                    $review->rating = $request->rating;
                    $review->comments = $request->comments;
                    $review->save();
                    return response()->json([
                        'message'=>'Thanks for your review',
                        'review'=>$review
                    ]);
                } else {
                    return response()->json([
                        'message'=>'Product Not Found In Your Order List'
                    ]);
                }
            } else{
                return response()->json(['message'=>'Product Not Found In Your Order List']);
            }

        } else {
            return response()->json(['message'=>'Invalid User']);
        }

    }


    // Basic uses part

    public function getDistrict($id){
        $districts = District::where('division_id',$id)->get();
        return $districts;
    }

    public function getUpazila($id){
        $upazilas = Upazila::where('district_id',$id)->get();
        return $upazilas;
    }


}
