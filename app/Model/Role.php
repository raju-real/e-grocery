<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    public function admins(){
        return $this->hasMany(Admin::class);
    }
}
