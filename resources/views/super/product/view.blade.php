@extends('admin.layouts.app')
@section('title','Details About'.' '.$product->product_name)
@push('css')

<style>
    table, th {
        border: 1px solid #dee2e6;
        text-align: left;
        }

    .head_styls{
            width: 300px;
            text-align: left;
       }
</style>

 @endpush

@section('content')
    <div class="col-md-12">
        <div class="tile">
            <h3 class="tile-title">Product Details
                <span style="float: right">
                    <a href="{{ route('super.product.index') }}"
                       class="btn btn-danger">
                    Back
                </a>
                <a href="{{ route('super.product.edit',$product->id) }}"
                   class="btn btn-info">
                    <i class="fa fa-edit"></i>
                    Edit Product
                </a>
                </span>
            </h3>
            <div class="table-responsive">
                <table class="table table-hover" style="width: 100%;">
                    <thead>
                    <tr>
                        <th class="head_styls">Added By</th>
                        <th>:</th>
                        <th>
                            <a class="btn btn-info" data-toggle="modal"
                               href='#quick-view{{ $product->admin->id }}' title="Quick View">
                                {{ $product->admin->name }}
                            </a>
                            <div class="modal fade" id="quick-view{{ $product->admin->id }}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" style="float: left;">
                                                {{ $product->admin->name }}
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Mobile</th>
                                                    <th>:</th>
                                                    <th>{{ $product->admin->mobile }}</th>
                                                </tr>
                                                <tr>
                                                    <th>Email</th>
                                                    <th>:</th>
                                                    <th>{{ $product->admin->email }}</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </th>
                    </tr>
                        <tr>
                            <th>Product Code</th>
                            <th>:</th>
                            <th>{{ $product->product_code }}</th>
                        </tr>
                    <tr>
                        <th>SKU</th>
                        <th>:</th>
                        <th>{{ $product->sku }}</th>
                    </tr>
                        <tr>
                            <th>Product Name</th>
                            <th>:</th>
                            <th>{{ $product->product_name }}</th>
                        </tr>
                        <tr>
                            <th>Product Category</th>
                            <th>:</th>
                            <th>{{ $product->category->name }}</th>
                        </tr>
                        <tr>
                            <th>Sub Category</th>
                            <th>:</th>
                            <th>
                                @if($product->subcategory_id != null)
                                    @php
                                        $subcategory = App\Model\Subcategory::where('id',$product->subcategory_id)->first();
                                    @endphp
                                    {{ $subcategory ? $subcategory->name : '' }}
                                    @else {{ '' }}
                                @endif
                            </th>
                        </tr>
                        <tr>
                            <th>Sub Sub Category</th>
                            <th>:</th>
                            <th>
                                @if($product->subsubcategory_id != null)
                                    @php
                                        $subsubcategory = App\Model\Subcategory::where('id',$product->subsubcategory_id)->first();
                                    @endphp
                                    {{ $subsubcategory ? $subsubcategory->name : '' }}
                                    @else {{ '' }}
                                @endif
                            </th>
                        </tr>
                        <tr>
                            <th>Company</th>
                            <th>:</th>
                            <th>
                                @if($product->company_id != null)
                                    @php
                                        $company = App\Model\Company::where('id',$product->company_id)->first();
                                    @endphp
                                    {{ $company? $company->company_name :'Personal' }}
                                @else {{ '' }}
                                @endif
                            </th>
                        </tr>
                    <tr>
                        <th>Units</th>
                        <th>:</th>
                        <th>
                            @php
                                $units = App\Model\ProductUnit::where('product_id',$product->id)
                                        ->get();
                            @endphp
                            @foreach($product->units as $unit)
                                {{ $unit->unit }} {{ ',' }}
                            @endforeach
                        </th>
                    </tr>
                    <tr>
                        <th>Unit Price</th>
                        <th>:</th>
                        <th>{{ $product->unit_price }}</th>
                    </tr>
                    <tr>
                        <th>Discount Price</th>
                        <th>:</th>
                        <th>{{ $product->discount_price }}</th>
                    </tr>
                    <tr>
                        <th>Unit Weight</th>
                        <th>:</th>
                        <th>{{ $product->unit_weight }}</th>
                    </tr>
                    <tr>
                        <th>Product Details</th>
                        <th>:</th>
                        <th>
                            {!! $product->product_details !!}
                        </th>
                    </tr>
                    <tr>
                        <th>Special Not</th>
                        <th>:</th>
                        <th>{{ $product->special_note }}</th>
                    </tr>

                    <tr>
                        <th>Gallery Images</th>
                        <th>:</th>
                        <th>
                            @php
                                $images = App\Model\ImageProduct::where('product_id',$product->id)->get();
                            @endphp
                            @foreach($images as $image)
                                <img src="{{ asset('images/product/'.$image->image) }}"
                                     class="img-responsive" alt="Image"
                                     style="height: 80px;width:80px;">
                            @endforeach
                        </th>
                    </tr>
                    <tr>
                        <th>Product Video</th>
                        <th>:</th>
                        <th>
                            @if($product->video != null)
                                <video width="320" height="240" controls>
                                    <source src="{{URL::asset("/videos/".$product->video)}}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            @endif
                        </th>
                    </tr>

                    <tr>
                        <th>Size</th>
                        <th>:</th>
                        <th>
                            @php
                                $sizes = App\Model\ProductSize::where('product_id',$product->id)
                                        ->get();
                            @endphp
                            @foreach($product->sizes as $size)
                                {{ $size->size }} {{ ',' }}
                                @endforeach
                        </th>
                    </tr>
                    <tr>
                        <th>Colors</th>
                        <th>:</th>
                        <th>
                            @php
                                $colors = App\Model\ColorProduct::where('product_id',$product->id)
                                        ->get();
                            @endphp
                            @foreach($product->colors as $color)
                                {{ $color->color }} {{ ',' }}
                            @endforeach
                        </th>
                    </tr>


                    </thead>

                </table>
            </div>
        </div>
    </div>
    @endsection

    @push('css')

        @endpush
