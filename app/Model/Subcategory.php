<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Subcategory extends Model
{
    public function category(){
    	return $this->belongsTo(Category::class);
    }

    public function subsubcategories(){
    	return $this->hasMany(Subsubcategory::class);
    }

    public function products(){
        return $this->hasMany(Product::class);
    }
}
