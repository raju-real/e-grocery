<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\OrderProduct;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;


class OrderController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function newOrder(){
        $orders = Order::where('status',1)->get();
        return view('super.order.new_order',compact('orders'));
    }

    public function orderView($order_id){
        $order = Order::find($order_id);
        $findOrder = OrderProduct::with('product')
            ->where('order_id',$order->id)
            ->get();
        return view('super.order.order_view',compact('order','findOrder'));
    }

    public function pendingOrder(){
        $orders = Order::where('status',1)->get();
        return view('super.order.pending_order',compact('orders'));
    }

    public function receivedOrder(){
        $orders = Order::where('status',2)->get();
        return view('super.order.received_order',compact('orders'));
    }

    public function processedOrder(){
        $orders = Order::where('status',3)->get();
        return view('super.order.processed_order',compact('orders'));
    }

    public function cancelOrder($order_id){
        $order = Order::findOrFail($order_id);
        $order->status = 5;
        $order->save();
        $orders = Order::where('status',5)->get();
        Toastr::info('Order Successfully Cancelled');
        return view('super.order.canclled_order',compact('orders'));
    }

    public function cancelledOrder(){
        $orders = Order::where('status',5)->get();
        return view('super.order.canclled_order',compact('orders'));
    }

    public function deliveredOrder(){
        $orders = Order::where('status',4)->get();
        return view('super.order.delivered_order',compact('orders'));
    }

    public function receiveOrder($order_id){
        $order = Order::findOrFail($order_id);
        $order->status = 2;
        $order->save();
        $orders = Order::where('status',2)->get();
        Toastr::success('Order Successfully Received');
        return view('super.order.received_order',compact('orders'));
    }

    public function processOrder($order_id){
        $order = Order::findOrFail($order_id);
        $order->status = 3;
        $order->save();
        $orders = Order::where('status',3)->get();
        Toastr::success('Order Successfully Received');
        return view('super.order.processed_order',compact('orders'));
    }

    public function makeOrderInvoice($order_id){
        $order = Order::findOrFail($order_id);
        $findOrder = OrderProduct::with('product')
            ->where('order_id',$order->id)
            ->get();
        //Qr code genarate
        $break =  "\n";
        $data = 'Order No.' . ' : ' . $order->order_number . $break .
            'Invoice.' . ' : ' . $order->invoice . $break .
            'Name' . ' : ' . $order->user->name . $break .
            'Mobile' . ' : ' . $order->user->mobile;
        $url =  file_get_contents('https://chart.googleapis.com/chart?chs=160x160&cht=qr&chl=' . urlencode($data));
        $imageName = 'images/invoice/' . $order->order_number . '.jpg';
        file_put_contents($imageName, $url);
        return view('super.order.invoice',compact('order','findOrder'));
    }

    public function deliverOrder($order_id){
        $order = Order::findOrFail($order_id);
        $order->status = 4;
        $order->save();
        $orders = Order::where('status',4)->get();
        Toastr::success('Order Successfully On Delivered');
        return view('super.order.delivered_order',compact('orders'));
    }

    public function deleteOrder($order_id){
        $order = Order::find($order_id);
        if($order){
            $orderProducts = OrderProduct::where('order_id',$order_id)->get();
            if(sizeof($orderProducts) > 0){
                foreach ($orderProducts as $product){
                    $product->delete();
                }
            }
            $order->delete();
        } else{
            return redirect()->route('super.new_order');
        }
        Toastr::success('Order Successfully Deleted');
        return redirect()->route('super.new_order');
    }

    public function orderSearchPage(){
        return view('super.order.order_search_page');
    }

    public function searchOrder(Request $request){
        $this->validate($request,['number'=>'required']);
        $order = Order::where('order_number',$request->number)
                ->orWhere('invoice',$request->number)->first();
        if($order){
            $findOrder = OrderProduct::with('product')
                ->where('order_id',$order->id)
                ->get();
            return view('super.order.order_view',compact('order','findOrder'));
        } else {
            Toastr::error('No Order Found');
            return redirect()->back();
        }

    }
}
