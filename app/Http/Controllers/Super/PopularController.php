<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Product;
use App\Model\Category;
use App\Model\Popular;
use Brian2694\Toastr\Facades\Toastr;

class PopularController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $categories = Category::all();
        $products = Product::all();
        $populars = Popular::with('product')->get();
        return view('super.popular.index',compact('products','populars'));
    }

    public function create()
    {
        
    }

    public function store(Request $request)
    {
        $this->validate($request,['product_id'=>'required']);
        $popular = new Popular();
        $popular->product_id = $request->product_id;
        $check = Popular::where('product_id',$request->product_id)->get();
        if(sizeof($check) > 0){
            Toastr::error('Product Already Added TO Your Popular Item');
            return redirect()->route('super.popular.index');
        } else {
            $popular->save();
            Toastr::success('New Item Added Successfully');
            return redirect()->route('super.popular.index');
        }

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
        $this->validate($request,['product_id'=>'required']);
        $popular = Popular::find($id);
        $popular->product_id = $request->product_id;
        $popular->save();
        Toastr::info('Item Updated Successfully');
        return redirect()->route('super.popular.index');
    }

    public function destroy($id)
    {
        $popular = Popular::find($id);
        $popular->delete();
        Toastr::error('Item Successfully Removed');
        return redirect()->route('super.popular.index');
    }
}
