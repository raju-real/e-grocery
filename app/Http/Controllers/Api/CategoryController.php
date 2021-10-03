<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;

use App\Model\Category;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::latest()->get();
        return $categories;
    }

    public function store(Request $request)
    {
        $this->validate($request,
            [
                'name' => 'required',
                'image' => 'required'
            ]);

        $category = new Category();

        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(462, 308);
            $image_resize->save('images/category/' .$imageName);
        }

        $category->name = $request->name;
        $category->image = $imageName;
        $category->save();
        return response()->json('Category Successfully Saved');
    }

    public function update(Request $request, $id)
    {
        $category = Category::find($id);
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
        $category->image = $imageName;
        $category->save();
        return response()->json('Category Successfully Updated');
    }

    public function destroy($id)
    {
        $category = Category::find($id);
        if(file_exists('images/category/'.$category->image) AND !empty($category->image)){
            unlink('images/category/'.$category->image);
        }
        $category->delete();
        return response()->json('Category Successfully Delete');
    }

    public function show($id)
    {
        //
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
