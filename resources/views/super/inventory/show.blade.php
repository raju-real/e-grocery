@extends('admin.layouts.app')
@section('title','Details About'.' '.$inventory->product->product_name)
@push('css')

@endpush

@section('content')
    <div class="col-md-12">
        <div class="tile">
            <h3 class="tile-title">Inventory Product Details
                <span style="float: right">
                    <a href="{{ route('super.inventory') }}"
                       class="btn btn-danger">
                    Back
                </a>
                <a href="{{ route('super.inventory_edit',$inventory->id) }}"
                   class="btn btn-info">
                    <i class="fa fa-edit"></i>
                    Edit Inventory
                </a>
                </span>
            </h3>
            <hr>
            <div class="table-responsive">
                <table class="table" style="border: none;" border="0">
                    <tbody>
                    <tr>
                        <td style="font-weight: bold;border: none;">Added Date</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_name" style="font-weight: bold;border: none;">
                            {{ $inventory->create_date }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Added By</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_name" style="font-weight: bold;border: none;">
                            {{ $inventory->admin->name }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Product Name</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_name" style="font-weight: bold;border: none;">
                            {{ $inventory->product->product_name }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Product From</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_name" style="font-weight: bold;border: none;">
                            {{ $inventory->product->company->company_name }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Product Quantity</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_quantity" style="font-weight: bold;border: none;">
                            {{ $inventory->quantity }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Buying Price</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_buying_price" style="font-weight: bold;border: none;">
                            {{ $inventory->buying_price }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Unit Price</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_buying_unit_price" style="font-weight: bold;border: none;">
                            {{ $inventory->buying_unit_price }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Selling Unit Price</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_selling_unit_price" style="font-weight: bold;border: none;">
                            {{ $inventory->selling_unit_price }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Total Selling  Price</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_selling_price" style="font-weight: bold;border: none;">
                            @php
                                $totalSellingPrice = $inventory->quantity * $inventory->selling_unit_price;
                            @endphp
                            {{ $totalSellingPrice }}
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;border: none;">Probably Profit</td>
                        <td style="font-weight: bold;border: none;">:</td>
                        <td id="product_probably_profit" style="font-weight: bold;border: none;">
                            @php
                                $totalSellingPrice = $inventory->quantity * $inventory->selling_unit_price;
                                $profit = $totalSellingPrice - $inventory->buying_price;
                            @endphp
                            {{ $profit }}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('css')

@endpush