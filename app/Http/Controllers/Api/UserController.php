<?php
namespace App\Http\Controllers\Api;
use App\OtpVerify;
use App\Model\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class UserController extends Controller
{
    public $successStatus = 200;

    public function otpGenerate(Request $request){
        $this->validate($request,['mobile'=>'required']);
        $mobile_no=$request->mobile;
        $check = User::where('mobile',$request->mobile)->first();
        if(isset($check)){
            return response()->json(['message'=>'You Are Already Registered']);
        } else {
            $otp = mt_rand(100000,999999);
            $o = "Otp";
            $c = 'Code';
            $message='Your egrocery.com.bd'.' '.$o.' '.$c.' is '.$otp;
            app('App\Http\Controllers\CommonController')->sendOtp($mobile_no,$message);
            return response()->json(
                [
                    'message'=>'Otp Code Sent',
                    'mobile'=> $mobile_no,
                    'otp_code'=> $otp
                ]
            );
        }
    }

    public function otpGenerate2(Request $request){
        $this->validate($request,['mobile'=>'required']);
        $mobile_no=$request->mobile;
        $check = User::where('mobile',$request->mobile)->first();
        if(isset($check)){
            $otp = mt_rand(100000,999999);
            $o = "Otp";
            $c = 'Code';
            $message='Your egrocery.com.bd'.' '.$o.' '.$c.' is '.$otp;
            app('App\Http\Controllers\CommonController')->sendOtp($mobile_no,$message);
            return response()->json(
                [
                    'message'=>'Otp Code Sent',
                    'mobile'=> $mobile_no,
                    'otp_code'=> $otp
                ]
            );

        } else {
            return response()->json(['message'=>'Invalid User']);
        }
    }

    public function forResetPassword(Request $request){
        $this->validate($request,['mobile'=>'required']);
        $mobile_no=$request->mobile;
        $check = User::where('mobile',$request->mobile)->first();
        if(isset($check)){
            $otp = mt_rand(100000,999999);
            $o = "Otp";
            $c = 'Code';
            $message='Your egrocery.com.bd'.' '.$o.' '.$c.' is '.$otp;
            app('App\Http\Controllers\CommonController')->sendOtp($mobile_no,$message);
            return response()->json(
                [
                    'message'=>'Otp Code Sent',
                    'mobile'=> $mobile_no,
                    'otp_code'=> $otp
                ]
            );

        } else {
            return response()->json(['message'=>'Invalid User']);
        }
    }

    public function resetPassword(Request $request){
        $user = User::where('mobile',$request->mobile)->first();
        if(isset($user)){
            $password = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            return [
                'message'=>'Password Set Successfully',
                'redirect'=>route('login')
            ];
        } else {
            return response()->json(['error'=>'Invalid User']);
        }

    }


    public function login(Request $request){
        $validator = Validator::make($request->all(), [
            'mobile' => 'required',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if (!$token = JWTAuth::attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // if (!$token = auth()->attempt($validator->validated())) {
        //     return response()->json(['error' => 'Unauthorized'], 401);
        // }

        return $this->createNewToken($token);
        // if(Auth::attempt(
        //     [
        //         'mobile' => request('mobile')  ,
        //         'password' => request('password')
        //     ]))
        //         {
        //             $user_id = Auth::user();
        //             $user = User::find($user_id->id);
        //             $randomString = app('App\Http\Controllers\CommonController')
        //                 ->generateRandomString(10);
        //             $user->token = $randomString;
        //             if($user->referral_code == null){
        //                 $referral_code = mt_rand(1000,9999);
        //                 $user->referral_code = $referral_code;
        //             }
        //             $user->save();
        //             return [$user];
        //         } else{
        //             return response()->json(['error'=>'Unauthorised'], 401);
        // }
    }


    public function register(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'mobile' => 'required|unique:users|min:11',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return "Registration failed";
        }
        $user = new User();
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->token = User::getToken(10);
        $user->referral_code = User::getReferralCode();
        if($request->referral){
            $findUser = User::where('referral_code',$request->referral)->first();
            if(isset($findUser)){
                $current_points =  $findUser->points;
                $findUser->points = $current_points + 10;
                $findUser->save();
                $user->user_id = $findUser->id;
            }
        }
        $user->password = bcrypt($request->password);
        $user->save();
        $user = User::find($user->id);
        return [$user];
    }

    protected function createNewToken($token){
        $user = auth()->user();
        $user->token = User::getToken(10);
        if ($user->referral_code == null) {
            $user->referral_code = User::getReferralCode();
        }
        $user->save();
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }

    public function refresh()
    {
        return $this->createNewToken(auth()->refresh());
    }

    public function details()
    {
        $user = Auth::user();
        return response()->json(['success' => $user], $this-> successStatus);
    }

    // public function logout($token){
    //     $user = User::where('token',$token)->first();
    //     $randomString = app('App\Http\Controllers\CommonController')
    //             ->generateRandomString(10);
    //     $user->token = $randomString;
    //     $user->save();
    //     return response()->json(['message','Successfully Logout']);
    // }

    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'User successfully signed out']);
    }

    // public function logout (Request $request) {

    //     $token = $request->user()->token();
    //     $token->revoke();

    //     $response = 'You have been succesfully logged out!';
    //     return response($response, 200);

    // }
}
