<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Promotion;
use App\Model\Promotionproduct;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;
use Illuminate\Http\Request;

class PromotionController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $promotions = Promotion::latest()->get();
        return view('super.promotion.index',compact('promotions'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required',
            'image'=>'required',
            'status'=>'required'
        ]);
        $promotion = new Promotion();
        $promotion->name = $request->name;
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(270, 400);
            $image_resize->save('images/promotion/' .$imageName);
        }

        $promotion->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $promotion->slug = $slug;
        $promotion->status = $request->status;
        $promotion->save();
        Toastr::success('Promotion Added Successfully');
        return redirect()->route('super.promotion.index');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $promotion = Promotion::find($id);
        if($file = $request->file('image')) {
            if(file_exists('images/promotion/'.$promotion->image) AND !empty($promotion->image)){
                unlink('images/promotion/'.$promotion->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(270, 400);
            $image_resize->save('images/promotion/' .$imageName);
        } else{
            $imageName = $promotion->image;
        }
        $promotion->name = $request->name;
        $promotion->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $promotion->slug = $slug;
        $promotion->status = $request->status;
        $promotion->save();
        Toastr::info('Promotion Updated Successfully');
        return redirect()->route('super.promotion.index');
    }

    public function destroy($id)
    {
        $promotion = Promotion::find($id);
        if(file_exists('images/promotion/'.$promotion->image) AND !empty($promotion->image)){
            unlink('images/promotion/'.$promotion->image);
        }
        $products = Promotionproduct::where('promotion_id',$promotion->id)->get();
        foreach ($products as $product){
            $product->delete();
        }
        $promotion->delete();
        Toastr::info('Promotion Successfully Deleted');
        return redirect()->route('super.promotion.index');
    }

    // Promotion Product Activity

    public function promotionProducts ($id){
        $promotion = Promotion::find($id);
        $products = Product::where('discount_price',null)->get();
        $promotionProducts = Promotionproduct::with('product')
            ->where('promotion_id',$id)->get();
        return view('super.promotion.promotion_products',
            compact('promotionProducts','products','promotion'));
    }

    public function promotionProductStore(Request $request)
    {
        $this->validate($request,
            ['promotion_id' => 'required',
                'product_id' => 'required',
                'offer_price' => 'required',
                'status' => 'required'
            ]);

        $product = new Promotionproduct();
        $product->promotion_id = $request->promotion_id;
        $product->product_id = $request->product_id;
        $product->offer_price = $request->offer_price;
        $product->status = $request->status;
        $findProduct = Product::findOrFail($request->product_id);
        $result = (($findProduct->unit_price - $request->offer_price)*100)
            /$findProduct->unit_price;
//        $result = ($findProduct->unit_price * $request->offer_price) / 100;
        $product->percentage = round($result).'%';

        $check = Promotionproduct::where('promotion_id', $request->promotion_id)
            ->where('product_id', $request->product_id)
            ->get();
        if (sizeof($check) > 0) {
            Toastr::info('Product Already Added On This Promotion');
            return redirect()->back();

        } else {
            $product->save();
            Toastr::success('Product Successfully Added');
            return redirect()->back();
        }
    }

        public function promotionProductUpdate(Request $request,$id){
            $this->validate($request,[
                'promotion_id'=>'required',
                'product_id'=>'required',
                'offer_price'=>'required',
                'status'=>'required'
            ]);

            $product = Promotionproduct::find($id);
            $product->promotion_id = $request->promotion_id;
            $product->product_id = $request->product_id;
            $product->offer_price = $request->offer_price;
            $findProduct = Product::findOrFail($request->product_id);
            $result = (($findProduct->unit_price - $request->offer_price)*100)
                /$findProduct->unit_price;
//            $result = ($findProduct->unit_price * $request->offer_price) /100;
            $product->percentage = round($result).'%';
            $product->status = $request->status;
            $product->save();
            Toastr::success('Product Successfully Updated');
            return redirect()->back();
        }

        public function promotionProductDestroy($id){
            $product = Promotionproduct::find($id);
            $product->delete();
            Toastr::error('Product Successfully Removed');
            return redirect()->back();
        }


}
