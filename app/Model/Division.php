<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Division extends Model
{
    public function districts(){
        return $this->hasMany(District::class);
    }

    public function upazilas(){
        return $this->hasMany(Upazila::class);
    }

    public function homeaddress(){
        return $this->hasMany(Homeaddress::class);
    }
}
