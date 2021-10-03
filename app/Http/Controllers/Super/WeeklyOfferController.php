<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Weeklyoffer;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class WeeklyOfferController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    // public function index(Request $request)
    //     {
    //       this->validate($request,[
    //        'start_date' => 'required|date',
    //        'end_date' => 'required|date|before_or_equal:start_date',
    //       ]);

    //       $start = Carbon::parse($request->start_date);
    //       $end = Carbon::parse($request->end_date);

    //       $get_all_user = User::whereDate('date','<=',$end->format('m-d-y'))
    //       ->whereDate('date','>=',$start->format('m-d-y'));

    //       return view('userPage.index', compact('get_all_user'));
    //     }

    public function index()
    {
        $offers = Weeklyoffer::latest()->get();
        $startDate = Carbon::today();
        $endDate = Carbon::today()->endOfWeek();
        //$endDate1 = $startDate->addDays(6);

        $reports = Weeklyoffer::with('product')
            ->whereDate('start_date',$startDate)
            ->whereDate('end_date',$endDate)->get();
        $products = Product::where('discount_price',null)->get();
        return view('super.weekly_offer.index',compact('offers','products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $products = Product::where('discount_price',null)->get();
        return view('super.weekly_offer.create',compact('products'));
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
            'product_id'=>'required',
            'start_date'=>'required',
            'end_date'=>'required',
            'offer_price'=>'required'
        ]);

        $offer = new Weeklyoffer();
        $offer->admin_id = Auth::id();
        $offer->product_id = $request->product_id;
        $offer->start_date = $request->start_date;
        $offer->end_date = $request->end_date;
        if($request->end_date < $request->start_date){
            return redirect()->back()->with('message', 'End date can not be less than Start date');
        }
        $offer->offer_price = $request->offer_price;
        $offer->status = $request->status;
        $product = Product::find($request->product_id);
        if($request->offer_price > $product->unit_price){
            return redirect()->back()->with('message','Offer price can not grater than product current price');
        }
        $check = Weeklyoffer::where('start_date',$request->start_date)
            ->where('end_date',$request->end_date)
            ->where('product_id',$request->product_id)
            ->get();
        if(sizeof($check) > 0){
            Toastr::error('This product already added on this offer');
            return redirect()->back();
        } else{
            $offer->save();
            Toastr::success('Product Successfully Added On Weekly Offer');
            return redirect()->route('super.weekly_offer.index');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $offer = Weeklyoffer::findOrFail($id);
        $products = Product::where('discount_price',null)->get();
        return view('super.weekly_offer.edit',compact('offer','products'));
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
        $this->validate($request,[
            'product_id'=>'required',
            'start_date'=>'required',
            'end_date'=>'required',
            'offer_price'=>'required'
        ]);

        $offer = Weeklyoffer::findOrFail($id);
        $offer->admin_id = Auth::id();
        $offer->product_id = $request->product_id;
        $offer->start_date = $request->start_date;
        $offer->end_date = $request->end_date;
        if ($request->end_date < $request->start_date) {
            return redirect()->back()->with('message', 'End date can not be less than Start date');
        }
        $offer->offer_price = $request->offer_price;
        $offer->status = $request->status;
        $product = Product::find($request->product_id);
        if($request->offer_price > $product->unit_price){
            return redirect()->back()->with('message','Offer price can not grater then product current price');
        }
        $offer->save();
        Toastr::success('Product Successfully Updated');
        return redirect()->route('super.weekly_offer.index');

    }

    public function destroy($id)
    {
        $offer =  Weeklyoffer::findOrFail($id);
        $offer->delete();
        Toastr::error('Successfully Deleted This Offer');
        return redirect()->route('super.weekly_offer.index');
    }

    public function searchOffer(Request $request){
        $start = Carbon::parse($request->start_date);
        $end = Carbon::parse($request->end_date);
        $offers = Weeklyoffer::with('product','product.weeklyoffer')
        ->whereDate('start_date',$start)
        ->whereDate('end_date',$end)->get();
        return $offers;
        return view('super.weekly_offer.search_result',compact('offers'));
    }

}
