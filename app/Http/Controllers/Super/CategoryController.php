<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;
use App\Model\Subcategory;
use App\Model\Category;

class CategoryController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $categories = Category::latest()->get();
        return view('super.category.category',compact('categories'));
    }

    public function store(Request $request)
    {
        $this->validate($request,
            [
                'name' => 'required',
                'icon' => 'required',
                'image' => 'required'
             ]);

        $category = new Category();

        if($request->hasFile('icon')) {
            $image = $request->file('icon');
            $iconName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(38, 38);
            $image_resize->save('images/category/'.$iconName);
        }

        $category->icon = $iconName;

        if($request->hasFile('image')) {
        $image = $request->file('image');
        $imageName = time().$image->getClientOriginalName();
        $image_resize = Image::make($image->getRealPath());              
        $image_resize->resize(462, 308);
        $image_resize->save('images/category/' .$imageName);
        }

        $category->name = $request->name;
        $category->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $category->slug = $slug;
        $category->save();
        Toastr::success('Category Successfully Added');
        return redirect()->route('super.category.index');
    }

     public function update(Request $request, $id)
    {
        $category = Category::find($id);

        if($file = $request->file('icon')) {
            if(file_exists('images/category/'.$category->icon) AND !empty($category->icon)){
                unlink('images/category/'.$category->icon);
            }
            $image = $request->file('icon');
            $iconName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(38, 38);
            $image_resize->save('images/category/' .$iconName);
        } else{
            $iconName = $category->icon;
        }

        if($file = $request->file('image')) {
            if(file_exists('images/category/'.$category->image) AND !empty($category->image)){
                unlink('images/category/'.$category->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());              
            $image_resize->resize(462, 308);
            $image_resize->save('images/category/' .$imageName);
            } else{
            $imageName = $category->image;
            }
        $category->name = $request->name;
        $category->icon = $iconName;
        $category->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $category->slug = $slug;
        $category->save();
        Toastr::success('Category Successfully Updated');
        return redirect()->route('super.category.index');
    }

    public function destroy($id)
    {
        $category = Category::find($id);
        $check = Subcategory::where('category_id',$id)->first();
        if(isset($check)){
            Toastr::info('This Category Has Sub Category,Remove First');
            return redirect()->back();
        } else {
            if(file_exists('images/category/'.$category->icon) AND !empty($category->icon)){
            unlink('images/category/'.$category->icon);
            }
            if(file_exists('images/category/'.$category->image) AND !empty($category->image)){
                unlink('images/category/'.$category->image);
            }
            $category->delete();
            Toastr::info('Category Successfully Deleted');
            return redirect()->route('super.category.index');
        }
    }

    public function show($id)
    {
        $products = Product::where('category_id',$id)->get();
        $under = Category::find($id);
        return view('super.category.related_products',
            compact('products','under'));
    }
// ......................................................
    public function edit($id)
    {
        //
    }
     public function create()
    {
        //
    }
   
}
