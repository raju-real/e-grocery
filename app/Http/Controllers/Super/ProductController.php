<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Super\Exception;
use App\Model\Bazarlist;
use App\Model\Category;
use App\Model\ColorProduct;
use App\Model\Company;
use App\Model\ImageProduct;
use App\Model\Popular;
use App\Model\Product;
use App\Model\ProductSize;
use App\Model\ProductUnit;
use App\Model\Promotionproduct;
use App\Model\Size;
use App\Model\Sliderproduct;
use App\Model\Subcategory;
use App\Model\Todyoffer;
use App\Model\Weeklyoffer;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{

    public function __construct(){
        app('App\Http\Controllers\CommonController')->clear();
        $this->middleware('auth:admin');
    }

    public function index(){
        $data = Product::query();
        $product_name = request()->get('product_name');
        $category_id = request()->get('category_id');
        $subcategory_id = request()->get('subcategory_id');
        $subsubcategory_id = request()->get('subsubcategory_id');
        $status = request()->get('status');
        if(isset($product_name)){
            $data->where('product_name','LIKE',"%$product_name%");
        }
        if(isset($category_id)){
            $data->where('category_id',$category_id);
        }
        if(isset($subcategory_id)){
            $data->where('subcategory_id',$subcategory_id);
        }
        if(isset($subsubcategory_id)){
            $data->where('subsubcategory_id',$subsubcategory_id);
        }
        if(isset($status)){
            $data->where('status',$status);
        }
        $products = $data->with('images')->paginate(10);
        return view('super.product.index',compact('products'));
    }

    public function create(){
        $categories = Category::all();
        $companies = Company::all();
        $subcategories = Subcategory::all();
        return view('super.product.create',compact('categories','subcategories','companies'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'product_name' => 'required',
            'category_id' => 'required',
            'product_details' => 'required',
            'units' => 'required',
            'unit_price' => 'required',
            'sku' => 'required',
            'images' => 'required'
        ]);

        $product =  new Product();
        $product->admin_id = Auth::user()->id;
        $product->category_id = (int)$request->category_id;
        if($request->subcategory_id){
            $product->subcategory_id = $request->subcategory_id;
        } else {
            $product->subcategory_id = null;
        }
        if($request->subsubcategory_id){
            $product->subsubcategory_id = $request->subsubcategory_id;
        } else {
            $product->subsubcategory_id = null;
        }
        
        $product->product_code = Product::getProductCode();
        $product->company_id = $request->company_id;
        $product->product_name = $request->product_name;
        //$slug = preg_replace('/\s+/', '-', $request->product_name);
        $product->slug = strtolower(Str::slug($request->product_name));
        $product->product_details = $request->product_details;
        $product->unit_price = $request->unit_price;
        $product->unit_weight = $request->unit_weight;
        $product->discount_price = $request->discount_price;
        if($request->discount_price){
            $product->discount_price = $request->discount_price;
            $result = (($request->unit_price - $request->discount_price)*100)/$request->unit_price;
            $product->percentage = round($result).'%';
        }
        $product->sku = $request->sku;
        $product->quantity = $request->quantity;
        $product->special_note = $request->special_note;
        if($request->hasFile('video')){
            $file = $request->file('video');
            $videoName = time().$file->getClientOriginalName();
            //$path = public_path().'/uploads/';
            $path = 'videos/';
            $file->move($path, $videoName);
        } else{
            $videoName = null;
        }
        $product->video = $videoName;
        $product->save();
        $product->units()->sync($request->units);
        if($request->sizes)$product->sizes()->sync($request->sizes);
        if($request->colors)$product->colors()->sync($request->colors);
        if($request->hasfile('images'))
        {
            foreach($request->file('images') as $image)
            {
                $imageName = time().$image->getClientOriginalName();
                $image_resize = Image::make($image->getRealPath());
                $image_resize->resize(600, 600);
                $image_resize->filesize(100);
                $image_resize->save('images/product/' .$imageName);
                // $name=$image->getClientOriginalName();
                // $image->move('images/gallery', $name);
                $data[] = $imageName;
                $images = new ImageProduct();
                $images->product_id = $product->id;
                $images->image = $imageName;
                //return 253;
                $images->save();
            }
        }

        $product = Product::find($product->id);
        $image = ImageProduct::where('product_id',$product->id)->first();
        $product->image = $image->image;
        $product->save();
        //return response()->json('Product Successfully Saved');
        Toastr::success('Product Successfully Saved');
        return redirect()->back();
    }

    public function show($id){
 		$product = Product::with('images','units','sizes','colors')
            ->findOrFail($id);
        return view('super.product.view',compact('product'));

    }

    public function edit($id){
        $product = Product::findOrFail($id);
        $categories = Category::all();
        $subcategories = Subcategory::all();
        return view('super.product.edit',compact('product','categories','subcategories'));
    }

    public function update(Request $request, $id){
        $this->validate($request,[
            'product_name' => 'required',
            'category_id' => 'required',
            'product_details' => 'required',
            'units' => 'required',
            'unit_price' => 'required',
            'sku' => 'required',
        ]);
        $product = Product::find($id);

        $product->admin_id = Auth::user()->id;
        $product->category_id = $request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->subsubcategory_id = $request->subsubcategory_id;
        $product->product_code = $product->product_code;

        $product->company_id = $request->company_id;
        $product->product_name = $request->product_name;
        //$slug = preg_replace('/\s+/', '-', $request->product_name);
        $product->slug = strtolower(Str::slug($request->product_name));
        $product->product_details = $request->product_details;
        $product->unit_price = $request->unit_price;
        $product->unit_weight = $request->unit_weight;
        if($request->discount_price != $product->discount_price){
            $product->discount_price = $request->discount_price;
            $result = (($request->unit_price - $request->discount_price)*100)/$request->unit_price;
            $product->percentage = round($result).'%';
        }
        $product->sku = $request->sku;
        $product->special_note = $request->special_note;
        $product->quantity = $request->quantity;

            if($request->hasFile('video')){
                if(file_exists('videos/'.$product->video) AND !empty($product->video)){
                    unlink('videos/'.$product->video);
                }
                $file = $request->file('video');
                $videoName = time().$file->getClientOriginalName();
                $file->move('videos/', $videoName);
            } else{
                $videoName = $product->video;
            }

        $product->video = $videoName;
        $product->save();
        $product->units()->sync($request->units);
        if($request->sizes){
            $product->sizes()->sync($request->sizes);
        }
        $product->colors()->sync($request->colors);
        if($request->hasfile('images'))
        {
            $old_images = ImageProduct::where('product_id',$product->id)->get();
            foreach ($old_images as $image){
                $image->delete();
            }

            foreach($request->file('images') as $image)
            {
                $imageName = time().$image->getClientOriginalName();
                $image_resize = Image::make($image->getRealPath());
                $image_resize->resize(600, 600);
                $image_resize->filesize(100);
                $image_resize->save('images/product/' .$imageName);
                // $name=$image->getClientOriginalName();
                // $image->move('images/gallery', $name);
                $data[] = $imageName;
                $images = new ImageProduct();
                $images->product_id = $product->id;
                $images->image = $imageName;
                //return 253;
                $images->save();
            }
        }
        $product = Product::find($product->id);
        $image = ImageProduct::where('product_id',$product->id)->first();
        $product->image = $image->image;
        $product->save();
        //return response()->json('Product Successfully Saved');
        Toastr::success('Product Successfully Updated');
        return redirect()->route('super.product.index');
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $popular_product = Popular::where('product_id',$product->id)->first();
        $promotion_product = Promotionproduct::where('product_id',$product->id)->first();
        $slider_product = Sliderproduct::where('product_id',$product->id)->first();
        $todayoffer_product = Todyoffer::where('product_id',$product->id)->first();
        $weeklyoffer_product = Weeklyoffer::where('product_id',$product->id)->first();
        $bazarlist = Bazarlist::where('product_id',$product->id)->first();
        if($popular_product){
            Toastr::error('This Product Added On Popular Item, Remove First');
            return redirect()->back();
        } elseif($promotion_product){
            Toastr::error('This Product Added On Promotion Item, Remove First');
            return redirect()->back();
        } elseif($slider_product){
            Toastr::error('This Product Added On Slider Item, Remove First');
            return redirect()->back();
        } elseif($todayoffer_product){
            Toastr::error('This Product Added On Today Offer Item, Remove First');
            return redirect()->back();
        }elseif($weeklyoffer_product){
            Toastr::error('This Product Added On Weekly Offer Item, Remove First');
            return redirect()->back();
        } elseif($bazarlist){
            Toastr::error('This Product Added On Bazar List Item, Remove First');
            return redirect()->back();
        } else{
            $images = ImageProduct::where('product_id',$product->id)->get();
            foreach($images as $image){
                $image->delete();
                if(file_exists('images/product/'.$image->image) AND !empty($image->image)){
                    unlink('images/product/'.$image->image);
                }
            }
            if(file_exists('videos/'.$product->video) AND !empty($product->video)){
                unlink('videos/'.$product->video);
            }
            $colors = ColorProduct::where('product_id',$product->id)->get();
            foreach($colors as $color){
                $color->delete();
            }
            $sizes = ProductSize::where('product_id',$product->id)->get();
            foreach($sizes as $size){
                $size->delete();
            }
            $units = ProductUnit::where('product_id',$product->id)->get();
            foreach($units as $unit){
                $unit->delete();
            }

            $product->delete();
            Toastr::error('Successfully Deleted');
            return redirect()->back();
        }

    }

    public function categoryWiseProduct(Request $request){
        $products = Product::with('images')
            ->where('category_id',$request->category_id)->get();
        $category = Category::find($request->category_id);
        return view('super.product.category_wise_product',
            compact('products','category'));
    }

    public function subCategoryWiseProduct(Request $request){
        $products = Product::with('images')
            ->where('subcategory_id',$request->category_id)->get();
        $subcategory = Subcategory::find($request->subcategory_id);
        return view('super.product.subcategory_wise_product',
            compact('products','subcategory'));
    }

    
}
