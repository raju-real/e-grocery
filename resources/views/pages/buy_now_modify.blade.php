@extends('user.layouts.app')
@section('title','Modify Product')
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
                <div class="col-md-12">
                    <div class="page-title">
                        <h1>Modify Your Product
                        </h1>
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
                                    <th class="p-times"></th>
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
                                                    $image = DB::table('image_products')
                                                    ->where('product_id',$product->id)->first();
                                                @endphp
                                                <a>
                                                    <img alt="" src="{{ asset('images/product/'
                                         .$image->image) }}" class="floatleft"
                                                         style="height: 70px;width: 95px;">
                                                </a>
                                            </td>
                                            <td class="p-name">
                                                <a >
                                                    {{ $product->product_name }}
                                                </a>
                                            </td>

                                            <td class="p-amount">
                                                {{--<i class="fb-taka"></i>--}}
                                                {{ $list->unit_price }} BDT
                                            </td>
                                            <td>
                                                {{--<input maxlength="12" type="text"--}}
                                                       {{--value="{{ $list->quantity }}"--}}
                                                       {{--name="quantity">--}}
                                        @if($product->category_id == 9)
                                            <p class="btn btn-warning">
                                                {{ $list->quantity }}
                                            </p>
                                        @else
                                            <a href="{{ route('decrement_buynow_quantity') }}"
                                               class="btn btn-danger">
                                                -
                                            </a>
                                            <p class="btn btn-warning">
                                                {{ $list->quantity }}
                                            </p>
                                        <a href="{{ route('increment_buynow_quantity') }}"
                                           class="btn btn-danger">
                                            +
                                        </a>
                                         @endif
                                            </td>
                                            <td class="p-total">
                                                {{ $list->total_price }} BDT
                                            </td>
                                            <td class="p-action">
                                        <a href="{{ route('delete_buynow_item') }}">
                                            <i class="fa fa-times"></i>
                                        </a>
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

                                    <button class="button" type="button">
                                        <span><a href="{{ route('checkout',3) }}"
                                                 style="color: white;">
                                             Procced to checkout
                                         </a></span>
                                    </button>
                                    <div class="clearfix"></div>
                                    <p class="floatright">Checkout with multiples address</p>
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