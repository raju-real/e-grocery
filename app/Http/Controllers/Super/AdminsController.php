<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Admin;
use App\Model\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;

class AdminsController extends Controller
{
    public function index()
    {
        $admins = Admin::where('is_super',0)->get();
        return view('super.basic.admins',compact('admins'));
    }

    public function create()
    {
        return view('super.basic.create_admin');
    }

    public function store(Request $request)
    {
        $admin = new Admin();
        $admin->name = $request->name;
        $admin->job_status = $request->job_status;
        $admin->email = $request->email;
        $admin->mobile = $request->mobile;
        $admin->designation = $request->designation;
        $admin->product_management = $request->product_management;
        $admin->inventory_management = $request->inventory_management;
        $admin->order_management = $request->order_management;
        $admin->coupon_management = $request->coupon_management;
        $admin->bazarlist_management = $request->bazarlist_management;
        $admin->offer_management = $request->offer_management;
        $admin->password = Hash::make($request->password);
        $admin->show_password = $request->password;
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(300, 300);
            $image_resize->save('images/admin/' .$imageName);
        }
        $admin->image = $imageName;
        $admin->save();
        //$admin->roles()->sync($request->roles);
        Toastr::success('Admin Created Successfully');
        return redirect()->route('super.admin.index');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $admin = Admin::find($id);
        return view('super.basic.update_admin',compact('admin'));
    }

    public function update(Request $request, $id){
        $admin =  Admin::findOrFail($id);
        $admin->name = $request->name;
        $admin->job_status = $request->job_status;
        $admin->email = $request->email;
        $admin->mobile = $request->mobile;
        $admin->designation = $request->designation;
        $admin->product_management = $request->product_management;
        $admin->inventory_management = $request->inventory_management;
        $admin->order_management = $request->order_management;
        $admin->coupon_management = $request->coupon_management;
        $admin->bazarlist_management = $request->bazarlist_management;
        $admin->offer_management = $request->offer_management;
        $admin->password = Hash::make($request->password);
        $admin->show_password = $request->password;
        if($file = $request->file('image')) {
            if(file_exists('images/admin/'.$admin->image) AND !empty($admin->image)){
                unlink('images/admin/'.$admin->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(300, 350);
            $image_resize->save('images/admin/' .$imageName);
        } else{
            $imageName = $admin->image;
        }
        $admin->image = $imageName;
        $admin->save();
        //$admin->roles()->sync($request->roles);
        Toastr::info('Admin Updated Successfully');
        return redirect()->route('super.admin.index');
    }

    public function destroy($id)
    {
        $admin = Admin::find($id);
        if(file_exists('images/admin/'.$admin->image) AND !empty($admin->image)){
            unlink('images/admin/'.$admin->image);
        }
    }
}
