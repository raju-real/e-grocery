<div class="col-md-6 col-lg-3">
    <div class="widget-small info coloured-icon">
        <i class="icon fa fa-first-order fa-3x"></i>
        <div class="info">
            <h4>
                <a href="{{ route('super.new_order') }}">New Order</a>
            </h4>
            @php
                $orders = App\Model\Order::where('status',1)->get();
            @endphp
            <p><b>{{ $orders->count() }}</b></p>
        </div>
    </div>
</div>

<div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Users</h4>
              @php
                $users = DB::table('users')->get();
              @endphp
              <p><b>{{ $users->count() }}</b></p>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
            <div class="info">
              <h4>Message</h4>
              @php
                $messages = DB::table('messages')->where('status',0)->get();
              @endphp
              <p><b>{{ $messages->count() }}</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>Products</h4>
              @php
                $products = DB::table('products')->get();
              @endphp
              <p><b>{{ $products->count() }}</b></p>
            </div>
          </div>
        </div>