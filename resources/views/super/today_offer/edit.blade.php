@extends('admin.layouts.app')
@section('title','Today offer Edit')
@push('css')

@endpush

@section('page-title','Today offer Edit')

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
		<form action="{{ route('super.today_offer.update',$offer->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label style="float: left;">Take Product</label><br>
                <select name="product_id" 
                class="form-control"  id="editProductSelect" style="width: 100%;">
                    <optgroup>
                        <option value="{{ $offer->product->id }}">
                            {{ $offer->product->product_name }} {{ " ---- Current Price: " }} {{ $offer->product->unit_price }}
                        </option>
                        @foreach($products as $product)
                            <option value="{{ $product->id }}">
                                {{ $product->product_name }} {{ " ---- Current Price: " }} {{ $product->unit_price }}
                            </option>
                        @endforeach
                    </optgroup>
                </select>
                <span id="category_error" style="display: none;"></span>
            </div>

            <div class="form-group">
                <label for="demoDate" style="float: left;">Date</label>
                <input autocomplete="off" 
                id="datetimepicker" type="text" name="offer_date" class="form-control" value="{{ $offer->offer_date }}">
            </div>
            
            <div class="form-group">
                <label for="" style="float: left;">Price</label>
                <input name="offer_price" type="text" class="form-control" id="store_name" value="{{ $offer->offer_price }}">
                <span id="store_name_error" style="display: none;"></span>
            </div>

            <div class="form-group">
                <label for="">Status</label>
                <select name="status" id="" class="form-control">
                    <option value="1">
                        {{ $offer->status == 1 ? 'Active':'In Active' }}
                    </option>
                    <option value="1">Active</option>
                    <option value="2">In Active</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
            <a href="{{ route('super.today_offer.index') }}" class="btn btn-danger">Back</a>
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
            timepicker:true,
            format:'Y-m-d'
            //autoclose : true;
        });
    </script>
    <script type="text/javascript">
    	$('#editProductSelect').select2();
    </script>
@endpush