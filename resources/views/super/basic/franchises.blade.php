@extends('admin.layouts.app')
@section('title','Our Franchises')
@push('css')

@endpush

@section('page-title','Our Franchises')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    {{--<div class="col-md-12">--}}
        {{--<a class="btn btn-primary" href="{{ route('super.admin.create') }}" style="float: right;">--}}
            {{--<span><i class="fa fa-plus-circle"></i></span>--}}
            {{--Add New Admin--}}
        {{--</a>--}}
    {{--</div><hr>--}}

    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table id="category-table" class="table table-striped table-bordered
                nowrap" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Mobile</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">District</th>
                        <th class="text-center">Thana</th>
                        <th class="text-center">Current Business</th>
                        <th class="text-center">Address</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($franchises as $key=>$f)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">{{ $f->name }}</td>
                            <td class="text-center">{{ $f->mobile }}</td>
                            <td class="text-center">{{ $f->email}}</td>
                            <td class="text-center">{{ $f->district}}</td>
                            <td class="text-center">{{ $f->thana}}</td>
                            <td class="text-center">{{ $f->current_business}}</td>
                            <td class="text-center">{{ $f->address}}</td>

                            <td class="text-center">
                                {{--<a class="btn btn-info"--}}
                                   {{--href="{{ route('super.franchises_edit',$admin->id) }}">--}}
                                    {{--<i class="fa fa-edit"></i></a>--}}
                                {{--<button class="btn btn-danger waves-effect"--}}
                                        {{--type="button"--}}
                                        {{--onclick="deleteAdmin({{ $admin->id }})">--}}
                                    {{--<i class="fa fa-trash"></i>--}}
                                {{--</button>--}}
                                {{--<form id="delete-form-{{ $admin->id }}"--}}
                                      {{--action="{{ route('super.admin.destroy',--}}
                                      {{--$admin->id) }}" method="POST" style="display: none;">--}}
                                    {{--@csrf--}}
                                    {{--@method('DELETE')--}}
                                {{--</form>--}}
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Mobile</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">District</th>
                        <th class="text-center">Thana</th>
                        <th class="text-center">Current Business</th>
                        <th class="text-center">Address</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')

    <script>
        $(document).ready(function() {
            var table = $('#category-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        $('#admin_roles').select2();
        $('#admin_roles').on('change', function() {
            $("option[value='']").remove();

        });
        function deleteAdmin(id) {
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
