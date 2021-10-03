@extends('admin.layouts.app')
@section('title','Promotion')
@push('css')

@endpush

@section('page-title','Promotion Image')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12">

        <a class="btn btn-primary" data-toggle="modal" href='#category_add' style="float: right;">
            <span><i class="fa fa-plus-circle"></i></span>
            Add New Promotion
        </a>
        <div class="modal fade" id="category_add">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 style="float: left;">Create New Promotion</h4>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="{{ route('super.promotion.store') }}" method="POST"
                              role="form" enctype="multipart/form-data"
                              onsubmit="return storeValidation()">
                            @csrf
                            <div class="form-group">
                                <label for="">Promotion Name</label>
                                <input name="name" type="text" class="form-control"
                                       id="store_name" placeholder="Promotion Name"
                                       onkeypress="hideStoreNameError()">
                                <span id="store_name_error" style="display: none;"></span>
                            </div>
                            <div class="form-group">
                                <label for="">Promotion Image</label>
                                <input name="image" type="file" class="form-control"
                                       id="store_image" onclick="hideStoreImageError()">
                                <span id="store_image_error" style="display: none;"></span>
                            </div>
                            <div class="form-group">
                                <label for="">Status</label>
                                <select name="status" id="" class="form-control">
                                    <option value="1">Active</option>
                                    <option value="0">In Active</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-danger"
                                    data-dismiss="modal">Close</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><hr>

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="category-table" class="table table-striped table-bordered
                nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Products</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($promotions as $key=>$promotion)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">{{ $promotion->name }}</td>
                            <td class="text-center">
                                <img src="{{ asset('images/promotion/'.$promotion->image) }}"
                                     class="img-responsive" alt="Image" style="height: 80px;width: 100px;">
                            </td>
                            <td class="text-center">
                                {{ $promotion->status == 1 ? 'Active' : 'In Active' }}
                            </td>
                            <td class="text-center">
                                <a href="{{ route("super.promotion_product",$promotion->id) }}" class="btn btn-info">
                                    @php
                                    $totalProduct = DB::table('promotionproducts')
                                        ->where('promotion_id',$promotion->id)->get();

                                            @endphp
                                    View Products ( {{ $totalProduct->count() }} )
                                </a>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-info" data-toggle="modal"
                                   href='#promotion_edit{{ $promotion->id }}'>
                                    <i class="fa fa-edit"></i></a>
                                <div class="modal fade" id="promotion_edit{{ $promotion->id }}">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4>Edit Promotion&nbsp;&nbsp;-&nbsp;&nbsp;
                                                    <span style="color: green;">
                                                        {{ $promotion->name }}
                                                    </span></h4>
                                                <button type="button" class="close"
                                                        data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                            </div>

                                            <div class="modal-body">
                                                <form action="{{ route('super.promotion.update',$promotion->id) }}"
                                                      method="POST" role="form"
                                                      enctype="multipart/form-data">
                                                    @csrf
                                                    @method('PUT')
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">
                                                            Slider Title
                                                        </label>
                                                        <input name="name" type="text"
                                                               class="form-control" id=""
                                                               value="{{ $promotion->name }}">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="" style="float: left;">
                                                            Current Image
                                                        </label>
                                                        <br>
                                                        <img src="{{ asset('images/promotion/'
                            .$promotion->image) }}"
                                                             class="img-responsive"
                                                             alt="Image" style="height: 200px;width: 250px;">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="" style="float: left;">
                                                            Change Image
                                                        </label>
                                                        <input name="image" type="file"
                                                               class="form-control" id="">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="" style="float: left;">
                                                            Status</label>
                                                        <select name="status" id=""
                                                                class="form-control">
                                                            <option value=
                                                                    "{{ $promotion->status }}">
                                                                {{ $promotion->status == 1 ? 'Active' : 'In Active' }}
                                                            </option>
                                                            <option value="1">Active</option>
                                                            <option value="0">In Active</option>
                                                        </select>
                                                    </div>

                                                    <button type="submit"
                                                            class="btn btn-primary"
                                                            style="float: left;">Update
                                                    </button>
                                                    <button type="button"
                                                            class="btn btn-danger"
                                                            data-dismiss="modal"
                                                            style="float: right;">
                                                        Close
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-danger waves-effect"
                                        type="button"
                                        onclick="deleteSlider({{ $promotion->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $promotion->id }}"
                                      action="{{ route('super.promotion.destroy',
                                      $promotion->id) }}" method="POST" style="display: none;">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Image</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Products</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')
    {{-- Form Validation Part --}}
    <script type="text/javascript">
        var takenName = document.getElementById("store_name");
        var takenImage = document.getElementById("store_image");
        function storeValidation(){
            var name = takenName;
            var image = takenImage;
            if(name.value.trim() == ""){
                var message = document.getElementById("store_name_error");
                $('#store_name_error').show();
                message.innerHTML = "Name Field Is Required";
                message.style.color = "red";
                name.style.border = "1px solid red";
                return false;
            } else if(image.value.trim() == ""){
                var message = document.getElementById("store_image_error");
                $('#store_image_error').show();
                message.innerHTML = "Image Field Is Required";
                message.style.color = 'red';
                image.style.border = "1px solid red";
                return false;
            } else {
                return true;
            }
        }

        function hideStoreNameError(){
            $('#store_name_error').hide();
            var name = takenName;
            name.style.border = '1px solid black';
        }
        function hideStoreImageError(){
            $('#store_image_error').hide();
            var image = tekenImage;
            image.style.border = '1px solid black';
        }
    </script>

    {{-- Default JS Part --}}
    <script>
        $(document).ready(function() {
            var table = $('#category-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        function deleteSlider(id) {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    event.preventDefault();
                    document.getElementById('delete-form-'+id).submit();
                } else if (
                    // Read more about handling dismissals
                result.dismiss === swal.DismissReason.cancel
                ) {
                    swal(
                        'Cancelled',
                        'Your data is safe :)',
                        'error'
                    )
                }
            })
        }
    </script>
@endpush
