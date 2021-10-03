@extends('user.layouts.app')
@section('title','Bazar List')
@push('css')
    {{-- expr --}}
@endpush

@section('category_menu')
    @include('user.layouts.hidden_category_menu')
@endsection

@section('content')

    <!--Cart Main Area Start-->
    <div class="cart-main-area area-padding">
        <div class="container">
             <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumb" style="font-weight: bold;font-size: 18px;">
                        <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
                        <span class="navigation-pipe"><i class="fa fa-angle-right"></i></span>
                        <span class="navigation_page">Bazar List</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title">
                        <h1>Your Bazar List</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">

                    <form action="#">
                        <div class="cart-table table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th class="p-image">Product Image</th>
                                    <th class="p-name">Product Name</th>
                                    <th class="p-amount">Unit Price</th>
                                    <th class="p-quantity">Qty</th>
                                    <th class="p-total">SubTotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($lists as $list)
                                    @php
                                        $products = App\Model\Product::where('id',
                                        $list->product_id)->get();
                                    @endphp
                                    @foreach($products as $product)
                                        <tr>
                                            <td class="p-image">
                                                @php
                                                    if($product->discount_price != null){
                                                        $price =  $product->discount_price; }
                                                    else{
                                                         $price = $product->unit_price ;
                                                    }
                                                $is_read = true;
                                                @endphp
                                                
                                                <a>
                                                    <img alt="" src="{{ asset('images/product/'
                                         .$product->image) }}" class="floatleft"
                                                         style="height: 70px;width: 95px;">
                                                </a>
                                            </td>
                                            <td class="p-name">
                                                {{ $product->product_name }}
                                            </td>

                                            <td class="p-amount">
                                                <i class="fb-taka"></i>
                                                @if($product->discount_price != null)
                                                    {{ $product->discount_price }}
                                                @else
                                                    {{ $product->unit_price }}
                                                @endif
                                            </td>
                                            <td class="p-quantity">
                                                {{ $list->quantity }}
                                            </td>
                                            <td class="p-total">
                                                {{ $list->total_price }}
                                            </td>

                                        </tr>
                                    @endforeach
                                @endforeach
                                </tbody>
                            </table>
                            <div class="all-cart-buttons">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4">

                            </div>
                            <div class="col-md-4">
                                <div class="amount-totals">
                                    <p class="total">
                                        Subtotal
                                        @php
                                            $totalPrice = 0;
                                            foreach($lists as $list){
                                                $totalPrice += $list->total_price;
                                            }
                                        @endphp
                                        <span>
                                            <i class="fb-taka"></i>
                                         {{ $totalPrice }}
                                     </span>
                                    </p>
                                    <p class="total">
                                        Shipping Fee <span>
                                            <i class="fb-taka"></i>
                                            45
                                        </span>
                                    </p>
                                    <p class="total">
                                        Total
                                        <span>
                                            <i class="fb-taka"></i>
                                         {{ $totalPrice + 45}}
                                     </span>
                                    </p>

                                    <a href="{{ route('modify_bazar_list') }}"
                                       class="btn btn-info btn-lg"
                                    style="float: right;">
                                        Modify List
                                    </a>
                                    {{--<a href="" class="btn btn-success btn-lg"--}}
                                       {{--style="float: right;">--}}
                                        {{--Place Order--}}
                                    {{--</a>--}}
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--End of Cart Main Area-->
@endsection

@push('js')
    <script type="text/javascript">
        $('#productSelect').select2();
    </script>
@endpush