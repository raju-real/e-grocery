@extends('admin.layouts.app')
@section('title','Pending Order')
@push('css')

@endpush

@section('page-title','Pending Order')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <form action="{{ route('super.search_order') }}" method="post" role="form">
                    @csrf
                    <legend>Search Order</legend>

                    <div class="form-group">
                        <label for=""></label>
                        <input type="text" class="form-control" name="number" id="number"
                               placeholder="Order/Invoice Number">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('js')

@endpush
