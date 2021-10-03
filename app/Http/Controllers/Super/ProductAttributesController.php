<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Model\Unit;
use App\Model\Size;
use App\Model\Color;
use App\Model\ProductSize;
use App\Model\ProductUnit;
use App\Model\ColorProduct;

class ProductAttributesController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function index(){
        return view('super.category.attributes');
    }

    public function getUnit(){
        $units = Unit::latest()->get();
        return response()->json($units);
    }

    public function unitStore(Request $request){
        $this->validate($request,['unit'=>'required']);
        $unit = new Unit();
        $unit->unit = $request->unit;
        $unit->save();
        return response()->json("New Unit Added");
    }

    public function unitUpdate(Request $request,$id){
        $this->validate($request,['unit'=>'required']);
        $unit = Unit::findOrFail($id);
        $unit->unit = $request->unit;
        $unit->save();
        Toastr::info('Unit Successfully Updated');
        return redirect()->back();
    }

    public function unitDestroy($id){
        $unit = Unit::findOrFail($id);
        $check = ProductUnit::where('unit_id',$id)->get();
        if(sizeof($check)>0){
            Toastr::info('This Unit Added On Some Product,Edit First');
        } else {
            $unit->delete();
            Toastr::error('Unit Successfully Deleted');
            return redirect()->back();
        }
    }

    // Size Part
    public function sizeStore(Request $request){
        $this->validate($request,['size'=>'required']);
        $size = new Size();
        $size->size = $request->size;
        $size->save();
        return response()->json("New Size Added");
        // Toastr::success('Size Successfully Stored');
        // return redirect()->back();
    }

    public function sizeUpdate(Request $request,$id){
        $this->validate($request,['size'=>'required']);
        $size = Size::findOrFail($id);
        $size->size = $request->size;
        $size->save();
        Toastr::info('Size Successfully Updated');
        return redirect()->back();
    }

    public function sizeDestroy($id){
        $size = Size::findOrFail($id);
        $check = ProductSize::where('size_id',$id)->get();
        if(sizeof($check)>0){
            Toastr::info('This Size Added On Some Product,Edit First');
        } else {
            $size->delete();
            Toastr::error('Size Successfully Deleted');
            return redirect()->back();
        }
    }

    // Color Part

    public function colorStore(Request $request){
        $this->validate($request,['color'=>'required']);
        $color = new Color();
        $color->color = $request->color;
        $color->save();
        return response()->json("New Color Added");
        // Toastr::success('Color Successfully Stored');
        // return redirect()->back();
    }

    public function colorUpdate(Request $request,$id){
        $this->validate($request,['color'=>'required']);
        $color = Color::findOrFail($id);
        $color->color = $request->color;
        $color->save();
        Toastr::info('Color Successfully Updated');
        return redirect()->back();
    }

    public function colorDestroy($id){
        $color = Color::findOrFail($id);
        $check = ColorProduct::where('unit_id',$id)->get();
        if(sizeof($check)>0){
            Toastr::info('This Color Added On Some Product,Edit First');
        } else {
            $color->delete();
            Toastr::error('Color Successfully Deleted');
            return redirect()->back();
        }
    }
}
