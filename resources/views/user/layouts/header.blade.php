<div class="row" id="searchProduct">
    <div class="col-md-3">
        <div class="header_logo">
            <a href="{{ route('home') }}">
                <img src="{{ asset('assets/user/logo/02.jpg') }}"
                     alt="E-Grocery" style="height: 120px;width: 200px;">
            </a>
        </div>
    </div>

    <div class="col-md-6">
        {{--Ajax Live Search--}}
        <div class="form-group" >
            <input type="text" class="form-control input-lg" id="product_name" style="height: 45px;margin-top: 60px;border:1px solid green;border-radius: 10px;" placeholder="Search Product" 
                autocomplete="off"
                onkeyup="searchProduct()">
        </div>

        <div id="searchResult" style="display: block;position: absolute;display: none;width : 100%">
            <ul class="dropdown-menu" style="display:block; position:relative;width : 95%">
                <li class="autocomplete-item"></li>
            </ul>
        </div>
        {{--{{ csrf_field() }}--}}
    </div>

    <div class="col-md-3" style="margin-top: 60px;">
        <a href="{{ route('user.dashboard') }}">My Account</a>
        <a href="{{ route('favorite_list') }}">
            <img src="{{ asset('assets/images/heart.png') }}"
                     alt="" style="height: 37px;width: 34px;margin-left: 20px;">
        </a>
          <span id="countCart">
            @if(Auth::check())
                @php
                    $carts = DB::table('favorites')
                    ->where('user_id',Auth::user()->id)->get();
                @endphp
                <span class="badge" style="vertical-align: top;">
                    {{ $carts->count() }}
                </span>
                @endif
            </span>
        <a href="{{ route('shopping_cart') }}">
            <img src="{{ asset('assets/images/supermarket.png') }}"
         alt="" style="height: 37px;width: 34px;margin-left: 20px;">
        </a>

         <span id="countCart">
             @php
                 $session_id = session()->get('session_id');
             $carts = DB::table('carts')
                    ->where('session_id',$session_id)->get();
             @endphp
             <span class="badge" style="vertical-align: top;">
                {{ $carts->count() }}
            </span>
        </span>
    </div>

</div>

<script type="text/javascript">
    function searchProduct() {
            let product_name = $('#product_name').val();
            let data = {
                product_name : product_name
            };
            // && (product_name.length) >= 2
            if((product_name.trim() != "")) {
                $.ajax({
                    method : 'GET',
                    url: "{{ route('search-product') }}",
                    data: data,
                    dataType: 'JSON',
                    success: function(response){
                        //console.log(response.data);
                        let products = response.data;
                        if(products.length){
                            $('#searchResult').show();
                            $('.autocomplete-item').html(products);
                        } else {
                            $('#searchResult').hide();
                        }
                    }
                });
            } else{
                $('#searchResult').hide();
            }

        }
</script>
