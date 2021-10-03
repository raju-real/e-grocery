@extends('admin.layouts.app')
@section('title','Company')
@push('css')

@endpush

@section('page-title','Connected Company List')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12">
        {{-- <a href="{{ route('admin.category.create') }}" class="btn-lg btn btn-primary" style="float: right;">Add New Category</a> --}}
        <a class="btn btn-primary" data-toggle="modal" href='#company_add' style="float: right;">
            <span><i class="fa fa-plus-circle"></i></span>
            Add New Company
        </a>
        <div class="modal fade" id="company_add">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 style="float: left;">Add New Company</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="{{ route('super.company.store') }}" method="POST"
                              role="form" enctype="multipart/form-data" >
                            @csrf
                            <div class="form-group">
                                <label for="">Company Name</label>
                                <input name="company_name" type="text" class="form-control"
                                       placeholder="Company Name" >
                            </div>
                            <div class="form-group">
                                <label for="">Company Address</label>
                                <input name="address" type="text" class="form-control"
                                       placeholder="Company Address" >
                            </div>
                            <div class="form-group">
                                <label for="">Company Mobile</label>
                                <input name="mobile" type="text" class="form-control" id="store_name" placeholder="Company Mobile" >
                            </div>
                            <div class="form-group">
                                <label for="">Supplier Name</label>
                                <input name="supplier_name" type="text" class="form-control"
                                       placeholder="Supplier Name" >
                            </div>
                            <div class="form-group">
                                <label for="">Supplier Mobile</label>
                                <input name="supplier_mobile" type="text" class="form-control"
                                        placeholder="Supplier Mobile" >
                            </div>
                            <div class="form-group">
                                <label for="">Company Logo</label>
                                <input name="image" type="file" class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><hr>

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="company-table" class="table table-striped table-bordered nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Company Name</th>
                        <th class="text-center">Company Logo</th>
                        <th class="text-center">Company Mobile</th>
                        <th class="text-center">Address</th>
                        <th class="text-center">Supplier Name</th>
                        <th class="text-center">Supplier Mobile</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($companies as $key=>$company)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">{{ $company->company_name }}</td>
                            <td class="text-center">
                                <img src="{{ asset('images/company/'.$company->image) }}" class="img-responsive" alt="Image" style="height: 80px;width: 100px;">
                            </td>
                            <td class="text-center">{{ $company->mobile }}</td>
                            <td class="text-center">{{ $company->address }}</td>
                            <td class="text-center">{{ $company->supplier_name }}</td>
                            <td class="text-center">{{ $company->supplier_mobile }}</td>
                            <td class="text-center">
                                <a class="btn btn-info" data-toggle="modal" href='#company_edit{{ $company->id }}'>
                                    <i class="fa fa-edit"></i></a>
                                <div class="modal fade" id="company_edit{{ $company->id }}">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4>Edit Company&nbsp;&nbsp;-&nbsp;&nbsp;
                                                    <span style="color: green;">
                                                        {{ $company->company_name }}
                                                    </span></h4>
                                                <button type="button" class="close"
                                                        data-dismiss="modal"
                                                        aria-hidden="true">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <form action="{{ route('super.company.update',$company->id) }}" method="POST"
                                                      role="form" enctype="multipart/form-data" >
                                                    @csrf
                                                    @method('PUT')
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Company Name</label>
                                                        <input name="company_name" type="text"
                                                               class="form-control"
                                                               value="{{ $company->company_name }}" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Company Address</label>
                                                        <input name="address" type="text" class="form-control"
                                                               value="{{ $company->address }}" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Company Mobile</label>
                                                        <input name="mobile" type="text" class="form-control" id="store_name" value="{{ $company->mobile }}" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Supplier Name</label>
                                                        <input name="supplier_name" type="text" class="form-control"
                                                               value="{{ $company->supplier_name }}" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Supplier Mobile</label>
                                                        <input name="supplier_mobile" type="text" class="form-control" value="{{ $company->supplier_mobile }}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Company Logo</label>
                                                        <input name="image" type="file" class="form-control" >
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-danger waves-effect" type="button" onclick="deleteCompany({{ $company->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $company->id }}" action="{{ route('super.company.destroy',$company->id) }}" method="POST" style="display: none;">
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
                        <th class="text-center">Company Name</th>
                        <th class="text-center">Company Logo</th>
                        <th class="text-center">Company Mobile</th>
                        <th class="text-center">Address</th>
                        <th class="text-center">Supplier Name</th>
                        <th class="text-center">Supplier Mobile</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')

    {{-- Default JS Part --}}
    <script>
        $(document).ready(function() {
            var table = $('#company-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        function deleteCompany(id) {
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
