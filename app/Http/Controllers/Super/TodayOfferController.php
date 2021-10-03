<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Todyoffer;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;



class TodayOfferController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $reports = Todyoffer::with('product')
            ->whereDate('offer_date', Carbon::today())
            ->get();
        $offers = Todyoffer::latest()->get();
        $products = Product::where('discount_price',null)->get();
        return view('super.today_offer.index',compact('offers','products'));
    }

    public function create()
    {
        $products = Product::where('discount_price',null)->get();
        return view('super.today_offer.create',compact('products'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'product_id'=>'required',
            'offer_date'=>'required',
            'offer_price'=>'required'
        ]);

        $offer = new Todyoffer();
        $offer->admin_id = Auth::id();
        $offer->product_id = $request->product_id;
        $offer->offer_date = $request->offer_date;
        $offer->offer_price = $request->offer_price;
        $offer->status = $request->status;
        $product = Product::find($request->product_id);
        if($request->offer_price > $product->unit_price){
            return redirect()->back()->with('message','Offer price can not grater then product current price');
        }
        $check = Todyoffer::where('offer_date',$request->offer_date)
                            ->where('product_id',$request->product_id)->get();
        if(sizeof($check) > 0){
            Toastr::error('This product already added on this data offer');
            return redirect()->back();
        } else{
            $offer->save();
            Toastr::success('Product Successfully Added On Today Offer');
        return redirect()->route('super.today_offer.index');
        }                   
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $offer = Todyoffer::findOrFail($id);
        $products = Product::where('discount_price',null)->get();
        return view('super.today_offer.edit',compact('offer','products'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'product_id'=>'required',
            'offer_date'=>'required',
            'offer_price'=>'required'
        ]);

        $offer =  Todyoffer::findOrFail($id);
        $offer->admin_id = Auth::id();
        $offer->product_id = $request->product_id;
        $offer->offer_date = $request->offer_date;
        $offer->offer_price = $request->offer_price;
        $offer->status = $request->status;
        $product = Product::find($request->product_id);
        if($request->offer_price > $product->unit_price){
            return redirect()->back()->with('message','Offer price can not grater then product current price');
        }
        $offer->save();
        Toastr::info('Successfully Updated This Offer');
        return redirect()->route('super.today_offer.index');                   
    }

    public function destroy($id)
    {
        $offer =  Todyoffer::findOrFail($id);
        $offer->delete();
        Toastr::error('Successfully Deleted This Offer');
        return redirect()->route('super.today_offer.index');
    }

    public function searchOffer(Request $request){
        $offers = Todyoffer::whereDate('offer_date',$request->offer_date)->get();
        return view('super.today_offer.search_result',compact('offers'));
    }
}
