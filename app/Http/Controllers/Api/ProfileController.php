<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Model\Giftaddress;
use App\Model\Homeaddress;
use App\Model\Officeaddress;
use App\Model\User;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function getUser($token){
        $user = User::where('token',$token)->first();
        return $user;
    }

    public function getUserImage($token){
        $user = User::where('token',$token)->first();
        return response()->json(['image'  => $user->image]);
    }

    public function postUserImage(Request $request,$token){
        $user = User::where('token',$token)->first();
        if($file = $request->file('image')){
            if(file_exists('images/user/'.$user->image) AND !empty($user->image)){
                unlink('images/user/'.$user->image);
            }
            $image = $request->file('image');
            $imagename = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(380,350);
            $image_resize->save('images/user/'.$imagename);
        } else{
            $imagename = $user->image;
        }

        $user->image = $imagename;
        $user->save();
        return response()->json(['image'  => $imagename]);
    }

    public function updateUserImage(Request $request,$token){
        $user = User::where('token',$token)->first();
        if($file = $request->file('image')){
            if(file_exists('images/user/'.$user->image) AND !empty($user->image)){
                unlink('images/user/'.$user->image);
            }
            $image = $request->file('image');
            $imagename = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(380,350);
            $image_resize->save('images/user/'.$imagename);
        } else{
            $imagename = $user->image;
        }

        $user->image = $imagename;
        $user->save();
        return response()->json(['image'  => $imagename]);
    }

    public function UserInfoUpdate(Request $request, $token){
        $user = User::where('token',$token)->get();
        $id=$user[0]->id;
        $user = User::findOrFail($id);

        if($request->name){
            $user->name = $request->name;
        } else {
            $user->name = $user->name ;
        }
        if($request->email){
            $user->email = $request->email;
        } else{
            $user->email=$user->email;
        }
        if($request->mobile){
            $user->mobile = $request->mobile;
        } else{
            $user->mobile = $user->mobile;
        }
        if($request->gender){
            $user->gender = $request->gender;
        } else {
            $user->gender = $user->gender;
        }
        $user->save();
        return $user;
    }

    public function varifyMobile(Request $request){
        $this->validate($request,['mobile'=>'required']);
        $user = User::where('mobile',$request->mobile)->first();
        if(isset($user)){
            $user->mobileVarified = 1;
            $user->save();
            return response()->json(['message'=>'Successfully Varified']);
        } else {
            return response()->json(['message'=>'Invalid User']);
        }
    }

    // Adddress Part

    //Home Address
    public function homeAddressPost(Request $request, $token){
        $user = User::where('token',$token)->first();
        $id= $user->id;
        $homeAddress = new Homeaddress();
        $homeAddress->user_id = $id;
        $homeAddress->division_id = $request->division_id;
        $homeAddress->district_id = $request->district_id;
        $homeAddress->upazila_id = $request->upazila_id;
        $homeAddress->address = $request->address;
        if($request->upazila_id == 2){
            $homeAddress->delivery_charge = 0;
        }
        $check = Homeaddress::where('user_id',$id)->get();
        if(sizeof($check)>0){
             return response()->json(['You can now update your home address']);
        } else {
            $homeAddress->save();
            $homeAddress = Homeaddress::with('division','district','upazila','user')
            ->where('id',$homeAddress->id)->where('user_id',$id)
            ->first();
            return $homeAddress;
        }
    }

    public function homeAddressGet($token){
        $user = User::where('token',$token)->first();
        $id = $user->id;
        $homeaddress = Homeaddress::with('division','district','upazila','user')
            ->where('user_id',$id)->get();
        return $homeaddress;
    }

    public function homeAddressUpdate(Request $request, $token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $address = Homeaddress::where('user_id',$user_id)->first();
        $address->user_id = $user_id;
        $address->division_id = $request->division_id;
        $address->district_id = $request->district_id;
        $address->upazila_id = $request->upazila_id;
        $address->address = $request->address;
        if($request->upazila_id == 2){
            $address->delivery_charge = 0;
        }
        $address->save();
        $homeAddress = Homeaddress::with('division','district','upazila','user')
            ->where('user_id',$user_id)
            ->first();
        return $homeAddress;
    }

    // Office Address

    public function officeAddressPost(Request $request, $token){

        $user = User::where('token',$token)->first();
        $id= $user->id;
        $officeAddress = new Officeaddress();
        $officeAddress->user_id = $id;
        $officeAddress->name = $request->name;
        if($request->mobile){
            $officeAddress->mobile = $request->mobile;
        } else {
            $officeAddress->mobile = $user->mobile;
        }
        $officeAddress->division_id = $request->division_id;
        $officeAddress->district_id = $request->district_id;
        $officeAddress->upazila_id = $request->upazila_id;
        $officeAddress->address = $request->address;
        if($request->upazila_id == 2){
            $officeAddress->delivery_charge = 0;
        }
        $check = Officeaddress::where('user_id',$id)->get();
        if(sizeof($check) > 0){
            return response()->json(['You can now update your office address']);
        } else{
          $officeAddress->save();
            $officeAddress = Officeaddress::with('division','district','upazila','user')
                ->where('id',$officeAddress->id)
                ->where('user_id',$id)->first();
            return $officeAddress;
        }

    }

    public function officeAddressGet($token){
        $user = User::where('token',$token)->first();
        $id = $user->id;
        $officeAddress = Officeaddress::with('user','division','district','upazila')
            ->where('user_id',$id)->first();
        return $officeAddress;
    }

    public function officeAddressUpdate(Request $request, $token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $address = Officeaddress::where('user_id',$user_id)->first();
        $address->user_id = $user_id;
        $address->name = $request->name;
        if($request->mobile){
            $address->mobile = $request->mobile;
        } else {
            $address->mobile = $user->mobile;
        }
        $address->division_id = $request->division_id;
        $address->district_id = $request->district_id;
        $address->upazila_id = $request->upazila_id;
        $address->address = $request->address;
        if($request->upazila_id == 2){
            $address->delivery_charge = 0;
        }
        $address->save();
        $officeAddress = Officeaddress::with('division','district','upazila','user')
            ->where('user_id',$user_id)
            ->first();
        return $officeAddress;
    }

    // Gift Address

    public function giftAddressPost(Request $request, $token){

        $user = User::where('token',$token)->first();
        $id= $user->id;
        $giftAddress = new Giftaddress();
        $giftAddress->user_id = $id;
        $giftAddress->name = $request->name;
        $giftAddress->mobile = $request->mobile;
        $giftAddress->division_id = $request->division_id;
        $giftAddress->district_id = $request->district_id;
        $giftAddress->upazila_id = $request->upazila_id;
        $giftAddress->address = $request->address;
        if($request->upazila_id == 2){
            $giftAddress->delivery_charge = 0;
        }
        $check = Giftaddress::where('user_id',$id)->get();
        if(sizeof($check) > 0){
            return response()->json(['You can now update your giftAddress']);
        } else{
            $giftAddress->save();
            $giftAddress = Giftaddress::with('division','district','upazila','user')
            ->where('id',$giftAddress->id)
            ->where('user_id',$id)->first();
            return $giftAddress;
        }
    }

    public function giftAddressGet($token){
        $user = User::where('token',$token)->first();
        $id = $user->id;
        return $giftAddress = Giftaddress::with('user','division','district','upazila')
            ->where('user_id',$id)->first();
    }

    public function giftAddressUpdate(Request $request, $token){
        $user = User::where('token',$token)->first();
        $user_id = $user->id;
        $address = Giftaddress::where('user_id',$user_id)->first();
        $address->user_id = $user_id;
        $address->name = $request->name;
        $address->mobile = $request->mobile;
        $address->division_id = $request->division_id;
        $address->district_id = $request->district_id;
        $address->upazila_id = $request->upazila_id;
        $address->address = $request->address;
        if($request->upazila_id == 2){
            $address->delivery_charge = 0;
        }
        $address->save();
        $officeAddress = Giftaddress::with('division','district','upazila','user')
            ->where('user_id',$user_id)
            ->first();
        return $officeAddress;
    }



    // User Password Change
    public function updatePassword(Request $request,$token){
        $this->validate($request,[
            'old_password' => 'required',
            'password' => 'required',
            'confirm_password' => 'required'
        ]);
        $user = User::where('token',$token)->get();
        $id=$user[0]->id;
        $user = User::where('id',$id)->get();
        $cpassword = $user[0]->password;

        if (Hash::check($request->old_password,$cpassword)){
            if ($request->password==$request->confirm_password){
                $user = User::find($id);
                $user->password = Hash::make($request->password);
                $user->save();
                return $user;
            } else {
                return response()->json(['error'=>'Password Confirmation Failed'], 404);
            }
        } else {
            return response()->json(['error'=>'Current Password Does Not Match'], 404);
        }
    }
}
