<?php

namespace App\Http\Controllers;

use App\Model\Bazarlist;
use App\Model\Category;
use App\Model\Franchies;
use App\Model\Message;
use App\Model\Modifylist;
use App\Model\Order;
use App\Model\OrderProduct;
use App\Model\Promotion;
use App\Model\Promotionproduct;
use App\Model\Slider;
use App\Model\Sliderproduct;
use App\Model\Subcategory;
use App\Model\Subsubcategory;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Model\Product;
use App\Model\Cart;
use App\Model\Favorite;
use App\Model\Buynow;
use App\Model\Todyoffer;
use App\Model\Weeklyoffer;
use App\Model\Review;
use App\Model\Subscriber;
use Illuminate\Support\Str;

class HomePageController extends Controller
{
    // General Activity

    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function homePage(){
        app('App\Http\Controllers\CommonController')->clear();
        //return redirect()->route('home');
    	$products = Product::with('images','sizes','colors','units')
            ->paginate(15);
        $todayDate = Carbon::now()->toDateString();
        $todayOffers = Todyoffer::with('product','product.todayoffer')
            ->whereDate('offer_date',$todayDate)
            ->where('status',1)
            ->paginate(15);
        $todayDate = Carbon::now()->toDateString();
        $weeklyOffers = Weeklyoffer::with('product','product.weeklyoffer')
            ->whereDate('start_date','<=',$todayDate)
            ->whereDate('end_date','>=',$todayDate)
            ->where('status',1)
            ->paginate(15);
        $promotions = DB::table('promotions')->where('status',1)->get();
    	return view('welcome',compact('products', 'todayOffers',
            'promotions','weeklyOffers'));
    }

    function searchResult(Request $request){
        if($request->get('query'))
        {
            $query = $request->get('query');
            $data = Product::where('product_name','LIKE',"%$query%")
                ->get();
            $output = '<ul class="dropdown-menu" style="display:block; position:relative">';
            foreach($data as $row)
            {
                $output .= '<li><a href="">'.$row->product_name.'</a></li>';
            }
            $output .= '</ul>';
            echo $output;
        }
    }

    public function productSearch(Request $request){
        $query = $request->get('query');
        $products = Product::where('product_name','LIKE',"%$query%")
            ->paginate(16);
        $vendor = "Search Result";
        $messae = "Search Result";
        return view('pages.search_result',compact('products','vendor','messae'));
    }

     public function searchProduct(){
        $output="";
        $product_name = request()->get('product_name');
        $products = Product::where('product_name','LIKE',"{$product_name}%")
                ->where('status',1)
                ->get();
        
        $output = '';
        foreach($products as $product){
            $name = "'".$product->product_name."'";
            $url =  route('product_detail',$product->slug);
            $output.='<a'.' href='.'"'.$url .'"'
            .'>'
            .$product->product_name
            .'</a>';
        }
        return response()->json(['data'=>$output]);
        //return Response($output);
    }

    public function subCategories($slug){
        $category = Category::where('slug',$slug)->first();
        $subcategories = Subcategory::where('category_id',$category->id)->get();
        if(sizeof($subcategories)>0){
            return view('pages.subcategories',compact('subcategories'));
        } else {
            return redirect()->route('category',$category->slug);
        }
    }

    public function subSubCategories($slug){
        $subcategory = Subcategory::where('slug',$slug)->first();
        $subcategories = Subsubcategory::where('subcategory_id',$subcategory->id)->get();
        if(sizeof($subcategories)>0){
            return view('pages.subsubcategories',compact('subcategories'));
        } else {
            return redirect()->route('subcategory',$subcategory->slug);
        }
    }

    public function featuredProducts(){
        $products = Product::with('images','sizes','colors','units')->latest()
            ->paginate(16);
        $vendor = "Featured Product";
        $message = "Featured Product";
        return view('pages.featured_products',compact('products','vendor','message'));
    }

    public function sortByFromAll($name,$sort){
       if($sort== 'low-to-high'){
            $products = Product::with('images','sizes','colors','units')->orderBy('unit_price','ASC')
                    ->paginate(16);
        } elseif($sort=='high-to-low'){
            $products = Product::with('images','sizes','colors','units')->orderBy('unit_price','DESC')
                    ->paginate(16);
        }
        $vendor = "Featured Product";
        $message = "Featured Product";
        return view('pages.featured_products',compact('products','vendor','message'));
    }

