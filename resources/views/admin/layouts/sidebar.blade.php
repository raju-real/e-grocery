 <aside class="app-sidebar">
      <div>
        <div style="margin-left: 15px;">
          <p style="color: white; font-size: 20px;">{{ Auth::check() ? Auth::user()->name : '' }}</p>
          </div>
      </div>
      {{-- Super Admin Panel Sidebar --}}

      @if(Request::is('super*') && Auth::user()->is_super == 1)
     <ul class="app-menu">
        <li>
            <a href="{{ route('super.dashboard') }}" class="app-menu__item active">
                <i class="app-menu__icon fa fa-dashboard"></i>
                <span class="app-menu__label">Dashboard</span>
            </a>
        </li>
         <li>
             <a href="{{ route('super.new_order') }}" class="app-menu__item active">
                 <i class="app-menu__icon fa fa-first-order"></i>
                 @php
                    $orders = DB::table('orders')->where('status',1)->get();
                 @endphp
                 <span class="app-menu__label">New Order ( {{ $orders->count() }} )
                 </span>
             </a>
         </li>

         <li class="treeview">
             <a class="app-menu__item" href="#" data-toggle="treeview">
                 <i class="app-menu__icon fa fa-tasks"></i>
                 <span class="app-menu__label">Order Management</span>
                 <i class="treeview-indicator fa fa-angle-right"></i>
             </a>
             <ul class="treeview-menu">
                 <li>
                     <a class="treeview-item" href="{{ route('super.pending_order') }}">
                         <i class="icon fa fa-circle-o"></i>
                         @php
                             $pendingOrders = DB::table('orders')->where('status',1)->get();
                         @endphp
                         Pending Order ({{ $pendingOrders->count() }})
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item"
                        href="{{ route('super.received_order') }}">
                         <i class="icon fa fa-circle-o"></i>
                         @php
                             $receiveOrders = DB::table('orders')->where('status',2)->get();
                         @endphp
                         Received Order ({{ $receiveOrders->count() }})
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item"
                        href="{{ route('super.processed_order') }}">
                         <i class="icon fa fa-circle-o"></i>
                         @php
                             $processOrders = DB::table('orders')->where('status',3)->get();
                         @endphp
                         Processing Order ({{ $processOrders->count() }})
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item"
                        href="{{ route('super.cancelled_order') }}">
                         <i class="icon fa fa-circle-o"></i>
                         @php
                             $cancelledOrders = DB::table('orders')->where('status',5)->get();
                         @endphp
                         Cancelled Order ({{ $cancelledOrders->count() }})
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item"
                        href="{{ route('super.delivered_order') }}">
                         <i class="icon fa fa-circle-o"></i>
                         @php
                             $deliveredOrders = DB::table('orders')->where('status',4)->get();
                         @endphp
                         Delivered Order ({{ $deliveredOrders->count() }})
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item" href="{{ route('super.order_search_page') }}">
                         <i class="icon fa fa-circle-o"></i>
                         Search A Order
                     </a>
                 </li>
             </ul>
         </li>


         <li class="treeview">
             <a class="app-menu__item" href="#" data-toggle="treeview">
                 <i class="app-menu__icon fa fa-product-hunt"></i>
                 <span class="app-menu__label">Inventory</span>
                 <i class="treeview-indicator fa fa-angle-right"></i>
             </a>
             <ul class="treeview-menu">
                 <li>
                     <a class="treeview-item" href="{{ route('super.inventory') }}">
                         <i class="icon fa fa-circle-o"></i>
                         Added Inventories
                     </a>
                 </li>

                 <li>
                     <a class="treeview-item" href="{{ route('super.inventory_create') }}">
                         <i class="icon fa fa-circle-o"></i>
                         Add Inventory
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item"
                        href="{{ route('super.buying_reports') }}">
                         <i class="icon fa fa-circle-o"></i>
                         Buying Reports
                     </a>
                 </li>
                 <li>
                     <a class="treeview-item"
                        href="{{ route('super.selling_reports') }}">
                         <i class="icon fa fa-circle-o"></i>
                         Selling Reports
                     </a>
                 </li>
             </ul>
         </li>
        <li class="treeview">
          <a class="app-menu__item" href="#" data-toggle="treeview">
            <i class="app-menu__icon fa fa-list"></i>
            <span class="app-menu__label">Product Attributes</span>
            <i class="treeview-indicator fa fa-angle-right"></i>
          </a>
          <ul class="treeview-menu">
            <li>
              <a class="treeview-item" href="{{ route('super.category.index') }}">
              <i class="icon fa fa-circle-o"></i>
                  Category
              </a>
            </li>
            <li><a class="treeview-item" href="{{ route('super.subcategory.index') }}"><i class="icon fa fa-circle-o"></i>Sub Category</a></li>
            <li><a class="treeview-item" href="{{ route('super.subsubcategory.index') }}"><i class="icon fa fa-circle-o"></i>Sub Sub Category</a></li>
            <li><a class="treeview-item" href="{{ route('super.attributes.index') }}"><i class="icon fa fa-circle-o"></i>Product Attributes</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a class="app-menu__item" href="#" data-toggle="treeview">
            <i class="app-menu__icon fa fa-product-hunt"></i>
            <span class="app-menu__label">Products</span>
            <i class="treeview-indicator fa fa-angle-right"></i>
          </a>
          <ul class="treeview-menu">
            <li>
              <a class="treeview-item" href="{{ route('super.product.create') }}">
              <i class="icon fa fa-circle-o"></i> 
                  Add New
              </a>
            </li>
            <li><a class="treeview-item" href="{{ route('super.product.index') }}"><i class="icon fa fa-circle-o"></i>All Product</a></li>
          </ul>
        </li>

         <li class="treeview">
             <a class="app-menu__item" href="#" data-toggle="treeview">
                 <i class="app-menu__icon fa fa-product-hunt"></i>
                 <span class="app-menu__label">Offer Management</span>
                 <i class="treeview-indicator fa fa-angle-right"></i>
             </a>
             <ul class="treeview-menu">
                 <li>
                     <a class="treeview-item" href="{{ route('super.today_offer.index') }}">
                         <i class="icon fa fa-circle-o"></i>
                         Today Offer
                     </a>
                 </li>
                 <li><a class="treeview-item" href="{{ route('super.weekly_offer.index') }}"><i class="icon fa fa-circle-o"></i>Weekly Offer</a></li>
             </ul>
         </li>

        <li>
            <a class="app-menu__item" href="{{ route('super.slider.index') }}">
                <i class="app-menu__icon fa fa-pie-chart"></i>
                <span class="app-menu__label">Slider Image</span>
            </a>
        </li>

         <li>
             <a class="app-menu__item" href="{{ route('super.bazar.index') }}">
                 <i class="app-menu__icon fa fa-pie-chart"></i>
                 <span class="app-menu__label">Bazar List</span>
             </a>
         </li>

         <li>
             <a class="app-menu__item" href="{{ route('super.popular.index') }}">
                 <i class="app-menu__icon fa fa-pie-chart"></i>
                 <span class="app-menu__label">Popular Item</span>
             </a>
         </li>

         <li>
             <a class="app-menu__item" href="{{ route('super.promotion.index') }}">
                 <i class="app-menu__icon fa fa-bullhorn"></i>
                 <span class="app-menu__label">Promotions</span>
             </a>
         </li>
          <li>
             <a class="app-menu__item" href="{{ route('super.coupon.index') }}">
                 <i class="app-menu__icon fa fa-gift"></i>
                 <span class="app-menu__label">Coupon Management</span>
             </a>
         </li>

         <li>
             <a class="app-menu__item active" href="#" style="background: #17a2b8;">
                 <span class="app-menu__label">Basic Info Part</span>
             </a>
         </li>

        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <i class="app-menu__icon fa fa-edit"></i>
                <span class="app-menu__label">Web Site Basic</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
          <ul class="treeview-menu">
            <li>
              <a class="treeview-item" href="{{ route('super.address') }}"  >
                <i class="icon fa fa-circle-o"></i> 
              Address
              </a>
            </li>
            <li>
                <a class="treeview-item" href="{{ route('super.company.index') }}">
                    <i class="icon fa fa-circle-o"></i>
                    Companies
                </a>
            </li>

          </ul>
        </li>
         @if(Auth::user()->is_super == 1)
         <li>
             <a class="app-menu__item" href="{{ route('super.admin.index') }}">
                 <i class="app-menu__icon fa fa-users"></i>
                 <span class="app-menu__label">
                     Our Admins
                 </span>
             </a>
         </li>
         <li>
             <a class="app-menu__item" href="{{ route('super.subscribers') }}">
                 <i class="app-menu__icon fa fa-users"></i>
                 <span class="app-menu__label">
                     Our Subscribers
                 </span>
             </a>
         </li>
         @endif
         <li>
             <a class="app-menu__item" href="{{ route('super.franchises') }}">
                 <i class="app-menu__icon fa fa-users"></i>
                 <span class="app-menu__label">
                     Our Franchises
                 </span>
             </a>
         </li>
         <li>
             <a class="app-menu__item" href="{{ route('super.user_message') }}">
                 <i class="app-menu__icon fa fa-envelope"></i>
                 @php
                 $messages = DB::table('messages')->where('status',0)->get();
                 @endphp
                 <span class="app-menu__label">
                     User Message
                     <span style="color: red;">
                         ({{ $messages->count() }})
                     </span>
                 </span>
             </a>
         </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">Tables</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="table-basic.html"><i class="icon fa fa-circle-o"></i> Basic Tables</a></li>
            <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i> Data Tables</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Pages</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="blank-page.html"><i class="icon fa fa-circle-o"></i> Blank Page</a></li>
            <li><a class="treeview-item" href="page-login.html"><i class="icon fa fa-circle-o"></i> Login Page</a></li>
            <li><a class="treeview-item" href="page-lockscreen.html"><i class="icon fa fa-circle-o"></i> Lockscreen Page</a></li>
            <li><a class="treeview-item" href="page-user.html"><i class="icon fa fa-circle-o"></i> User Page</a></li>
            <li><a class="treeview-item" href="page-invoice.html"><i class="icon fa fa-circle-o"></i> Invoice Page</a></li>
            <li><a class="treeview-item" href="page-calendar.html"><i class="icon fa fa-circle-o"></i> Calendar Page</a></li>
            <li><a class="treeview-item" href="page-mailbox.html"><i class="icon fa fa-circle-o"></i> Mailbox</a></li>
            <li><a class="treeview-item" href="page-error.html"><i class="icon fa fa-circle-o"></i> Error Page</a></li>
          </ul>
        </li>
      </ul>
      @endif

      {{-- User Admin Panel Sidebar --}}
     @if(Request::is('super*') && Auth::user()->is_super == 0)
         <ul class="app-menu">
             <li>
                 <a href="{{ route('super.dashboard') }}" class="app-menu__item active">
                     <i class="app-menu__icon fa fa-dashboard"></i>
                     <span class="app-menu__label">Dashboard</span>
                 </a>
             </li>
            @if(Auth::user()->order_management == 'yes')
             <li>
                 <a class="app-menu__item active" href="#" style="background: #17a2b8;">
                     <span class="app-menu__label">Order Part</span>
                 </a>
             </li>

             <li>
                 <a href="{{ route('super.new_order') }}" class="app-menu__item active">
                     <i class="app-menu__icon fa fa-first-order"></i>
                     @php
                         $orders = DB::table('orders')->where('status',1)->get();
                     @endphp
                     <span class="app-menu__label">New Order ( {{ $orders->count() }} )
                 </span>
                 </a>
             </li>

             <li class="treeview">
                 <a class="app-menu__item" href="#" data-toggle="treeview">
                     <i class="app-menu__icon fa fa-tasks"></i>
                     <span class="app-menu__label">Order Management</span>
                     <i class="treeview-indicator fa fa-angle-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li>
                         <a class="treeview-item" href="{{ route('super.pending_order') }}">
                             <i class="icon fa fa-circle-o"></i>
                             @php
                                 $pendingOrders = DB::table('orders')->where('status',1)->get();
                             @endphp
                             Pending Order ({{ $pendingOrders->count() }})
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item"
                            href="{{ route('super.received_order') }}">
                             <i class="icon fa fa-circle-o"></i>
                             @php
                                 $receiveOrders = DB::table('orders')->where('status',2)->get();
                             @endphp
                             Received Order ({{ $receiveOrders->count() }})
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item"
                            href="{{ route('super.processed_order') }}">
                             <i class="icon fa fa-circle-o"></i>
                             @php
                                 $processOrders = DB::table('orders')->where('status',3)->get();
                             @endphp
                             Processing Order ({{ $processOrders->count() }})
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item"
                            href="{{ route('super.cancelled_order') }}">
                             <i class="icon fa fa-circle-o"></i>
                             @php
                                 $cancelledOrders = DB::table('orders')->where('status',5)->get();
                             @endphp
                             Cancelled Order ({{ $cancelledOrders->count() }})
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item"
                            href="{{ route('super.delivered_order') }}">
                             <i class="icon fa fa-circle-o"></i>
                             @php
                                 $deliveredOrders = DB::table('orders')->where('status',4)->get();
                             @endphp
                             Delivered Order ({{ $deliveredOrders->count() }})
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item" href="{{ route('super.order_search_page') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Search A Order
                         </a>
                     </li>
                 </ul>
             </li>
             @endif

            @if(Auth::user()->inventory_management == 'yes')
             <li class="treeview">
                 <a class="app-menu__item" href="#" data-toggle="treeview">
                     <i class="app-menu__icon fa fa-product-hunt"></i>
                     <span class="app-menu__label">Inventory</span>
                     <i class="treeview-indicator fa fa-angle-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li>
                         <a class="treeview-item" href="{{ route('super.inventory') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Added Inventories
                         </a>
                     </li>

                     <li>
                         <a class="treeview-item" href="{{ route('super.inventory_create') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Add Inventory
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item"
                            href="{{ route('super.buying_reports') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Buying Reports
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item"
                            href="{{ route('super.selling_reports') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Selling Reports
                         </a>
                     </li>
                 </ul>
             </li>
             @endif
             @if(Auth::user()->product_management == 'yes')
             <li>
                 <a class="app-menu__item active" href="#" style="background: #17a2b8;">
                     <span class="app-menu__label">Product Part</span>
                 </a>
             </li>

             <li class="treeview">
                 <a class="app-menu__item" href="#" data-toggle="treeview">
                     <i class="app-menu__icon fa fa-list"></i>
                     <span class="app-menu__label">Product Category</span>
                     <i class="treeview-indicator fa fa-angle-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li>
                         <a class="treeview-item" href="{{ route('super.category.index') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Category
                         </a>
                         {{--<router-link to="/super/category" class="treeview-item">--}}
                         {{--<i class="icon fa fa-circle-o"></i>--}}
                         {{--Category--}}
                         {{--</router-link>--}}
                     </li>
                     <li><a class="treeview-item" href="{{ route('super.subcategory.index') }}"><i class="icon fa fa-circle-o"></i>Sub Category</a></li>
                     <li><a class="treeview-item" href="{{ route('super.subsubcategory.index') }}"><i class="icon fa fa-circle-o"></i>Sub Sub Category</a></li>
                     <li><a class="treeview-item" href="{{ route('super.attributes.index') }}"><i class="icon fa fa-circle-o"></i>Product Attributes</a></li>
                 </ul>
             </li>

             <li class="treeview">
                 <a class="app-menu__item" href="#" data-toggle="treeview">
                     <i class="app-menu__icon fa fa-product-hunt"></i>
                     <span class="app-menu__label">Our Products</span>
                     <i class="treeview-indicator fa fa-angle-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li>
                         <a class="treeview-item" href="{{ route('super.product.create') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Add New
                         </a>
                     </li>
                     <li><a class="treeview-item" href="{{ route('super.product.index') }}"><i class="icon fa fa-circle-o"></i>All Product</a></li>
                 </ul>
             </li>
             @endif
             @if(Auth::user()->offer_management == 'yes')
             <li class="treeview">
                 <a class="app-menu__item" href="#" data-toggle="treeview">
                     <i class="app-menu__icon fa fa-product-hunt"></i>
                     <span class="app-menu__label">Offer Management</span>
                     <i class="treeview-indicator fa fa-angle-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li>
                         <a class="treeview-item" href="{{ route('super.today_offer.index') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Today Offer
                         </a>
                     </li>
                     <li><a class="treeview-item" href="{{ route('super.weekly_offer.index') }}"><i class="icon fa fa-circle-o"></i>Weekly Offer</a></li>
                 </ul>
             </li>

             <li>
                 <a class="app-menu__item" href="{{ route('super.slider.index') }}">
                     <i class="app-menu__icon fa fa-pie-chart"></i>
                     <span class="app-menu__label">Slider Image</span>
                 </a>
             </li>
                 <li>
                     <a class="app-menu__item" href="{{ route('super.promotion.index') }}">
                         <i class="app-menu__icon fa fa-bullhorn"></i>
                         <span class="app-menu__label">Promotions</span>
                     </a>
                 </li>
             @endif
             @if(Auth::user()->bazarlist_management == 'yes')
             <li>
                 <a class="app-menu__item" href="{{ route('super.bazar.index') }}">
                     <i class="app-menu__icon fa fa-pie-chart"></i>
                     <span class="app-menu__label">Bazar List</span>
                 </a>
             </li>
             @endif

             <li>
                 <a class="app-menu__item" href="{{ route('super.popular.index') }}">
                     <i class="app-menu__icon fa fa-pie-chart"></i>
                     <span class="app-menu__label">Popular Item</span>
                 </a>
             </li>

             @if(Auth::user()->coupon_management == 'yes')
             <li>
                 <a class="app-menu__item" href="{{ route('super.coupon.index') }}">
                     <i class="app-menu__icon fa fa-gift"></i>
                     <span class="app-menu__label">Coupon Management</span>
                 </a>
             </li>
             @endif
             <li>
                 <a class="app-menu__item active" href="#" style="background: #17a2b8;">
                     <span class="app-menu__label">Basic Info Part</span>
                 </a>
             </li>

             <li class="treeview">
                 <a class="app-menu__item" href="#" data-toggle="treeview">
                     <i class="app-menu__icon fa fa-edit"></i>
                     <span class="app-menu__label">Web Site Basic</span>
                     <i class="treeview-indicator fa fa-angle-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li>
                         <a class="treeview-item" href="{{ route('super.address') }}"  >
                             <i class="icon fa fa-circle-o"></i>
                             Address
                         </a>
                     </li>
                     <li>
                         <a class="treeview-item" href="{{ route('super.company.index') }}">
                             <i class="icon fa fa-circle-o"></i>
                             Companies
                         </a>
                     </li>

                 </ul>
             </li>
             @if(Auth::user()->is_super == 1)
                 <li>
                     <a class="app-menu__item" href="{{ route('super.admin.index') }}">
                         <i class="app-menu__icon fa fa-users"></i>
                         <span class="app-menu__label">
                     Our Admins
                 </span>
                     </a>
                 </li>
             @endif

             <li>
                 <a class="app-menu__item" href="{{ route('super.user_message') }}">
                     <i class="app-menu__icon fa fa-envelope"></i>
                     @php
                         $messages = DB::table('messages')->where('status',0)->get();
                     @endphp
                     <span class="app-menu__label">
                     User Message
                     <span style="color: red;">
                         ({{ $messages->count() }})
                     </span>
                 </span>
                 </a>
             </li>
             <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">Tables</span><i class="treeview-indicator fa fa-angle-right"></i></a>
                 <ul class="treeview-menu">
                     <li><a class="treeview-item" href="table-basic.html"><i class="icon fa fa-circle-o"></i> Basic Tables</a></li>
                     <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i> Data Tables</a></li>
                 </ul>
             </li>
             <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Pages</span><i class="treeview-indicator fa fa-angle-right"></i></a>
                 <ul class="treeview-menu">
                     <li><a class="treeview-item" href="blank-page.html"><i class="icon fa fa-circle-o"></i> Blank Page</a></li>
                     <li><a class="treeview-item" href="page-login.html"><i class="icon fa fa-circle-o"></i> Login Page</a></li>
                     <li><a class="treeview-item" href="page-lockscreen.html"><i class="icon fa fa-circle-o"></i> Lockscreen Page</a></li>
                     <li><a class="treeview-item" href="page-user.html"><i class="icon fa fa-circle-o"></i> User Page</a></li>
                     <li><a class="treeview-item" href="page-invoice.html"><i class="icon fa fa-circle-o"></i> Invoice Page</a></li>
                     <li><a class="treeview-item" href="page-calendar.html"><i class="icon fa fa-circle-o"></i> Calendar Page</a></li>
                     <li><a class="treeview-item" href="page-mailbox.html"><i class="icon fa fa-circle-o"></i> Mailbox</a></li>
                     <li><a class="treeview-item" href="page-error.html"><i class="icon fa fa-circle-o"></i> Error Page</a></li>
                 </ul>
             </li>
         </ul>
     @endif


    </aside>