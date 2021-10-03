<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Bazarlist extends Model
{
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
