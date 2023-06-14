@extends('layouts.app')
@section('content')
<div class="container">
    @if (Session::get('msg'))
    <div class="alert alert-success">
        {{ Session::get('msg') }}
    </div>
    @endif
    <form method="post" action="{{ route('createLeave') }}">
        @csrf
        <div class="mb-3">
            <label for="from" class="form-label fw-bold">From Date:</label>
            <input type="text" class="form-control" name="from" id="from" placeholder="From Date" autocomplete="off">
        </div>
        <div class="mb-3">
            <label for="to" class="form-label fw-bold">To Date:</label>
            <input type="text" class="form-control" name="to" id="to" placeholder="To Date" autocomplete="off">
        </div>
        <div class="mb-3">
            <label for="type_leave" class="form-label fw-bold">Type Of Leave:</label>
            <select class="form-select" name="type_leave">
                <option selected>select type</option>
                <option value="OL">OL</option>
                <option value="SL">SL</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="numDays" class="form-label fw-bold">Number of days:</label>
            <input type="text" class="form-control" name="numDays" id="numDays" placeholder="Number of Days" readonly>
        </div>
        <button type="submit" class="btn btn-primary">Apply Leave</button>
    </form>
    
</div>
@endsection