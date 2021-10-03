<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Franchies;
use Illuminate\Http\Request;

class FranchisesController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function allFranchises(){
        $franchises = Franchies::latest()->get();
        return view('super.basic.franchises',compact('franchises'));
    }
}
