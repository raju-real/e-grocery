<?php

namespace App\Http\Controllers\User;

use App\Model\User;
use App\Model\Order;
use App\Model\Giftaddress;
use App\Model\Homeaddress;
use App\Model\OrderProduct;
use App\Model\Officeaddress;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;

class ProfileController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    public function invoice($order_id){
        $order = Order::findOrFail($order_id);
        $findOrder = OrderProduct::with('product')
        ->where('order_id', $order->id)
            ->get();
        //Qr code genarate
        $break =  "\n";
        $data = 'Order No.' . ' : ' . $order->order_number . $break .
            'Invoice.' . ' : ' . $order->invoice . $break .
            'Name' . ' : ' . $order->user->name . $break .
            'Mobile' . ' : ' . $order->user->mobile;
        $url =  file_get_contents('https://chart.googleapis.com/chart?chs=160x160&cht=qr&chl=' . urlencode($data));
        $imageName = 'images/invoice/' . $order->order_number . '.jpg';
        file_put_contents($imageName, $url);
        return view('user.profile.invoice', compact('order', 'findOrder'));
    }

    // Home Address
    public function homeAddressAdd(Request $request,$id){
        $this->validate($request,[
            'division_id' => 'required',
            'district_id' => 'required',
            'upazila_id'=>'required',
            'address' => 'required'
        ]);
        $user = User::where('id',$id)->first();
        $id= $user->id;
        $homeAddress = new Homeaddress();
        $homeAddress->user_id = $id;
        $homeAddress->division_id = $request->division_id;
        $homeAddress->district_id = $request->district_id;
        $homeAddress->upazila_id = $request->upazila_id;
        if($request->upazila_id == 2){
            $homeAddress->delivery_charge = 0;
        }
        $homeAddress->address = $request->address;
        $check = Homeaddress::where('user_id',$id)->get();
        if(sizeof($check)>0){
            Toastr::error('Error You Can Now Update Your Home Address');
            return redirect()->back();
        } else {
            $homeAddress->save();
            Toastr::success('Home Address Successfully Added');
            return redirect()->back();
        }
    }

    public function homeAddressUpdate(Request $request, $id){
        $user = User::where('id',$id)->first();
        $user_id = $user->id;
        $address = Homeaddress::where('user_id',$user_id)->first();
        $address->user_id = $user_id;
        $address->division_id = $request->division_id;
        $address->district_id = $request->district_id;
        $address->upazila_id = $request->upazila_id;
        if($request->upazila_id == 2){
            $address->delivery_charge = 0;
        } else {
            $address->delivery_charge = 45;
        }
        $address->address = $request->address;
        $address->save();
        Toastr::info('Home Address Successfully Updated');
        return redirect()->back();
    }

    // Office Address

    public function officeAddressAdd(Request $request, $id){

        $user = User::where('id',$id)->first();
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
        if($request->upazila_id == 2){
            $officeAddress->delivery_charge = 0;
        }
        $officeAddress->address = $request->address;
        $check = Officeaddress::where('user_id',$id)->get();
        if(sizeof($check) > 0){
            Toastr::error('You Can Now Update Now Your Office Address');
            return redirect()->back();
        } else{
            $officeAddress->save();
            Toastr::success('Office Address Successfully Added');
            return redirect()->back();
        }

    }

    public function officeAddressUpdate(Request $request, $id){
        $user = User::where('id',$id)->first();
        $user_id = $user->id;
        $officeAddress = Officeaddress::where('user_id',$user_id)->first();
        $officeAddress->user_id = $user_id;
        $officeAddress->name = $request->name;
        if($request->mobile){
            $officeAddress->mobile = $request->mobile;
        } else {
            $officeAddress->mobile = $user->mobile;
        }
        $officeAddress->division_id = $request->division_id;
        $officeAddress->district_id = $request->district_id;
        $officeAddress->upazila_id = $request->upazila_id;
        if($request->upazila_id == 2){
            $officeAddress->delivery_charge = 0;
        }
        $officeAddress->address = $request->address;
        $officeAddress->save();
        Toastr::info('Office Address Successfully Updated');
        return redirect()->back();
    }

    // Gift Address

    public function giftAddressAdd(Request $request, $id){

        $user = User::where('id',$id)->first();
        $id= $user->id;
        $giftAddress = new Giftaddress();
        $giftAddress->user_id = $id;
        $giftAddress->name = $request->name;
        $giftAddress->mobile = $request->mobile;
        $giftAddress->division_id = $request->division_id;
        $giftAddress->district_id = $request->district_id;
        $giftAddress->upazila_id = $request->upazila_id;
        if($request->upazila_id == 2){
            $giftAddress->delivery_charge = 0;
        }
        $giftAddress->address = $request->address;
        $check = Giftaddress::where('user_id',$id)->get();
        if(sizeof($check) > 0){
            Toastr::error('You Can Now Update Your Gift Address');
            return redirect()->back();
        } else{
            $giftAddress->save();
            Toastr::success('Gift Address Successfully Added');
            return redirect()->back();
        }
    }

    public function giftAddressUpdate(Request $request, $id){
        if(Auth::check()){
            $user = User::where('id',$id)->first();
            $user_id = $user->id;
            $address = Giftaddress::where('user_id',$user_id)->first();
            $address->user_id = $user_id;
            $address->name = $request->name;
            $address->mobile = $request->mobile;
            $address->division_id = $request->division_id;
            $address->district_id = $request->district_id;
            $address->upazila_id = $request->upazila_id;
            if($request->upazila_id == 2){
                $address->delivery_charge = 0;
            }
            $address->address = $request->address;
            $address->save();
            Toastr::info('Gift Address Successfully Updated');
            return redirect()->back();
        } else {
            Toastr::warning('You Are Unathorized');
            return redirect()->back();
        }
    }

    // User Info Update
    public function userInfoUpdate(Request $request, $id){

        if(Auth::check()){
            $user = User::find($id);
            $user->name = $request->name;
            $user->email = $request->email;
            $user->gender = $request->gender;
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
            Toastr::success('Profile Successfully Updated');
            return redirect()->back();
        } else {
            Toastr::warning('You Are Not Authorized');
            return redirect()->back();
        }
    }

    public function changeMobile(Request $request,$id){
        $this->validate($request,['mobile'=>'required']);
        $user = User::find($id);
        $check = User::where('mobile',$request->mobile)->get();
        if(sizeof($check) < 0){
            $user->mobile = $request->mobile;
            $user->save();
            Toastr::success('Mobile Number Changed Successfully');
            return redirect()->route('user.dashboard');
        } else {
            Toastr::error('This Mobile Already Used');
            return redirect()->route('user.dashboard');
        }

    }

    // User Password Change
    public function updatePassword(Request $request,$id){
        $this->validate($request,[
            'old_password' => 'required',
            'password' => 'required',
            'confirm_password' => 'required'
        ]);
        $user = User::where('id',$id)->first();
        $id=$user->id;
        $cpassword = $user->password;

        if (Hash::check($request->old_password,$cpassword)){
            if ($request->password==$request->confirm_password){
                $user = User::find($id);
                $user->password = Hash::make($request->password);
                $user->save();
                Toastr::success('Password Successfully Updated');
                return redirect()->route('user.dashboard');
            } else {
                Toastr::warning('Password Confirmation Failed');
                return redirect()->back();
            }
        } else {
            Toastr::error('Current Password Does Not Match');
            return redirect()->back();
        }
    }

}
