<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@yield('title','')</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon"
              href="{{ asset('assets/user/logo/04.png') }}">
        <!-- Place favicon.ico in the root directory -->

		<!-- font css -->
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

        <!-- all css here -->
        <!-- Master CSS -->
        <link rel="stylesheet" href="{{ asset('assets/user/master.css') }}">
        <!-- modernizr css -->
        <script src="{{ asset('assets/user/js/vendor/modernizr-2.8.3.min.js') }}"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/topuhit/Font-Bangla@1.0.3/1.0.0/font-bangla.css">

        {{--  Toaster  --}}
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

        {{--<link href=" {{ asset('css/app.css') }}" rel="stylesheet">--}}
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script></head>

        <style>
            .blink {
                animation: blinker 1s linear infinite;
            }

            @keyframes blinker {
                40% {
                    opacity: 0.1;
                }
            }
        </style>


        @stack('css')
    </head>
    <body>
      <div id="fb-root"></div>
      {{--  Messenger On Website  --}}
      <script>
        window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v9.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    </script>

    {{--  Change style.css to remove #scrollUp  top hover icon   --}}

      <div class="fb-customerchat"
        attribution=setup_tool
        page_id="101922125105879">
      </div>
      {{--  Facebook Page Display  --}}
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v7.0&appId=673442553169531&autoLogAppEvents=1" nonce="OVHNRjja"></script>
    <div id="app">
        <!-- header start -->
        <header class="header_area">
            {{-- <div style="text-align:center;padding:1em 0;"> <h3><a style="text-decoration:none;" href="https://www.zeitverschiebung.net/en/timezone/asia--dhaka"><span style="color:gray;">Current local time in</span><br />Asia/Dhaka</a></h3> <iframe src="https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=en&size=medium&timezone=Asia%2FDhaka" width="100%" height="115" frameborder="0" seamless></iframe>
            </div> --}}
            <div class="header_middle_area" style="background: #eee0;color: #0E7346;">
                <div class="container">
                    @include('user.layouts.header')
                </div>
            </div>
            <div class="mainmenu_area" style="background: #eee0;color: #0E7346;">
                <div class="container">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="category_menu hidden-xs">
                                <div class="category_title show-submenu" style="background: #f5f5f5;">
                                    <h3 style="color:#3c763d;">Category</h3>
                                </div>

                                @yield('category_menu')

                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-sm-9 hidden-xs">
                            <div class="mainmenu">
                                <nav>
                                    <ul >
                                        <li>
                                            <a href="{{ route('home') }}"
                                               style="color: #3c763d;">Home
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{{ route('bazarlist') }}"
                                               style="color: #3c763d;">
                                                Bazar List
                                            </a>
                                        </li>
                                        {{--<li>--}}
                                            {{--<a href="{{ route('about-us') }}"--}}
                                               {{--style="color: #3c763d;">About Us</a>--}}
                                        {{--</li>--}}
                                        <li>
                                            <a href="{{ route('contact-us') }}"
                                               style="color: #3c763d;">Contact Us</a>
                                        </li>
                                        <li>
                                            <a class="blink" href="{{ route('campaigns') }}"
                                               style="color: #3c763d;">Campaign</a>
                                        </li>
                                        @guest
                                        <li>
                                            <a href="{{ route('login') }}"
                                               style="color: #3c763d;">Login</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user-register') }}"
                                               style="color: #3c763d;">Register</a>
                                        </li>
                                        @else
                                        <li>
                                            <a  href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                     document.getElementById('logout-form')
                                                     .submit();" style="color: #3c763d;">
                                                Logout
                                            </a>

                                        </li>
                                        <form id="logout-form" action="{{ route('logout') }}"
                                          method="POST" style="display: none;">
                                                @csrf
                                            </form>
                                        @endguest
                                                <li>
                                                    <a href="{{ route('franchises') }}"
                                                       style="color: #3c763d;">Franchises</a>
                                                </li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- MainMenu Area end -->
            <!-- Mobile Menu Area start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="mobile-menu">
        <nav id="dropdown">
            @php
                $categories = DB::table('categories')
                ->latest()->get();
            @endphp
            <ul>
                <li>
                    <a href="{{ route('campaigns') }}">
                        <i style="float: left;width: 20%;">
                            <img src="{{ asset('images/category/campaign.png') }}" class="img-responsive" alt="Image">
                        </i>
                        Campaign
                    </a>
                </li>
                @foreach($categories as $category)
                <li>
                    <a href="{{ route('category',$category->slug) }}">
                        <i style="float: left;width: 20%;">
                            <img src="{{ asset('images/category/'.$category->icon) }}" class="img-responsive" alt="Image" style="height: 25px;">
                        </i>&nbsp;
                        {{ $category->name }}
                    </a>
                    <ul>
                @php
                    $subcategories = DB::table('subcategories')
                    ->where('category_id',$category->id)->get();
                @endphp
                @if(sizeof($subcategories) > 0)
                @foreach($subcategories as $subcategory)
                <li>
                    <a href="{{ route('subcategory',$subcategory->slug) }}">
                        {{ $subcategory->name }}
                    </a>
                    @php
                        $subSubCategories = DB::table('subsubcategories')
                        ->where('subcategory_id',$subcategory->id)->get();
                    @endphp
                    @if(sizeof($subSubCategories) > 0)
                    <ul>
                        @foreach($subSubCategories as $subSubCategory)
                        <li>
                            <a href="{{ route('subsubcategory',$subSubCategory->slug) }}">
                                {{ $subSubCategory->name }}
                            </a>
                        </li>
                        @endforeach
                    </ul>
                    @endif
                </li>
                @endforeach
                @endif
                    </ul>
                </li>
                @endforeach
            </ul>
        </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Area end -->
        </header>
        <!-- header end -->
        <!-- slider start -->
            @yield('slider')
        <!-- slider end -->
        <!-- banner start -->

        <!-- banner end -->
        <!-- featured start -->
            <br>
            @yield('content')
        <!-- featured end -->

        <!-- footer start -->
        <footer class="footer_area">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3">
                        <div class="footer_widget">
                            <a class="footer_logo" href="{{ route('home') }}">\
                                <img src="{{ asset('assets/user/logo/05.png') }}"
                                     alt="E-Grocery" style="height: 70px;width: 197px;">
                            </a>

                        </div>
                        <div class="contact_info_footer">
                            <ul>
                                <li>
                                    <span class="lbl">Company</span>
                                    <p><b>E-Grocery</b></p>
                                </li>
                                <li>
                                    <span class="lbl">Address</span>
                                    <p>
                                        <b>
                                            83,  Middle Basabo, Shobujbag,Dhaka-124,Dhaka,
                                            Bangladesh
                                        </b>
                                    </p>
                                </li>
                                <li>
                                    <span class="lbl">Phone</span>
                                    <p><b>01851939913</b></p>
                                </li>
                                <li>
                                    <span class="lbl">Email</span>
                                    <p><b>info@egrocery.com.bd</b></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-6">
                        {{--<img src="{{ asset('assets/images/supermarket.jpg') }}" class="img-responsive" alt="Image" style="width: 100%;height250px;margin-top: 40px;">--}}
                        <div class="fb-page"
                             data-href="https://web.facebook.com/egrocery.com.bd"
                             data-width="500"
                             data-height="500"
                             data-hide-cover="false"
                             data-small-header="false"
                             data-show-facepile="true"
                             style="margin-top: 50px;" ></div>
                    </div>
                    {{--<div class="col-xs-12 hidden-sm hidden-md col-lg-2">--}}
                        {{--<div class="footer_widget">--}}
                            {{--<h4>Our Store</h4>--}}
                            {{--<ul class="toggle-footer" style="">--}}
							    {{--<li class="item"><a href="#">Specials</a></li>--}}
							    {{--<li class="item"><a href="#">New products</a></li>--}}
							    {{--<li class="item"><a href="#">Best sellers</a></li>--}}
							    {{--<li class="item"><a href="#">Our stores</a></li>--}}
							    {{--<li class="item"><a href="#">Contact us</a></li>--}}
                            {{--</ul>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                    {{--<div class="col-xs-12 hidden-sm hidden-md col-lg-2">--}}
                        {{--<div class="footer_widget">--}}
                            {{--<h4>Information</h4>--}}
                            {{--<ul class="toggle-footer" style="">--}}
							    {{--<li class="item"><a href="#">Delivery</a></li>--}}
							    {{--<li class="item"><a href="#">Legal Notice</a></li>--}}
							    {{--<li class="item"><a href="#">Terms and conditions</a></li>--}}
							    {{--<li class="item"><a href="#">About us</a></li>--}}
							    {{--<li class="item"><a href="#">Secure payment</a></li>--}}
							    {{--<li class="item"><a href="#">Sitemap</a></li>--}}
                            {{--</ul>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                    {{--<div class="col-xs-12 col-sm-3 col-md-3 col-lg-2">--}}
                        {{--<div class="footer_widget">--}}
                            {{--<h4>My Account</h4>--}}
                            {{--<ul class="toggle-footer" style="">--}}
							    {{--<li class="item"><a href="#">Delivery</a></li>--}}
							    {{--<li class="item"><a href="#">Legal Notice</a></li>--}}
							    {{--<li class="item"><a href="#">Terms and conditions</a></li>--}}
							    {{--<li class="item"><a href="#">About us</a></li>--}}
							    {{--<li class="item"><a href="#">Secure payment</a></li>--}}
							    {{--<li class="item"><a href="#">Sitemap</a></li>--}}
                            {{--</ul>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="footer_widget">
                            <h4>Newsletter</h4>
                            <p>Subscribe to our mailing list to receive updates on new arrivals, special offers and other discount information.</p>
                            <form method="post" action="{{ route('subscribe') }}">
                                @csrf
                                <div class="form-group">
                                    <input name="email" type="text" placeholder="Enter your e-mail" id="newsletter-input">
                                    <button class="button-small" type="submit">
                                        <span>Ok</span>
                                    </button>
                                </div>
                            </form>
                            {{--  <div id="social_block">
                                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="rss"><i class="fa fa-rss"></i></a>
                                <a href="#" class="youtube"><i class="fa fa-youtube"></i></a>
                                <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
                            </div>  --}}
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer end -->
            <!-- footer bottom start-->
            <div class="footer_bottom" style="background: #3b8a5e;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="copyright" class="text-center">
                                <p class="text-center">COPYRIGHT &copy; 2020
                                    <a href="{{ route('home') }}">E-Grocery</a>
                                    ALL RIGHTS RESERVED</p>
                            </div>
                        </div>
                        {{--  <div class="col-sm-6">
                            <div class="payment_img">
                                <img alt="" src="{{ asset('assets/user/img/payment/payment.png') }}" class="img-responsive">
                            </div>
                        </div>  --}}
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer bottom end -->

        <!-- QUICKVIEW PRODUCT -->
        <div id="quickview-wrapper">
            <!-- Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-product">
                                <div class="product-images">
                                    <div class="main-image images">
                                        <img alt="" src="img/product/5.jpg">
                                    </div>
                                </div><!-- .product-images -->

                                <div class="product-info">
                                    <h1>Diam quis cursus</h1>
                                    <div class="price-box">
                                        <p class="price"><span class="special-price"><span class="amount">$132.00</span></span></p>
                                    </div>
                                    <a href="shop.html" class="see-all">See all features</a>
                                    <div class="quick-add-to-cart">
                                        <form method="post" class="cart">
                                            <div class="numbers-row">
                                                <input type="number" id="french-hens" value="3">
                                            </div>
                                            <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="quick-desc">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.
                                    </div>
                                    <div class="social-sharing">
                                        <div class="widget widget_socialsharing_widget">
                                            <h3 class="widget-title-modal">Share this product</h3>
                                            <ul class="social-icons">
                                                <li><a target="_blank" title="Facebook" href="#" class="facebook social-icon"><i class="fa fa-facebook"></i></a></li>
                                                <li><a target="_blank" title="Twitter" href="#" class="twitter social-icon"><i class="fa fa-twitter"></i></a></li>
                                                <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a target="_blank" title="Google +" href="#" class="gplus social-icon"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a target="_blank" title="LinkedIn" href="#" class="linkedin social-icon"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- .product-info -->
                            </div><!-- .modal-product -->
                        </div><!-- .modal-body -->
                    </div><!-- .modal-content -->
                </div><!-- .modal-dialog -->
            </div>
            <!-- END Modal -->
        </div>
        <!-- END QUICKVIEW PRODUCT -->

    </div>





        {{--Common--}}
        {{--<script src="{{ asset('js/app.js') }}"></script>--}}
        {{-- Axios --}}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>

		<!-- all js here -->
		<!-- jquery latest version -->
        <script src="{{ asset('assets/user/js/vendor/jquery-1.12.4.min.js') }}"></script>
		<!-- bootstrap js -->
        <script src="{{ asset('assets/user/js/bootstrap.min.js') }}"></script>
		<!-- meanmenu js -->
        <script src="{{ asset('assets/user/js/jquery.meanmenu.js') }}"></script>
		<!-- countdown js -->
        <script src="{{ asset('assets/user/js/jquery.countdown.min.js') }}"></script>
        <!-- Nevo Slider js -->
        <script  src="{{ asset('assets/user/js/jquery.nivo.slider.pack.js') }}"></script>
		<!-- owl.carousel js -->
        <script src="{{ asset('assets/user/js/owl.carousel.min.js') }}"></script>
		<!-- jquery-ui js -->
        <script src="{{ asset('assets/user/js/jquery-ui.min.js') }}"></script>
		<!-- plugins js -->
        <script src="{{ asset('assets/user/js/plugins.js') }}"></script>
        <!-- Elevatezoom JS -->
        <script src="{{ asset('assets/user/js/jquery.elevateZoom-3.0.8.min.js') }}"></script>
		<!-- wow js -->
    <script type="text/javascript" src="{{ asset('assets/admin/js/plugins/select2.min.js') }}"></script>
        <script src="{{ asset('assets/user/js/wow.min.js') }}"></script>
		<!-- main js -->
        <script src="{{ asset('assets/user/js/main.js') }}"></script>
        {{-- sweet alert --}}
        <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
        {{--  Toaster  --}}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <script type="text/javascript">
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
                let Createdroute = 'http://e-grocery.test/product_detail/' + slug;
                window.location.href = Createdroute;
                // pore add korsi
                this.query = ""
                $('#searchProduct').load(url + ' #searchProduct');
            }
        }
    });
</script>

    {{-- <script>
        $(document).ready(function(){

            $('#search').keyup(function(){
                var query = $(this).val();
                if(query != '')
                {
                    var _token = $('input[name="_token"]').val();
                    $.ajax({
                        url:"{{ route('search') }}",
                        method:"POST",
                        data:{query:query, _token:_token},
                        success:function(data){
                            $('#searchResult').fadeIn();
                            $('#searchResult').html(data);
                        }
                    });
                }
            });

            $(document).on('click', 'li', function(){
                $('#search').val($(this).text());
                $('#searchResult').fadeOut();
            });

        });
    </script> --}}

        {!! Toastr::message() !!}
        <script>
            @if($errors->any())
            @foreach($errors->all() as $error)
            toastr.error('{{ $error }}','Error',{
                closeButton:true,
                progressBar:true,
            });
            @endforeach
            @endif
        </script>

        @stack('js')
    </body>
</html>


