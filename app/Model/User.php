<?php

namespace App\Model;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // For jwt authenticaiton
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

//  Relational Database Part

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function referrals(){
        return $this->hasMany(User::class);
    }

    public function users(){
        return $this->hasMany(User::class);
    }

    public function homeaddress(){
        return $this->belongsTo(Homeaddress::class);
    }

    public static function getReferralCode(){
        $referral_code = mt_rand(1000, 9999);
        if (User::where('referral_code', $referral_code)->exists()) {
            User::getReferralCode();
        }
        return $referral_code;
    }

    public static function getToken($length){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        if(User::where('token',$randomString)->exists()){
            User::getToken(10);
        }
        return $randomString;
    }

}
