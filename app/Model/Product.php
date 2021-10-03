<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [];

    public function images(){
    	return $this->hasMany(ImageProduct::class);
    }

    public function sizes(){
    	return $this->belongsToMany(Size::class,'product_sizes')->withTimestamps();
    }

    public function units(){
    	return $this->belongsToMany(Unit::class,'product_units')->withTimestamps();
    }

    public function colors(){
    	return $this->belongsToMany(Color::class,'color_products')->withTimestamps();
    }

    public function category(){
    	return $this->belongsTo(Category::class);
    }

    public function company(){
        return $this->belongsTo(Company::class,'company_id');
    }

    public function subcategory(){
    	return $this->belongsTo(Subcategory::class);
    }

    public function subsubcategory(){
        return $this->belongsTo(Subsubcategory::class);
    }

    public function admin(){
    	return $this->belongsTo(Admin::class);
    }

    public function carts(){
        return $this->hasMany(Cart::class);
    }

    public function todayoffer(){
        return $this->hasMany(Todyoffer::class);
    }

    public function weeklyoffer(){
        return $this->hasMany(Weeklyoffer::class);
    }

    public function promotion(){
        return $this->hasMany(Promotionproduct::class);
    }

    public function slider(){
        return $this->hasMany(Sliderproduct::class);
    }

    public static function getProductCode(){
        $latestCode = Product::latest('id')->whereNotNull('product_code')->first();
            $productCode = str_pad(1, 4, "0", STR_PAD_LEFT);
            if ($latestCode) {
                $lastCode = $latestCode->product_code;
                if ($lastCode != null) {
                    $newCode = $lastCode + 1;
                    $productCode = str_pad($newCode, 4, "0", STR_PAD_LEFT);;
                } else {
                    $productCode = str_pad(1, 4, "0", STR_PAD_LEFT);
                }
            }
        if(Product::where('product_code',$productCode)->exists()){
            Product::getProductCode();
        }
        return $productCode;
    }
}
