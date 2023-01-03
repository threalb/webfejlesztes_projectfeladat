@extends('layout')

@section('content')

    <div class="container mt-1 d-flex justify-content-center ">

        <div class="col-sm-6 text-white  bg-dark p-2 rounded ">
            <div class="jumbotron bg-dark text-white pt-3 rounded-top mt-1 pb-3">
                <h1 class=" text-center bg-dark   text-white pt-3 pb-3 websiteName "><i class="fa-solid fa-screwdriver-wrench"></i>{{$user->last_name}} {{$user->first_name}} módisítása <i class="fa-solid fa-user"></i></h1>
            </div>

            <form action="{{url('userUpdate')}}" method="POST">
                @csrf
                <input type="hidden" name="id" id="id" value="{{$user->id}}">
                <div class="form-group">
                    <label for="lastName">Vezetéknév*</label>
                    <input type="text" class="form-control" name="lastName" id="lastName" value="{{$user->last_name}}" required>
                </div>
                <div class="form-group">
                    <label for="firstName">Keresztnév*</label>
                    <input type="text" class="form-control" name="firstName" id="firstName"value="{{$user->first_name}}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" class="form-control" name="email" id="email" value="{{$user->email}}"required>

                </div><div class="form-group">
                    <label for="password">Jelszó*</label>
                    <input type="password" class="form-control" name="password" id="password" >
                </div>

                               <div class="form-group">
                    <label for="userRole">Jogosultság*</label>
                    <select class="form-select" name="userRole" id="userRole">
                        @foreach($userRoles as $userRole)
                            <option value="{{$userRole->id}}" >{{$userRole->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="userRole">Beosztás*</label>
                    <select class="form-select" name="employeeCategory" id="employeeCategory">
                        @foreach($employeeCategories as $employeeCategory)
                            <option value="{{$employeeCategory->id}}">{{$employeeCategory->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-check mt-3">
                    <input type="checkbox" name="status" id="status" {{$user->status?'checked':''}}>
                    <label for="status">Aktív</label>
                </div>
                <div class="form-group mt-3 justify-content-between d-flex">
                    <a href="javascript:history.go(-1)" class="btn btn-warning "> <i class="fa-solid fa-arrow-left"></i> Vissza</a>
                    <button type="submit" class="btn btn-success text-white" name="update"><i
                            class="fa-solid fa-floppy-disk"></i> MÓDOSÍT
                    </button>
                </div>
            </form>
        </div>

    </div>

@endsection
