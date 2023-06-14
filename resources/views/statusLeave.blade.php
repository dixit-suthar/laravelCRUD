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
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($leaves as $leave)
                        <tr>
                            <td>{{ $leave->user->name }}</td>
                            <td>{{ $leave->from }}</td>
                            <td>{{ $leave->to }}</td>
                            <td>{{ $leave->type_leave }}</td>
                            <td>{{ $leave->num_of_days }}</td>
                            <td>
                                <span
                                    class=" badge
                            @if ($leave->status == '1') {{ 'bg-success' }}
                            @elseif ($leave->status == '2')
                            {{ 'bg-danger' }}
                            @else
                            {{ 'bg-warning' }} @endif
                            ">
                                    @if ($leave->status == '1')
                                        {{ 'Approved' }}
                                    @elseif ($leave->status == '2')
                                        {{ 'Declined' }}
                                    @else
                                        {{ 'New' }}
                                    @endif
                                </span>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>
@endsection
