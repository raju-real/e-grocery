@extends('admin.layouts.app')
@section('title','Company')
@push('css')

@endpush

@section('page-title','Connected Company List')

@section('count-topbar')
    {{-- @include('backend.layouts.count_topbar') --}}
@endsection

@section('content')
    <div class="col-md-12" style="margin-top: 20px;">
        <div class="tile">
            <div class="tile-body">
                <table  class="table table-striped table-bordered nowrap table-responsive" style="width:100%">
                    <thead>
                    <tr>
                        <th class="text-center">Date</th>
                        <th class="text-center">User Name</th>
                        <th class="text-center">Subject</th>
                        <th class="text-center">Mobile</th>
                        <th class="text-center">Message</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Reply</th>
                        <th class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($messages as $key=>$message)
                        <tr>
                            <td class="text-center">{{$message->created_at->format('d-M-y') }}</td>
                            <td class="text-center">{{ $message->name }}</td>
                            <td class="text-center">{{ $message->subject }}</td>
                            <td class="text-center">{{ $message->mobile }}</td>
                            <td class="text-center" style="text-align: justify;">
                                {{ $message->message }}
                            </td>
                            <td class="text-center">
                                <span class="btn btn-default">
                                    {{ $message->status==0?'UnRead':'Read' }}
                                </span>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-info" data-toggle="modal"
                                   href='#reply{{ $message->id }}'>
                                    <i class="fa fa-reply"></i>
                                </a>
                                <div class="modal fade" id="reply{{ $message->id }}">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4>Reply To&nbsp;&nbsp;
                                                    <span style="color: green;">
                                                        {{ $message->name }}
                                                    </span></h4>
                                                <button type="button" class="close"
                                                        data-dismiss="modal"
                                                        aria-hidden="true">&times;</button>
                                            </div>

                                            <div class="modal-body">
                                                <form action="" method="POST"
                                                      role="form" >
                                                    @csrf
                                                    <div class="form-group">
                                                        <label for="" style="float: left;">Mobile</label>
                                                        <input name="mobile" type="text"
                                                               class="form-control"
                                                               value="{{ $message->mobile }}" readonly>
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="" style="float: left;">MessageSupplier Name</label>
                                                        <textarea name="message" id="" cols="30" rows="10"
                                                                  class="form-control">

                                    </textarea>
                                                    </div>

                                                    <button type="submit" class="btn btn-primary">Send</button>
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close</button>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center">
                                <a href="{{ route('super.message_read',$message->id) }}"
                                   class="btn btn-success">
                                    <i class="fa fa-check "></i>
                                </a>
                                <button class="btn btn-danger waves-effect" type="button" onclick="deleteMessage({{ $message->id }})">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <form id="delete-form-{{ $message->id }}" action="{{ route('super.message_destroy',$message->id) }}" method="POST" style="display: none;">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <nav aria-label="Page navigation example" style="float: right;">
                    <ul class="pagination pagination-lg">
                        <li class="page-item">{{ $messages->links() }}</li>
                    </ul>
                </nav>
                    <tfoot>
                    <tr>
                        <th class="text-center">Date</th>
                        <th class="text-center">User Name</th>
                        <th class="text-center">Subject</th>
                        <th class="text-center">Mobile</th>
                        <th class="text-center">Message</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Reply</th>
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
            var table = $('#message-table').DataTable( {
                responsive: true
            } );

            new $.fn.dataTable.FixedHeader( table );
        } );
    </script>
    <script type="text/javascript">
        function deleteMessage(id) {
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
