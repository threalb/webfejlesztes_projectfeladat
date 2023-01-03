@extends('layout')
@section('content')

    <div class="container mt-1 ">
        <div class="bg-dark text-white border border-dark rounded">
            <div class="jumbotron   pt-3 pb-3 border-bottom ">
                <h1 class=" text-center    websiteName "><i class="fa-solid fa-users"></i> Felhasználók listázása <i
                        class="fa-solid fa-users"></i></h1>
            </div>
            <table class="table table-dark table-striped">

                <thead>
                <tr>
                    <th>#</th>
                    <th>Név</th>
                    <th>Email</th>
                    <th>Jogosultság</th>
                    <th>Állapot</th>
                    <th>Műveletek</th>
                </tr>
                </thead>
                <tbody>
                @php
                    $i=1;
                @endphp
                @foreach($users as $user)
                    <tr>
                        <td>{{$i++}}</td>
                        <td>{{$user->last_name}} {{$user->first_name}}</td>
                        <td>{{$user->email}}</td>
                        <td>{{$user->role->name }}</td>
                        <td>{{$user->status ? 'Aktív' : 'Inaktív'}}</td>


                        <td>
                            @if(\Illuminate\Support\Facades\Gate::allows('superadmin'))
                            <a class="btn btn-warning" href="{{url('userEditById/'.$user->id)}}"> <i
                                    class="fa-solid fa-edit"></i>
                                Módosít</a>
                            <a class='btn btn-danger' href="{{url('userDeleteById/'.$user->id)}}"> <i
                                    class="fa-solid fa-trash"></i>
                                Töröl</a>
                                @endif
                        </td>


                    </tr>
                @endforeach
                </tbody>
                <tfoot class="pb-2">
                <tr>
                    <th>#</th>
                    <th>Név</th>
                    <th>Email</th>
                    <th>Jogosultság</th>
                    <th>Állapot</th>
                    <th>Műveletek</th>
                </tfoot>
            </table>
        </div>
    </div>

@endsection
