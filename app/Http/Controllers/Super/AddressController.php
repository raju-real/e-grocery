<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\District;
use App\Model\Division;
use App\Model\Upazila;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;


class AddressController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function address(){
        return view('super.basic.address');
    }

    public function storeDivision(Request $request){
        $this->validate($request,[
            'division_name' => 'required'
        ]);

        $division = new Division();
        $division->division_name = $request->division_name;
        $division->save();
        Toastr::success('Division Successfully Added');
        return redirect()->back();
    }

    public function updateDivision(Request $request,$id){
        $this->validate($request,[
            'division_name' => 'required'
        ]);

        $division = Division::find($id);
        $division->division_name = $request->division_name;
        $division->save();
        Toastr::info('Division Successfully Updated');
        return redirect()->back();
    }

    public function destroyDivision($id){
        $division = Division::find($id);
        $division->delete();
        Toastr::error('Division Successfully Deleted');
        return redirect()->back();
    }

    // District Part

    public function storeDistrict(Request $request){
        $this->validate($request,[
            'division_id' => 'required',
            'district_name' => 'required'
        ]);

        $district = new District();
        $district->division_id = $request->division_id;
        $district->district_name = $request->district_name;
        $district->save();
        Toastr::success('District Successfully Added');
        return redirect()->back();
    }

    public function updateDistrict(Request $request,$id){
        $this->validate($request,[
            'division_id' => 'required',
            'district_name' => 'required'
        ]);

        $district = District::find($id);
        $district->division_id = $request->division_id;
        $district->district_name = $request->district_name;
        $district->save();
        Toastr::info('District Successfully Updated');
        return redirect()->back();
    }


    public function destroyDistrict($id){
        $district = District::find($id);
        $district->delete();
        Toastr::error('District Successfully Deleted');
        return redirect()->back();
    }

    // Upazila Part

    public function storeUpazila(Request $request){
        $this->validate($request,[
            'division_id' => 'required',
            'district_id' => 'required',
            'upazila_name' => 'required'
        ]);

        $upazila = new Upazila();
        $upazila->division_id = $request->division_id;
        $upazila->district_id = $request->district_id;
        $upazila->upazila_name = $request->upazila_name;
        $upazila->save();
        Toastr::success('Upazila Successfully Added');
        return redirect()->back();
    }

    public function updateUpazila(Request $request,$id){
        $this->validate($request,[
            'division_id' => 'required',
            'district_id' => 'required',
            'upazila_name' => 'required'
        ]);

        $upazila =  Upazila::find($id);
        $upazila->division_id = $request->division_id;
        $upazila->district_id = $request->district_id;
        $upazila->upazila_name = $request->upazila_name;
        $upazila->save();
        Toastr::success('Upazila Successfully Updated');
        return redirect()->back();
    }


    public function destroyUpazila($id){
        $upazila = Upazila::find($id);
        $upazila->delete();
        Toastr::error('Upazila Successfully Deleted');
        return redirect()->back();
    }
}