    public function todayOfferProducts(){
        $offers = Todyoffer::with('product','product.images')
            ->whereDate('offer_date', Carbon::today())
            ->paginate(20);
        $vendor = "Products On Today Offer";
        $message = "Today Offer Product";
        $route = 'todayoffer';
        return view('pages.today_weekly',
            compact('offers','vendor','message','route'));
    }

    // public function weeklyOfferProducts(){
    //     $offers = Todyoffer::with('product','product.images')
    //         ->whereDate('offer_date', Carbon::today())
    //         ->paginate(20);
    //     $vendor = "Products On Weekly Offer";
    //     $message = "Today Offer Product";
    //     $route = 'weeklyoffer';
    //     return view('pages.today_weekly',
    //         compact('offers','vendor','message','route'));
    // }

    public function weeklyOfferProducts(){
        $todayDate = Carbon::now()->toDateString();
        $offers = Weeklyoffer::with('product','product.images')->whereDate('start_date','==',$todayDate)
          ->whereDate('end_date','>=',$todayDate)->paginate(20);
        $vendor = "Products On Weekly Offer";
        $message = "Weekly Offer Product";
        $route = 'weeklyoffer';
        return view('pages.today_weekly',
            compact('offers','vendor','message','route'));
    }

    public function sortFromTodayWeekly($name,$sort){
        if($name == 'todayoffer'){
           if($sort == 'high-to-low'){
             $offers = Todyoffer::with('product','product.images')
            ->orderBy('offer_price','DESC')
            ->whereDate('offer_date', Carbon::today())
            ->paginate(20);
            } elseif($sort == 'low-to-high'){
                 $offers = Todyoffer::with('product','product.images')
                ->orderBy('offer_price','ASC')
                ->whereDate('offer_date', Carbon::today())
                ->paginate(20);
            }
            $vendor = "Products On Today Offer";
            $message = "Today Offer Product";
            $route = 'todayoffer';
        } elseif($name == 'weeklyoffer'){

        }
        return view('pages.today_weekly',
            compact('offers','vendor','message','route'));
    }

    public function allPromotion(){
        $promotions = Promotion::where('status',1)->latest()->get();
        return view('pages.all_promotions',compact('promotions'));
    }

    public function promotionProducts($slug){
        $promotion = Promotion::where('slug',$slug)->first();
        $offers = Promotionproduct::with('product','product.images')
            ->where('promotion_id', $promotion->id)
            ->where('status',1)
            ->paginate(20);
        $vendor = "Products On ".$promotion->name;
        $message = "Promotion Product";
        $basic = Promotion::find($promotion->id);
        $folder = "promotion";
        $route = 'campaign';
        $countProduct = Promotionproduct::where('promotion_id',$basic->id)->get();
        return view('pages.offer_products',
            compact('offers','vendor','message','basic','folder','countProduct','campaign','route'));
    }

    public function sliderProducts($slug){
        $slider = Slider::where('slug',$slug)->first();
        $offers = Sliderproduct::with('product','product.images')
            ->where('slider_id', $slider->id)
            ->where('status',1)
            ->paginate(20);
        $vendor = $slider->title;
        $message = "On Sale";
        $basic = $slider;
        $countProduct = Sliderproduct::where('slider_id',$basic->id)->get();
        $folder = "slider";
        $route = 'offers';
        return view('pages.offer_products',
            compact('offers','vendor','message','basic','folder','countProduct','route'));
    }

