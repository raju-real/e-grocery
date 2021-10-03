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
            <input v-model="query" type="text" class="form-control input-lg" id="search" style="height: 45px;margin-top: 60px;border:1px solid green;border-radius: 10px;" placeholder="Search Product" >
        </div>

        <div id="searchResult" style="display: block;position: absolute;display: none;width : 100%">
            <ul class="dropdown-menu" style="display:block; position:relative;width : 95%">
                <li v-for="product in results">
                    <span id="slug" style="display: none;">@{{ product.slug }}</span>
                    <span v-if="product.duscount_price != null" id="price" style="display: none;">@{{ product.discount_price }}</span>
                    <span v-else id="price" style="display: none;">@{{ product.unit_price }}</span>
            {{-- <a href="{{ route('product_detail', '') }}/@{{ product.slug }}"> --}}
                    <a  type="button" @click="productDetails">
                      @{{ product.product_name }}
                    </a>
                </li>
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

{{--  <script type="text/javascript">
    var app = new Vue({
       el : '#searchProduct' ,
       props : ['results'],
       data(){
        return {
            query : '',
        }
       },
       watch:{
            query:function(newQ,old){
                if(!newQ.length){
                    $('#searchResult').hide();
                } else {
                    this.search();
                }
            }
        },
        methods : {
            search(){
                $('#searchResult').show();
                let query = this.query;
                let data = {
                    query : query
                };
                axios.post('/api/search_product',data).then(response=>{
                    this.results = response.data.products;
                }).catch(error=>{

                });
            },
            productDetails(){
                let slug = $('#slug').html();
                let price = $('#price').html();
                //let encPrice = CryptoJS.MD5(price);
                // let route = route('product_details',['slug'=> slug,'price'=>price]);
                let Createdroute = 'http://egrocery.com.bd/product_detail/' + slug;
                window.location = Createdroute;
                // pore add korsi
                this.query = ""
                $('#searchProduct').load(url + ' #searchProduct');
            }
        }
    });
</script>  --}}
