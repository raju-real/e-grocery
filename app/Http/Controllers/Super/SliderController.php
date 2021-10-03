<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Slider;
use App\Model\Sliderproduct;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;

class SliderController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $sliders = Slider::all();
        return view('super.slider.index',compact('sliders'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $this->validate($request,
            [
                'title' => 'required',
                'image' => 'required'
            ]);

        $slider = new Slider();

        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(900, 456);
            $image_resize->save('images/slider/' .$imageName);
        }

        $slider->title = $request->title;
        $slider->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->title);
        $slider->slug = $slug;
        $slider->status = $request->status;
        $slider->save();
        Toastr::success('Slider Image Successfully Added');
        return redirect()->route('super.slider.index');
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
        $slider = Slider::find($id);
        if($file = $request->file('image')) {
            if(file_exists('images/slider/'.$slider->image) AND !empty($slider->image)){
                unlink('images/slider/'.$slider->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(900, 456);
            $image_resize->save('images/slider/' .$imageName);
        } else{
            $imageName = $slider->image;
        }
        $slider->title = $request->title;
        $slider->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->title);
        $slug->slug = $slug;
        $slider->status = $request->status;
        $slider->save();
        Toastr::success('Slider Image Successfully Updated');
        return redirect()->route('super.slider.index');
    }

    public function destroy($id)
    {
        $slider = Slider::find($id);
        if(file_exists('images/slider/'.$slider->image) AND !empty($slider->image)){
            unlink('images/slider/'.$slider->image);
        }
        $slider->delete();
        Toastr::info('Slider Image Successfully Deleted');
        return redirect()->route('super.slider.index');
    }

    // Slider Product Activity

    public function sliderProducts ($id){
        $slider = Slider::find($id);
        $products = Product::latest()->get();
        $sliderProducts = Sliderproduct::with('product')
            ->where('slider_id',$id)->get();
        return view('super.slider.slider_products',
            compact('sliderProducts','products','slider'));
    }

    public function sliderProductStore(Request $request)
    {
        $this->validate($request,
            [
                'slider_id' => 'required',
                'product_id' => 'required',
                'status' => 'required'
            ]);

        $product = new Sliderproduct();
        $product->slider_id = $request->slider_id;
        $product->product_id = $request->product_id;
        $product->offer_price = $request->offer_price;
        $product->status = $request->status;
        $check = Sliderproduct::where('slider_id', $request->slider_id)
            ->where('product_id', $request->product_id)->get();
        if (sizeof($check) > 0) {
            Toastr::info('Product Already Added On This Slider');
            return redirect()->back();

        } else {
            $product->save();
            Toastr::success('Product Successfully Added');
            return redirect()->back();
        }
    }

    public function sliderProductUpdate(Request $request,$id){
        $this->validate($request,[
            'slider_id'=>'required',
            'product_id'=>'required',
            'status'=>'required'
        ]);

        $product = Sliderproduct::find($id);
        $product->slider_id = $request->slider_id;
        $product->product_id = $request->product_id;
        $product->offer_price = $request->offer_price;
        $product->status = $request->status;
        $product->save();
        Toastr::success('Product Successfully Updated');
        return redirect()->route('super.slider_product',$request->slider_id);
    }

    public function sliderProductDestroy($id){
        $product = Sliderproduct::find($id);
        $product->delete();
        Toastr::error('Product Successfully Removed');
        return redirect()->back();
    }


}