    public function sortByPromotionSlider($name,$slug,$sort){
        if($name == 'slider'){
            $slider = Slider::where('slug',$slug)->first();
            if($sort == 'high-to-low'){
                $offers = Sliderproduct::with('product','product.images')
                ->orderBy('offer_price','ASC')
                ->where('slider_id', $slider->id)
                ->where('status',1)
                ->paginate(20);
            } elseif($sort == 'low-to-high'){
                $offers = Sliderproduct::with('product','product.images')
                ->orderBy('offer_price','DESC')
                ->where('slider_id', $slider->id)
                ->where('status',1)
                ->paginate(20);
            }
            $vendor = $slider->title;
            $message = "On Sale";
            $basic = $slider;
            $countProduct = Sliderproduct::where('slider_id',$basic->id)->get();
            $folder = "slider";
            $route = 'offers';
        } elseif($name == 'campaign'){
            $promotion = Promotion::where('slug',$slug)->first();
            if($sort == 'high-to-low'){
                $offers = Promotionproduct::with('product','product.images')
                ->orderBy('offer_price','DESC')
                ->where('promotion_id', $promotion->id)
                ->where('status',1)
                ->paginate(20);
            } elseif($sort == 'low-to-high'){
                $offers = Promotionproduct::with('product','product.images')
                ->orderBy('offer_price','ASC')
                ->where('promotion_id', $promotion->id)
                ->where('status',1)
                ->paginate(20);
            }
            $vendor = $promotion->name;
            $message = "On Sale";
            $basic = $promotion;
            $countProduct = PromotionProduct::where('promotion_id',$basic->id)->get();
            $folder = "promotion";
            $route = 'campaign';
        }
         return view('pages.offer_products',
            compact('offers','vendor','message','basic','folder','countProduct','route'));
    }

    public function productDetails(Request $request,$slug){
        $product = Product::with('images','todayoffer','weeklyoffer','slider',
            'promotion')
            ->where('slug',$slug)
            ->first();
        $product_details = html_entity_decode($product->product_details);
        $category_id = $product->category->id;
        $related_products = Product::where('category_id',$category_id)->paginate(15);
        $price = $request->price;
        if(isset($request->discount)){
            $discount = $request->discount;
        } else {
            $discount = 1;
        }


        return view('pages.single_product',
                compact('product',
                    'related_products',
                    'product_details',
                    'price',
                    'discount'));
    }

    public function productDetailBySearch($slug){
        $product = Product::with('images','todayoffer','weeklyoffer','slider',
            'promotion')
            ->where('slug',$slug)
            ->first();
        $product_details = html_entity_decode($product->product_details);
        $category_id = $product->category->id;
        $related_products = Product::where('category_id',$category_id)->paginate(15);
        if($product->discount_price != null){
            $price = $product->discount_price;
        } else {
            $price = $product->unit_price;
        }
        $discount = 1;
        return view('pages.single_product',
            compact('product', 'related_products','price','discount'));
    }


    // Menu Bar Activity

    public function bazarList(){
        $lists = Bazarlist::with('product')->latest()->get();
        return view('pages.bazarlist',compact('lists'));
    }

    public function aboutUs(){
        return view('pages.about_us');
    }

    public function contactUs(){
        return view('pages.contact_us');
    }

