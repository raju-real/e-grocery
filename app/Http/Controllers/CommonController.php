<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Model\Cart;
use App\Model\Buynow;
use App\Model\Modifylist;
use Illuminate\Support\Facades\Artisan;

class CommonController extends Controller
{
    // Remove Abuse Data
    public function removeAbuseData(){
        $lastWeek = Carbon::now()->subWeek();
        $fromDate = Carbon::now()->subDays(20)->toDateString();
        $carts = Cart::whereDate('updated_at','<=', $fromDate)->get();
        $buyNows = Buynow::whereDate('updated_at', '<=', $fromDate)->get();
        $modifyLists = Modifylist::whereDate('updated_at', '<=', $fromDate)->get();
        foreach($carts as $cart){
            $cart->delete();
        }
        foreach ($buyNows as $cart) {
            $cart->delete();
        }
        foreach ($modifyLists as $cart) {
            $cart->delete();
        }
    }

    // For Generate Random String
    public function generateRandomString($length) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    // Masking For Genaral Activity
    public function sendOtp($mobile_number,$message){
        $url = "http://66.45.237.70/api.php";
        $data= array(
            'username'=>"egrocery",
            'password'=>"49FT2DWZ",
            'number'=>$mobile_number,
            'message'=>$message
        );

        $ch = curl_init(); // Initialize cURL
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $smsresult = curl_exec($ch);
        $p = explode("|",$smsresult);
        $sendstatus = $p[0];

    }

    // Non Masking For Genaral Activity
    public function sendSms($mobile_no,$message){
        $url = 'https://71bulksms.com/sms_api/bulk_sms_sender_2.php';
        $ap_key='16715524639170032020/07/0710:10:53amegrocery';
        $sender_id=679;
        $user_email='egrocery.com.bd@gmail.com';
        $data = array('api_key' => $ap_key,
            'sender_id' => $sender_id,
            'message' => $message,
            'mobile_no' =>$mobile_no,
            'user_email'=> $user_email
        );

        // use key 'http' even if you send the request to https://...
        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'content' => http_build_query($data)
            )
        );
        $context  = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
//        print_r($result);
    }

    public function clear(){
        Artisan::call('cache:clear');
        Artisan::call('route:clear');
        // Artisan::call('config:cache');
        Artisan::call('config:clear');
        Artisan::call('view:clear');
        Artisan::call('optimize:clear');
    }
}
