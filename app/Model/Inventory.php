<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function admin(){
        return $this->belongsTo(Admin::class);
    }
}
