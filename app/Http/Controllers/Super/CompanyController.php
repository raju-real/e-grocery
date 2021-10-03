<?php

namespace App\Http\Controllers\Super;

use App\Http\Controllers\Controller;
use App\Model\Company;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;

class CompanyController extends Controller
{
    public function __construct()
    {
        app('App\Http\Controllers\CommonController')->clear();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $companies = Company::all();
        return view('super.basic.companies',compact('companies'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'company_name' =>'required',
            'mobile' =>'required',
            'address' =>'required',
            'supplier_name' =>'required',
            'supplier_mobile' =>'required',
            'image' =>'required',
        ]);

        $company = new Company();
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(300, 300);
            $image_resize->save('images/company/' .$imageName);
        }

        $company->company_name = $request->company_name;
        $company->mobile = $request->mobile;
        $company->address = $request->address;
        $company->supplier_name = $request->supplier_name;
        $company->supplier_mobile = $request->supplier_mobile;
        $company->image = $imageName;
        $company->save();
        Toastr::success('Company Information Successfully Added');
        return redirect()->back();

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $company = Company::find($id);
        if($file = $request->file('image')) {
            if(file_exists('images/company/'.$company->image) AND !empty($company->image)){
                unlink('images/company/'.$company->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(300, 300);
            $image_resize->save('images/company/' .$imageName);
        } else{
            $imageName = $company->image;
        }

        $company->company_name = $request->company_name;
        $company->mobile = $request->mobile;
        $company->address = $request->address;
        $company->supplier_name = $request->supplier_name;
        $company->supplier_mobile = $request->supplier_mobile;
        $company->image = $imageName;
        $company->save();
        Toastr::info('Company Information Successfully Updated');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $company = Company::find($id);
        if(file_exists('images/company/'.$company->image) AND !empty($company->image)){
            unlink('images/company/'.$company->image);
        }
        $company->delete();
        Toastr::info('Company Successfully Deleted');
        return redirect()->back();
    }
}
