@extends('layouts.app')
@section('content')
    <div class="container">

        @if (count($leaves) == 0)
            <h2>No Leave Applied</h2>
        @else
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>From Date</th>
                        <th>To Date</th>
                        <th>Type of leave</th>
                        <th>Number of days</th>
                        <th>Current leave status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @php $leaveCount = 0; @endphp

                    @foreach ($leaves as $leave)
                        @if ($leave->status == '0')
                            <tr>
                                <td>{{ $leave->user->name }}</td>
                                <td>{{ $leave->from }}</td>
                                <td>{{ $leave->to }}</td>
                                <td>{{ $leave->type_leave }}</td>
                                <td>{{ $leave->num_of_days }}</td>
                                <td >
                                    <div id="statusBar">
                                        <span class="badge bg-warning">New</span>
                                    </div>
                                </td>
                                <td>
                                    @csrf
                                    <button class="btn btn-sm btn-success switch-status" data-id="{{ $leave->id }}"
                                        value="1"><i class="fa-solid fs-6 fa-check"></i></button>
                                    <button class="btn btn-sm btn-danger switch-status" data-id="{{ $leave->id }}"
                                        value="2"><i class="fa-sharp fa-solid fs-6 fa-xmark"></i></button>
                                    </td>
                            </tr>

                            @php $leaveCount++  @endphp
                        @elseif($leaveCount == 0)
                            <tr>
                                <td colspan="6">
                                    <h2>No Leave request are there!</h2>
                                </td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>
    <script>
        $(document).ready(function() {
            $('.switch-status').click(function(e) {
                e.preventDefault();
                var id = $(this).data('id');
                var status = $(this).val();
                var url = "{{ route('leaveAction') }}";
                var _token = $('input[name="_token"]').val();

                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        id: id,
                        status: status,
                        _token: _token,
                    },
                    success: function(status) {
                        console.log(status);
                        if (status == 1) {
                            $("#statusBar").html('<span class="badge bg-success">Approved</span>');
                        } else {
                            $("#statusBar").html('<span class="badge bg-danger">Declined</span>');
                        }
                    }
                });
            });
        });
    </script>
@endsection
