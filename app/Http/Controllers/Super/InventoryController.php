<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Inventory;
use App\Model\Order;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class InventoryController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function inventoryIndex(){
        $inventories = Inventory::with('product','admin')->get();
        return view('super.inventory.index',compact('inventories'));
    }

    public function createInventory(){
        return view('super.inventory.create');
    }

    public function storeInventory(Request $request){
        $this->validate($request,[
            'product_id' => 'required',
            'quantity' => 'required',
            'buying_price' => 'required',
            'currency' => 'required',
            'selling_unit_price' => 'required',
        ]);

        $inventory = new Inventory();
        $inventory->create_date = $request->create_date;
        $inventory->admin_id = Auth::user()->id;
        $inventory->product_id = $request->product_id;
        $inventory->quantity = $request->quantity;
        $inventory->currency = $request->currency;
        $inventory->buying_price = $request->buying_price;
        $inventory->buying_unit_price = $request->buying_price / $inventory->quantity;
        $inventory->selling_unit_price = $request->selling_unit_price;
        $selling_price = $inventory->selling_unit_price * $inventory->quantity;
        $inventory->selling_price = $selling_price;
        $inventory->save();
        Toastr::success('Inventory Added Successfully');
        return redirect()->route('super.inventory');
    }

    public function showInventory($id){
        $inventory = Inventory::find($id);
        return view('super.inventory.show',compact('inventory'));
    }

    public function editInventory($id){
        $inventory = Inventory::find($id);
        return view('super.inventory.inventory_edit',compact('inventory'));
    }

    public function updateInventory(Request $request,$id){
        $this->validate($request,[
            'product_id' => 'required',
            'quantity' => 'required',
            'buying_price' => 'required',
            'currency' => 'required',
            'selling_unit_price' => 'required',
        ]);

        $inventory =  Inventory::findOrFail($id);
        $inventory->create_date = $request->create_date;
        $inventory->admin_id = Auth::user()->id;
        $inventory->product_id = $request->product_id;
        $inventory->quantity = $request->quantity;
        $inventory->currency = $request->currency;
        $inventory->buying_price = $request->buying_price;
        $inventory->buying_unit_price = $request->buying_price / $inventory->quantity;
        $inventory->selling_unit_price = $request->selling_unit_price;
        $selling_price = $inventory->selling_unit_price * $inventory->quantity;
        $inventory->selling_price = $selling_price;
        $inventory->save();
        Toastr::info('Inventory Updated Successfully');
        return redirect()->route('super.inventory');
    }

    public function buyingReports(){
        $todayInventories = Inventory::whereDate('create_date', Carbon::today())->get();
        $weeklyInventories = Inventory::whereBetween('create_date',
            [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])->get();
        $monthlyInventories = Inventory::whereBetween('create_date',[Carbon::now()
            ->startOfMonth(), Carbon::now()->endOfMonth()])->get();
        return view('super.inventory.buying_reports',compact(
            'todayInventories','weeklyInventories','monthlyInventories'
        ));
    }

    public function buyingSingleDate(Request $request){
        $this->validate($request,['date'=>'required']);
        $inventories = Inventory::where('create_date',$request->date)->get();
        $message = $request->date . "Buying Reports";
        return view('super.inventory.search_report_result',compact('inventories','message'));
    }

    public function buyingDateWise(Request $request){
        $this->validate($request,['from'=>'required','to'=>'required']);
        $date_from = $request->from;
        $date_to = $request->to;
        $from = date($date_from);
        $to = date($date_to);
        $message = $date_from . " To ".$date_to . " Buying Reports";
        $inventories = Inventory::whereBetween('create_date', array($from, $to))->get();
        return view('super.inventory.search_report_result',compact('inventories','message'));
    }

    public function todayBuyingReport(){
        $inventories = Inventory::whereDate('created_at', Carbon::today())->get();
        $message = "Today Buying Reports";
        return view('super.inventory.search_report_result',compact('inventories','message'));
    }

    public function weeklyBuyingReport(){
        $inventories = Inventory::whereBetween('create_date',
            [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])->get();
        $message = "Weekly Buying Reports";
        return view('super.inventory.search_report_result',compact('inventories','message'));
    }

    public function monthlyBuyingReport(){
        $inventories = Inventory::whereBetween('create_date',[Carbon::now()
            ->startOfMonth(), Carbon::now()->endOfMonth()])->get();
        $message = "Monthly Buying Reports";
        return view('super.inventory.search_report_result',compact('inventories','message'));
    }

    // Selling Reports Part
    public function sellingReports(){
        $todayInventories = Order::where('status',4)->whereDate('updated_at', Carbon::today())->get();
        $weeklyInventories = Order::where('status',4)->whereBetween('updated_at',
            [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])->get();
        $monthlyInventories = Order::where('status',4)->whereBetween('updated_at',[Carbon::now()
            ->startOfMonth(), Carbon::now()->endOfMonth()])->get();
        return view('super.inventory.selling_reports',compact(
            'todayInventories','weeklyInventories','monthlyInventories'
        ));
    }

    public function sellingSingleDate(Request $request){
        $this->validate($request,['date'=>'required']);
        $date = date($request->date);
        $inventories = Order::where('status',4)->where('updated_at',$date)->get();
        $message = $request->date . " Selling Reports";
        return view('super.inventory.selling_search_result',compact('inventories','message'));
    }

    public function sellingDateWise(Request $request){
        $this->validate($request,['from'=>'required','to'=>'required']);
        $date_from = $request->from;
        $date_to = $request->to;
        $from = date($date_from);
        $to = date($date_to);
        $message = $date_from . " To ".$date_to . " Selling Reports";
        $inventories = Order::where('status',4)
                        ->whereBetween('updated_at', array($from, $to))->get();
        return view('super.inventory.selling_search_result',compact('inventories','message'));
    }

    public function todaySellingReport(){
        $inventories = Order::where('status',4)
                        ->whereDate('updated_at', Carbon::today())->get();
        $message = "Today Selling Reports";
        return view('super.inventory.selling_search_result',compact('inventories','message'));
    }

    public function weeklySellingReport(){
        $inventories = Order::where('status',4)->whereBetween('updated_at',
            [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])->get();
        $message = "Weekly Buying Reports";
        return view('super.inventory.selling_search_result',compact('inventories','message'));
    }

    public function monthlySellingReport(){
        $inventories = Order::where('status',4)->whereBetween('updated_at',[Carbon::now()
            ->startOfMonth(), Carbon::now()->endOfMonth()])->get();
        $message = "Monthly Selling Reports";
        return view('super.inventory.selling_search_result',compact('inventories','message'));
    }


}
