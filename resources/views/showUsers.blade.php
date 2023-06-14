@extends('layouts.app')
@section('content')
    <div class="container">

        @if (count($users) == 0)
            <h2>No Users to display</h2>
        @else
            <table class="table text-center">
                <thead>
                    <tr>
                        <th>User Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @php $leaveCount = 0; @endphp

                    @foreach ($users as $user)
                        <tr>
                            <td>{{ $user->id }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->role }}</td>
                            <td>
                                @csrf

                                <button class="btn btn-sm btn-danger delete" title="Delete" data-id="{{ $user->id }}">
                                    <i class="fa-sharp fa-solid fa-trash"></i>
                                </button>
                                <a href="{{ route('editUser',$user->id) }}" class="btn btn-sm btn-success edit" title="Edit" data-id="{{ $user->id }}">
                                    <i class="fa-solid fa-pencil"></i>
                                </a>
                                <button class="btn btn-sm btn-warning" title="View" data-bs-toggle="modal"
                                    data-bs-target="#staticBackdrop" data-id="{{ $user->id }}"
                                    data-name="{{ $user->name }}" data-email="{{ $user->email }}"
                                    data-role="{{ $user->role }}">
                                    <i class="fa-solid fa-eye"></i>
                                </button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="d-flex justify-content-start">
                {!! $users->links('pagination::bootstrap-5') !!}
            </div>
        @endif
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">User Description</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card d-flex align-items-center">
                        <img src="{{ asset('asserts\profile.png') }}" class="card-img-top w-50 h-25" alt="profile image">
                        <div class="card-body">
                            <table class="table">
                                <tr>
                                    <th>User Id:</th>
                                    <td id="id"></td>
                                </tr>
                                <tr>
                                    <th>Username:</th>
                                    <td id="name"></td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td id="email"></td>
                                </tr>
                                <tr>
                                    <th>Role:</th>
                                    <td id="role"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {

            $('#staticBackdrop').on('show.bs.modal', function(e) {
                var link = $(e.relatedTarget),
                    id = link.data('id'),
                    name = link.data('name'),
                    email = link.data('email'),
                    role = link.data('role'),
                    modal = $(this);
                console.log(modal);
                modal.find('.modal-body #id').html(id);
                modal.find('.modal-body #name').html(name);
                modal.find('.modal-body #email').html(email);
                modal.find('.modal-body #role').html(role);
            });




            $('.delete').click(function(e) {
                e.preventDefault();
                var id = $(this).data('id');

                var url = "{{ route('deleteUser') }}";
                var _token = $('input[name="_token"]').val();
                $(this).parent().parent().remove();

                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        id: id,
                        _token: _token
                    },
                });
            });
        });
    </script>
@endsection
