<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Model\Homeaddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function userDashboard(){
        if(Auth::check()){
            return view('user.profile.dashboard');
        } else {
            return redirect()->back();
        }

    }
}
