@extends('layouts.app')
@section('content')
    <div class="container">
        <form method="post" action="{{ route('updateUser') }}">
            @csrf
            <input type="hidden" name="id" value="{{ $user->id }}">
            <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input type="text" class="form-control" id="name" name="name" value="{{ $user->name ?? null }}">
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email address</label>
              <input type="email" class="form-control" id="email" name="email" value="{{ $user->email ?? null }}">
            </div>
            <div class="mb-3">
              <label for="Role" class="form-label">Role</label>
              <select class="form-select" name="role">
                <option value="admin" @if($user->role == 'admin') {{ 'selected' }} @endif>Admin</option>
                <option value="user" @if($user->role == 'user') {{ 'selected' }} @endif>User</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
          </form>
    </div>
@endsection