<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\RegistersUsers;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{

    use RegistersUsers;


    //protected $redirectTo = '/';


//    public function __construct()
//    {
//        $this->middleware('guest');
//    }

    public function showRegistrationForm(Request $request)
    {
        $mobile = $request->mobile;
        return view('auth.register',compact('mobile'));
    }

    public function showForm(){
        return view('auth.otp');
    }

    public function userRegister(Request $request){
       $this->validate($request,[
           'name' => ['required', 'string', 'max:255'],
           'mobile'=>['required','unique:users'],
           'password' => ['required', 'string', 'min:6'],
           'confirm_password' => ['required', 'string', 'min:6'],
       ]);

        $user = new User();
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->token = User::getToken(10);
        $user->referral_code = User::getReferralCode();
        if($request->mobileVarified == 1){
            $user->mobileVarified = 1;
        } else{
            $user->mobileVarified = 0;
        }
        if($request->referral){
            $findUser = User::where('referral_code',$request->referral)->first();
            if(isset($findUser)){
                $current_points =  $findUser->points;
                $findUser->points = $current_points + 10;
                $findUser->save();
                $user->user_id = $findUser->id;
            }
        }
        if($request->password == $request->confirm_password){
            $user->password = Hash::make($request->password);
        } else {
            return response()->json(['error'=>'Password not matched']);
        }

        $user->save();
        Toastr::success('Registration Successfull');
        return ['redirect' => route('login')];

    }

    /*
        $referral_code = rand(10,99);  // generate 2 digit unique random number in php
        $referral_code = rand(1000,9999);  // generate 4 digit unique random number in php
        $referral_code = rand(100000,999999);  // generate 6 digit unique random number in php
        $referral_code = rand(10000000,99999999);  // generate 8 digit unique random number in php
    // Random string == $random = Str::random(10);
    */


    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'mobile'=>['required','unique:users'],
            'password' => ['required', 'string', 'min:6'],
        ]);
    }



    protected function redirectPath()
    {
         return '/user/dashboard';
    }

    protected function create(array $data)
    {
        $randomString = app('App\Http\Controllers\CommonController')
            ->generateRandomString(10);
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'mobile' => $data['mobile'],
            'token' => $randomString,
            'password' => Hash::make($data['password']),
        ]);
    }
}
