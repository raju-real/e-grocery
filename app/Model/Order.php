<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function products(){
        return $this->hasMany(OrderProduct::class);
    }

    public static function getOrderNumber(){
        $latestOrderNumber = Order::latest('id')->whereNotNull('order_number')->first();
        $newOrderNumber = str_pad(1, 6, "0", STR_PAD_LEFT);
        if ($latestOrderNumber) {
            $lastOrderNumber = $latestOrderNumber->order_number;
            if ($lastOrderNumber != null) {
                $newSerialNumber = $lastOrderNumber + 1;
                $newOrderNumber = str_pad($newSerialNumber, 6, "0", STR_PAD_LEFT);;
            } else {
                $newOrderNumber = str_pad(1, 6, "0", STR_PAD_LEFT);
            }
        }
        if(Order::where('order_number',$newOrderNumber)->exists()){
            Order::getOrderNumber();
        }
        return $newOrderNumber;
    }

    public static function getInvoiceNumber(){
        $orderInvoice = "EG-" . mt_rand(10000000, 99999999);
        if (Order::where('invoice', $orderInvoice)->exists()) {
            Order::getInvoiceNumber();
        }
        return $orderInvoice;
    }
}
