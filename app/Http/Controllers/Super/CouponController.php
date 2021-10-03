<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Coupon;
use Brian2694\Toastr\Facades\Toastr;

class CouponController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index()
    {
        $coupons = Coupon::all();
        return view('super.coupon.index',compact('coupons'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'coupon_code' => 'required',
            'coupon_type' => 'required',
            'discount_amount' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
        ]);
        $coupon = new Coupon();
        $coupon->coupon_code = $request->coupon_code;
        $coupon->coupon_type = $request->coupon_type;
        $coupon->user_type = $request->user_type;
        $coupon->discount_amount = $request->discount_amount;
        $coupon->minimum_cost = $request->minimum_cost;
        if($request->minimum_cost < $request->discount_amount){
            Toastr::error('Cost Calculation Invalid');
            return redirect()->route('super.coupon.index');
        }
        $coupon->coupon_type = $request->coupon_type;
        $coupon->start_date = $request->start_date;
        $coupon->end_date = $request->end_date;
        if($request->end_date < $request->start_date){
            Toastr::error('Date Calculation Invalid');
            return redirect()->route('super.coupon.index');
        }
        $coupon->status = $request->status;
        $coupon->save();
        Toastr::success('Coupon Created Successfully');
        return redirect()->route('super.coupon.index');
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
        $coupon = Coupon::find($id);
        $coupon->coupon_code = $request->coupon_code;
        $coupon->coupon_type = $request->coupon_type;
        $coupon->user_type = $request->user_type;
        $coupon->discount_amount = $request->discount_amount;
        $coupon->minimum_cost = $request->minimum_cost;
        $coupon->coupon_type = $request->coupon_type;
        $coupon->start_date = $request->start_date;
        $coupon->end_date = $request->end_date;
        $coupon->status = $request->status;
        $coupon->save();
        Toastr::success('Coupon Updated Successfully');
        return redirect()->route('super.coupon.index');
    }

    public function destroy($id)
    {
        $coupon = Coupon::find($id);
        $coupon->delete();
        Toastr::error('Coupon Deleted Successfully');
        return redirect()->route('super.coupon.index');
    }
}
