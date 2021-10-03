@extends('admin.layouts.app')
@section('title','Make Weekly Offer')
@push('css')

@endpush

@section('page-title','Make Weekly Offer')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
<div class="col-md-8">
	<div class="tile">
	<div class="tile-body">
         @if(Session::has('message'))
              <p class="alert alert-danger">
                  {{ Session::get('message') }}
              </p>
          @endif
		<form action="{{ route('super.weekly_offer.store') }}" method="POST">
            @csrf
            <div class="form-group">
                <label>Take Product</label><br>
                <select name="product_id" class="form-control" id="productSelect" style="width: 100%;">
                    <optgroup>
                        <option value="">Select Product</option>
                        @foreach($products as $product)
                            <option value="{{ $product->id }}">
                                {{ $product->product_name }} {{ " ---- Current Price: " }} {{ $product->unit_price }}
                            </option>
                        @endforeach
                    </optgroup>
                </select>
            </div>

            <div class="form-group">
                <label for="demoDate">Start Date</label>
                <input autocomplete="off" id="datetimepicker" type="text" name="start_date" class="form-control">
            </div>

            <div class="form-group">
                <label for="demoDate">End Date</label>
                <input autocomplete="off" id="datetimepicker1" type="text" name="end_date" class="form-control">
            </div>

            <div class="form-group">
                <label for="">Price</label>
                <input name="offer_price" type="text" class="form-control" id="store_name" placeholder="offer Price">
            </div>

            <div class="form-group">
                <label for="">Status</label>
                <select name="status" id="" class="form-control">
                    <option value="1">Active</option>
                    <option value="2">In Active</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Add Product</button>
            <a href="{{ route('super.weekly_offer.index') }}" class="btn btn-danger">Back</a>
        </form>
	</div>
</div>
</div>
@endsection

@push('js')

{{-- Date Picker --}}
    <script src="{{ asset('assets/admin/date/build/jquery.datetimepicker.full.min.js') }}"></script>

    <script>
        jQuery('#datetimepicker').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //autoclose : true;
        });

        jQuery('#datetimepicker1').datetimepicker({
            timepicker:false,
            format:'Y-m-d'
            //format:'Y-m-d H:m:s'
            //autoclose : true;
        });
    </script>
    <script type="text/javascript">
    	$('#productSelect').select2();
    </script>
@endpush
