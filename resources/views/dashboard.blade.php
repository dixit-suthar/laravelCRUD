@extends('layouts.app')
@section('content')
<div class="container">
    <h1>Welcome to the Dashboard</h1>
    <h3>Username: {{ Auth::user()->name; }}</h3>
    <h3>Email: {{ Auth::user()->email; }}</h3>
    <h3>Role: {{ Auth::user()->role }}
    </h3>
</div>
@endsection