    public function sendMessage(Request $request){
        $this->validate($request,[
            'name' => 'required',
            'subject' => 'required',
            'mobile' => 'required',
            'message' => 'required',
        ]);

        $contact = new Message();
        $contact->name = $request->name;
        $contact->subject = $request->subject;
        $contact->mobile = $request->mobile;
        $contact->message = $request->message;
        $contact->status = 0;
        $contact->save();
        return redirect()->back()->with('message', 'Your Message Sent Successfully,
        Admin Will Contact With You');
    }

    // Side Bar Activity

    public function categoryWiseProduct($slug){
        $basic = Category::where('slug',$slug)->first();
        $products = Product::where('category_id',$basic->id)->paginate(16);
        $vendor = $basic->name;
        $folder = "category";
        $route = 'category';
        $message = "Category Wise Product";
        return view('pages.vendor_products',compact('products','basic',
            'vendor','message','folder','route'));
    }

    public function subCategoryWiseProduct($slug){
        $basic = Subcategory::where('slug',$slug)->first();
        $products = Product::where('subcategory_id',$basic->id)->paginate(16);
        $vendor = $basic->name;
        $folder = "subcategory";
        $message = "Sub Category Wise Product";
        $route = 'subcategory';
        return view('pages.vendor_products',compact('products','basic','vendor','message','folder','route'));
    }

    public function subSubCategoryWiseProduct($slug){
        $basic = Subsubcategory::where('slug',$slug)->first();
        $products = Product::where('subsubcategory_id',$basic->id)->paginate(16);
        $vendor = $basic->name;
        $message = "Sub Category Wise Product";
        $folder = "subsubcategory";
        $route = "subsubcategory";
        $totalProduct = Product::all();
        return view('pages.vendor_products',compact('products','basic','vendor','message','totalProduct','folder','route'));
    }

    public function sortBy($name,$slug,$sort){
        if($name == 'category'){
            $basic = Category::where('slug',$slug)->first();
            if($sort== 'low-to-high'){
                $products = Product::where('category_id',$basic->id)->orderBy('unit_price','ASC')->paginate(16);
            } elseif($sort=='high-to-low'){
                $products = Product::where('category_id',$basic->id)->orderBy('unit_price','DESC')->paginate(16);
            }
            $vendor = $basic->name;
            $folder = "category";
            $route = 'category';
            $message = "Category Wise Product";
        } elseif($name == 'subcategory'){
             $basic = Subcategory::where('slug',$slug)->first();
            if($sort== 'low-to-high'){
                $products = Product::where('subcategory_id',$basic->id)->orderBy('unit_price','ASC')->paginate(16);
            } elseif($sort=='high-to-low'){
                $products = Product::where('subcategory_id',$basic->id)->orderBy('unit_price','DESC')->paginate(16);
            }
            $vendor = $basic->name;
            $folder = "subcategory";
            $message = "Sub Category Wise Product";
            $route = 'subcategory';
        } elseif($route == 'subsubcategory'){
            $basic = Subsubcategory::where('slug',$slug)->first();
            if($sort== 'low-to-high'){
                $products = Product::where('subsubcategory_id',$basic->id)->orderBy('unit_price','ASC')->paginate(16);
            } elseif($sort=='high-to-low'){
                $products = Product::where('subsubcategory_id',$basic->id)->orderBy('unit_price','DESC')->paginate(16);
            }
            $vendor = $basic->name;
            $message = "Sub Category Wise Product";
            $folder = "subsubcategory";
            $route = "subsubcategory";
            $totalProduct = Product::all();
        }
        return view('pages.vendor_products',compact('products','basic','vendor','message','folder','route'));
    }

    // Review Activity

    public function saveReview(Request $request){

      if(Auth::check()){
        $orders = Order::where('user_id',Auth::user()->id)->get();
            if(sizeof($orders)>0){
                foreach($orders as $order){
                    $orderProducts = OrderProduct::where('order_id',$order->id)
                        ->where('product_id',$request->product_id)->get();
                }
                if(sizeof($orderProducts) > 0){
                  $review = new Review();
                  $review->user_id = Auth::id();
                  $review->product_id = $request->product_id;
                  $review->rating = $request->rating;
                  $review->comments = $request->comments;
                  $review->save();
                  return response()->json(['message'=>'Thanks for your review']);
                } else {
                  return response()->json(['message'=>'Product Not Found In Your Order List']);
                }
        } else{
            return response()->json(['message'=>'Product Not Found In Your Order List']);
        }

      } else {
        return response()->json(['message'=>'Login first']);
      }

    }

    // Franchises Part
    public function franchises(){
        return view('pages.franchises');
    }

    public function applyFranchises(Request $request){
        $franchies = new Franchies();
        $franchies->name = $request->name;
        $franchies->email = $request->email;
        $franchies->mobile = $request->mobile;
        $franchies->district = $request->district;
        $franchies->thana = $request->thana;
        $franchies->current_business = $request->current_business;
        $franchies->address = $request->address;
        $franchies->save();
        return redirect()->back()->with('message','Applied Successfully');
    }

    // Subscribe
    public function subscribe(Request $request){
        $this->validate($request,['email'=>'required']);
        $check = Subscriber::where('email',$request->email)->first();
        if(isset($check)){
            Toastr::error('You are already subscribed');
            return redirect()->route('home');
        } else {
            $subscriber = new Subscriber();
            $subscriber->email = $request->email;
            $subscriber->save();
            Toastr::info('Successfully Subscribed');
            return redirect()->route('home');
        }
    }


}
