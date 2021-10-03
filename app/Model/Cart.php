<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function orders(){
        return $this->belongsToMany(Order::class,'cart_orders')
            ->withTimestamps();
    }
}
