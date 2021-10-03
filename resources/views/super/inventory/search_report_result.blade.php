@extends('admin.layouts.app')
@section('title',$message)
@push('css')
    {{-- expr --}}
@endpush
@section('page-title',$message)
@section('content')
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <table id="inventories" class="table table-striped table-bordered nowrap"
                       style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Sl.No</th>
                        <th class="text-center">Added By</th>
                        <th class="text-center">Product</th>
                        <th class="text-center">Create Date</th>
                        <th class="text-center">Quantity</th>
                        <th class="text-center">Buying Price</th>
                        <th class="text-center">Buying Unit Price</th>
                        <th class="text-center">Selling Unit Price</th>
                        <th class="text-center">Selling Price</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    @foreach($inventories as $key => $inventory)
                        <tr>
                            <td class="text-center">{{ $key+1 }}</td>
                            <td class="text-center">{{ $inventory->admin->name }}</td>
                            <td class="text-center">{{ $inventory->product->product_name }}</td>
                            <td class="text-center">{{ $inventory->create_date }}</td>
                            <td class="text-center">{{ $inventory->quantity }}</td>
                            <td class="text-center">{{ $inventory->buying_price }}</td>
                            <td class="text-center">{{ $inventory->buying_unit_price }}</td>
                            <td class="text-center">{{ $inventory->selling_unit_price }}</td>
                            <td class="text-center">{{ $inventory->selling_price }}</td>
                            <td class="text-center">
                                <a href="{{ route('super.inventory_show',$inventory->id) }}"
                                   class="btn btn-primary">
                                    <i class="fa fa-eye"></i></a>
                                <a href="{{ route('super.inventory_edit',$inventory->id) }}"
                                   class="btn btn-success">
                                    <i class="fa fa-edit"></i></a>
                                {{--  Delete part  --}}
                                <button class="btn btn-danger waves-effect" type="button"
                                        onclick="deleteinventory({{ $inventory->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $inventory->id }}" action=""
                                      method="POST" style="display: none;">
                                    @csrf
                                    @method('DELETE')
                                </form>
                                {{--  Delete part end  --}}
                                {{--  <a href="{{ route('admin.inventory.inventory.create',$inventory->id) }}" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                                <a href="" class="btn btn-primary"><i class="fa fa-user"></i></a>  --}}
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

@endsection

@push('js')
    {{--  DataTable Jquery  --}}
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('#inventories').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
    <script type="text/javascript">
        function deleteinventory(id) {
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
