<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Subsubcategory extends Model
{
    public function subcategory(){
    	return $this->belongsTo(Subcategory::class);
    }

    public function products(){
    	return $this->hasMany(Product::class);
    }
}
