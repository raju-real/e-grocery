@extends('admin.layouts.app')
@section('title','Products')
@push('css')

@endpush

@section('page-title','Products Under '.$under->name )

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header"></div>
                    <div class="card-body">

                    </div>
                </div>
            </div>

        </div>
    </div><hr>

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="offer-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Discount Price</th>
                        <th class="text-center">View Product</th>
                    </tr>
                    </thead>
                    <tbody>

                    @foreach($products as $key=>$product)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">
                                {{ $product->product_name }}
                            </td>
                            <td class="text-center">
                                {{ $product->unit_price }}
                            </td>
                            <td class="text-center">
                                {{ $product->discount_price !=null ? $product->discount_price
                                : '0'}}
                            </td>
                            <td class="text-center">
                                <a href="{{ route('super.product.show',$product->id) }}" class="btn btn-primary" target="new">View Product</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Regular Price</th>
                        <th class="text-center">Discount Price</th>
                        <th class="text-center">View Product</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')

    {{-- Default JS Part --}}
    <script>
        $(document).ready(function() {
            var table = $('#offer-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>

@endpush
