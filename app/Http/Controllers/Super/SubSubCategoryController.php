<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Model\Subsubcategory;
use App\Model\Subcategory;
use Intervention\Image\Facades\Image;

class SubSubCategoryController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subcategories = Subsubcategory::latest()->get();
        return view('super.category.subsubcategory',compact('subcategories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'subcategory_id'=>'required',
            'name'=>'required',
            'image' => 'required'
        ]);
        $subCategory = new Subsubcategory();
        $subCategory->subcategory_id = $request->subcategory_id;
        $subCategory->name = $request->name;
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(600, 600);
            $image_resize->save('images/subsubcategory/' .$imageName);
        }
        $subCategory->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $subCategory->slug = $slug;
        $subCategory->save();
        Toastr::success('Sub Sub Category Successfully Added');
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $products = Product::where('subsubcategory_id',$id)->get();
        $under = Subsubcategory::find($id);
        return view('super.category.related_products',
            compact('products','under'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,['subcategory_id'=>'required','name'=>'required']);
        $subCategory =  Subsubcategory::find($id);
        $subCategory->subcategory_id = $request->subcategory_id;
        $subCategory->name = $request->name;
        if($file = $request->file('image')) {
            if(file_exists('images/subsubcategory/'.$subCategory->image) AND !empty($subCategory->image)){
                unlink('images/subsubcategory/'.$subCategory->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(600, 600);
            $image_resize->save('images/subsubcategory/' .$imageName);
        } else{
            $imageName = $subCategory->image;
        }
        $subCategory->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $subCategory->slug = $slug;
        $subCategory->save();
        Toastr::success('Sub Sub Category Successfully Updated');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $subCategory =  Subsubcategory::find($id);
        if(file_exists('images/subsubcategory/'.$subCategory->image) AND !empty($subCategory->image)){
            unlink('images/subsubcategory/'.$subCategory->image);
        }
        $subCategory->delete();
        Toastr::error('Sub Category Successfully Deleted');
        return redirect()->back();
    }
}
