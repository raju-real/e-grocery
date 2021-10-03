<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Homeaddress extends Model
{
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function division(){
        return $this->belongsTo(Division::class);
    }

    public function district(){
        return $this->belongsTo(District::class);
    }

    public function upazila(){
        return $this->belongsTo(Upazila::class);
    }
}
