<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Modifylist extends Model
{
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
