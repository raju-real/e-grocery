<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;
use App\Model\Subsubcategory;
use App\Model\Subcategory;

class SubcategoryController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $subcategories = Subcategory::latest()->get();
        return view('super.category.subcategory',compact('subcategories'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'category_id'=>'required',
            'name'=>'required',
            'image' => 'required'
        ]);
        $subCategory = new Subcategory();
        $subCategory->category_id = $request->category_id;
        $subCategory->name = $request->name;
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(600, 600);
            $image_resize->save('images/subcategory/' .$imageName);
        }
        $subCategory->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $subCategory->slug = $slug;
        $subCategory->save();
        Toastr::success('Sub Category Successfully Added');
        return redirect()->back();
    }

    public function show($id)
    {
        $products = Product::where('subcategory_id',$id)->get();
        $under = Subcategory::find($id);
        return view('super.category.related_products',
            compact('products','under'));
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,['category_id'=>'required','name'=>'required']);
        $subCategory =  Subcategory::find($id);
        $subCategory->category_id = $request->category_id;
        $subCategory->name = $request->name;
        if($file = $request->file('image')) {
            if(file_exists('images/subcategory/'.$subCategory->image) AND !empty($subCategory->image)){
                unlink('images/subcategory/'.$subCategory->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(600, 600);
            $image_resize->save('images/subcategory/' .$imageName);
        } else{
            $imageName = $subCategory->image;
        }
        $subCategory->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $subCategory->slug = $slug;
        $subCategory->save();
        Toastr::success('Sub Category Successfully Updated');
        return redirect()->back();
    }

    public function destroy($id)
    {
        $subCategory =  Subcategory::find($id);
        $check = Subsubcategory::where('subcategory_id',$id)->first();
        if(isset($check)){
            Toastr::info('It Has Sub Sub Category, Remove First');
            return redirect()->back();
        } else {
            if(file_exists('images/subcategory/'.$subCategory->image) AND !empty($subCategory->image)){
            unlink('images/subcategory/'.$subCategory->image);
        }
        $subCategory->delete();
        Toastr::error('Sub Category Successfully Deleted');
        return redirect()->back();
        }
    }
}
