<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Bazarlist;
use App\Model\Product;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class BazarListController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $bazarLists = Bazarlist::with('product')->latest()->get();
        return view('super.bazar.index',compact('bazarLists'));
    }

    public function create()
    {
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'product_id' => 'required',
            'quantity' => 'required'
        ]);

        $list = new Bazarlist();
        $list->product_id = $request->product_id;
        $list->quantity = $request->quantity;
        $product = Product::find($request->product_id);
        $check = Bazarlist::where('product_id',$product->id)->get();
        if(sizeof($check) > 0){
            Toastr::error('This Itedm Already Added On Bazar List');
            return redirect()->back();
        } else {
            if($product->discount_price != null){
                $price = $product->discount_price;
                $totalPrice = $price * $list->quantity;
            } else {
                $price = $product->unit_price;
                $totalPrice = $price * $list->quantity;
            }
            $list->unit_price = $price;
            $list->total_price = $totalPrice;
            $list->save();
            Toastr::success('Bazar List Added Successfully');
            return redirect()->route('super.bazar.index');

        }
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $list = Bazarlist::find($id);
            return view('super.bazar.edit',compact('list'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'product_id' => 'required',
            'quantity' => 'required'
        ]);

        $list = Bazarlist::findOrFail($id);
        $list->product_id = $request->product_id;
        $list->quantity = $request->quantity;
        $product = Product::find($request->product_id);
        if($product->discount_price != null){
            $price = $product->discount_price;
            $totalPrice = $price * $list->quantity;
        } else {
            $price = $product->unit_price;
            $totalPrice = $price * $list->quantity;
        }
        $list->unit_price = $price;
        $list->total_price = $totalPrice;
        $list->save();
        Toastr::success('Bazar List Upadated Successfully');
        return redirect()->route('super.bazar.index');

        }


    public function destroy($id)
    {
        $list = Bazarlist::find($id);
        $list->delete();
        Toastr::success('Bazar List Deleted Successfully');
        return redirect()->back();
    }
}
