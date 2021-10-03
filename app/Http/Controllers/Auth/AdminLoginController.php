<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;

class AdminLoginController extends Controller
{
    public function __construct()
    {
        //$this->middleware('guest:admin', ['except' => ['admin-logout']]);
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function showSuperLoginForm()
    {
        return view('auth.super_login');
    }

    public function showAdminLoginForm()
    {
        return view('auth.admin_login');
    }

    public function superAdminLogin(Request $request)
    {
        // Validate the form data
        $this->validate($request, [
            'email'   => 'required|email',
            'password' => 'required|min:6'
        ]);
        // Attempt to log the user in
        if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
            // if successful, then redirect to their intended location
            return redirect()->intended(route('super.dashboard'));

        }

        // if unsuccessful, then redirect back to the login with the form data
        return redirect()->back()->withInput($request->only('email', 'remember'))->with('message','Email Or Password Mismatch');
    }

    public function adminLogin(Request $request)
    {
        //return $request;
        // Validate the form data
        $this->validate($request, [
            'mobile'   => 'required',
            'password' => 'required|min:6'
        ]);

        // Attempt to log the user in
        if (Auth::guard('admin')->attempt(['mobile' => $request->mobile, 'password' => $request->password], $request->remember)) {
            // if successful, then redirect to their intended location
            return redirect()->intended(route('super.dashboard'));

        } else {
            // if unsuccessful, then redirect back to the login with the form data
            return redirect()->back()->withInput($request->only('mobile', 'remember'))->with('message','Mobile Or Password Mismatch');
        }
        }



    public function superLogout()
    {
        Auth::guard('admin')->logout();
        Auth::guard('web')->logout();
        session()->flush();
        session()->regenerate();
        Toastr::warning('Super Admin Logout Successfully');
        //app('App\Http\Controllers\CommonController')->clear();
        return redirect()->route('super')
            ->with('message','Super Admin Logout Successfully');
    }

    public function adminLogout()
    {
        Auth::guard('admin')->logout();
        Auth::guard('web')->logout();
        session()->flush();
        session()->regenerate();
        return redirect()->route('admin')->with('message','Admin Logout Successfully');
    }
}
