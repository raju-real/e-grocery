<?php

namespace App\Http\Controllers\Super;

use foo\bar;
use Carbon\Carbon;
use App\Model\Cart;
use App\Model\User;
use App\Model\Order;
use App\Model\Slider;
use App\Model\Message;
use App\Model\Product;
use App\Model\Category;
use App\Model\Promotion;
use App\Model\Subcategory;
use App\Model\ImageProduct;
use App\Model\Sliderproduct;
use Illuminate\Http\Request;
use App\Model\Subsubcategory;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;


class DashboardController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function image(){

        // Product::oldest('id')->update(['product_code' => null]);
        // $products = Product::oldest('id')->get();
        // foreach ($products as $key => $product) {
        //     $product_code = str_pad(($key + 1), 4, "0", STR_PAD_LEFT);
        //     Product::find($product->id)->update([
        //         'product_code' => $product_code
        //     ]);
        // }
        // Toastr::success('Serial no Regenerate successfully');
        // return redirect()->back();
        // exit();
//        $products = Product::where('image',null)->get();
//        foreach($products as $product){
//            $tableImage = ImageProduct::where('product_id',$product->id)->first();
//            $product = Product::find($product->id);
//            $product->image = $tableImage->image;
//            $product->save();
//
//        }
//        Toastr::success('Operation Successfull');
//        return redirect()->back();

//        $products = Product::where('category_id',9)->get();
//        foreach($products as $product){
//            $sp = new Sliderproduct();
//            $sp->slider_id = 9;
//            $sp->product_id = $product->id;
//            $sp->status = 1;
//            $sp->save();
//        }
//        $products = Product::where('discount_price', '!=', null)->get();
//        foreach($products as $product){
//            $result = (($product->unit_price - $product->discount_price)*100)
//                /$product->unit_price;
//            $product->percentage = round($result).'%';
//            $product->save();
//        }

    //    $products = Product::all();
    //    foreach ($products as $product){
    //         $slug = preg_replace('/\s+/', '-', $product->product_name);
    //        $product->slug = $slug;
    //        $product->save();
    //    }

       // $products = Product::where('slug',null)->get();
       // foreach ($products as $product){
       //     $slug = preg_replace('/\s+/', '-', $product->product_name);
       //     $product->slug = $slug;
       //     $product->save();
       // }
        // $products = Slider::where('slug',null)->get();
        // foreach ($products as $product){
        //     $slug = preg_replace('/\s+/', '-', $product->title);
        //     $product->slug = $slug;
        //     $product->save();
        // }
        // $products = Promotion::where('slug',null)->get();
        // foreach ($products as $product){
        //     $slug = preg_replace('/\s+/', '-', $product->name);
        //     $product->slug = $slug;
        //     $product->save();
        // }
        // $products = Category::where('slug',null)->get();
        // foreach ($products as $product){
        //     $slug = preg_replace('/\s+/', '-', $product->name);
        //     $product->slug = $slug;
        //     $product->save();
        // }
        // $products = Subcategory::where('slug',null)->get();
        // foreach ($products as $product){
        //     $slug = preg_replace('/\s+/', '-', $product->name);
        //     $product->slug = $slug;
        //     $product->save();
        // }
        // $products = Subsubcategory::where('slug',null)->get();
        // foreach ($products as $product){
        //     $slug = preg_replace('/\s+/', '-', $product->name);
        //     $product->slug = $slug;
        //     $product->save();
        // }


        // Toastr::success('Operation Successfull');
        // return redirect()->back();


    }

    public function superAdminDashboard(){
        app('App\Http\Controllers\CommonController')->removeAbuseData();
        $users = User::latest()->paginate(10);
        return view('super.dashboard',compact('users'));
    }

    public function getUser(){
        $users = User::latest()->paginate(5);
        return $users;
    }

    public function searchUser(Request $request){
        $query = $request->get('query');
        $users =  User::where('name','LIKE',"%$query%")
            ->orWhere('mobile','LIKE',"%$query%")
            ->orWhere('email','LIKE',"%$query%")
            ->latest()
            ->paginate(10);
            return view('super.dashboard',compact('users'));
    }


    public function userMessageSend(Request $request){
        $this->validate($request,[
            'mobile' => 'required',
            'text' => 'required'
        ]);
        $mobile_no=$request->mobile;
        if($request->subject){
            $subject = $request->subject;
        } else {
            $subject = "";
        }
        $text = $request->text;
        $user = User::where('mobile',$mobile_no)->first();
        $message = "Subject : ".$subject
            ."\nDear,".$user->name .",\n".$text;
        //$this->sendSms($mobile_no,$message);
        app('App\Http\Controllers\CommonController')->sendSms($mobile_no,$message);
        Toastr::success('Message sent Successfully');
        return redirect()->back();
    }

    public function userMessage(){
        $messages = Message::paginate(5);
        return view('super.basic.user_message',compact('messages'));
    }

    public function messageRead($id){
        $message = Message::find($id);
        $message->status= 1;
        $message->save();
        Toastr::info('Message Read Successfully');
        return redirect()->back();
    }

    public function messageDestroy($id){
        $message = Message::find($id);
        $message->delete();
        Toastr::error('Message Deleted Successfully');
        return redirect()->back();
    }

    public function allSubscribers(){
        $subscribers = DB::table('subscribers')->latest()->get();
        return view('super.basic.subscribers',compact('subscribers'));
    }

}
