<?php

namespace App\Http\Controllers\Auth;

use App\OtpVerify;
use App\Model\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;


class LoginController extends Controller
{

    use AuthenticatesUsers;

    //protected $redirectTo = '/';

//    protected function redirectPath()
//    {
//        $user_id = Auth::user()->id;
//        $user = User::find($user_id);
//        $randomString = Str::random(10);
//        $user->token = $randomString;
//        if($user->save()){
//            return '/user/dashboard';
//        }
//    }


    public function userLogin(Request $request){
        // Validate the form data, Regular login
        $this->validate($request, [
            'mobile'   => 'required',
            'password' => 'required'
        ]);

        // Attempt to log the user in
        if (Auth::guard()->attempt(['mobile' => $request->mobile,
            'password' => $request->password])) {
            $user = Auth::user();
            $user->token = User::getToken(10);
            if($user->referral_code == null){
                $user->referral_code = User::getReferralCode();
            }
            $user->save();
            $current_url = Session::get('current_url');

            if(!empty($current_url)){
                return ['redirect'=>$current_url];
            } else{
                return ['redirect'=>route('user.dashboard')];
            }

            //return redirect()->intended(route('user.dashboard'));

        } else {
            return response()->json(['message'=>'Mobile And Password Missmatched']);
        }

        // if unsuccessful, then redirect back to the login with the form data
        return redirect()->back()->withInput($request->only('mobile', 'remember'));

        // JWT LOGIN
         // $validator = Validator::make($request->all(), [
        //     'mobile' => 'required',
        //     'password' => 'required|string|min:6',
        // ]);

        // if ($validator->fails()) {
        //     return response()->json(['message' => 'Mobile And Password Field Required']);
        // }

        // if (!$token = Auth::guard()->attempt($validator->validated())) {
        //     return response()->json(['message' => 'Mobile And Password Missmatched']);
        // }

        // return $this->createNewToken($token);
    }

    protected function createNewToken($token)
    {
        $user = Auth::user();
        $user->token = User::getToken(10);
        if ($user->referral_code == null) {
            $referral_code = mt_rand(1000, 9999);
            if(User::where('referral_code',$referral_code)->exists()){
                $referral_code = mt_rand(1000, 9999);
            }
            $user->referral_code = $referral_code;
        }
        $user->save();
        $current_url = Session::get('current_url');

        if (!empty($current_url)) {
            $url = $current_url;
            //return ['redirect' => $current_url];
        } else {
            $url = route('user.dashboard');
            //return ['redirect' => route('user.dashboard')];
        }
        return response()->json([
            'redirect' => $url,
            'access_token' => $token,
            'token_type' => 'bearer'
        ]);
    }

    public function showPasswordReset(){
        return view('auth.reset_password');
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('home');
    }


    // public function __construct()
    // {
    //     $this->middleware('guest')->except('logout');
    // }
}
