@extends('layout')

@section('content')

    <div class="container mt-1  d-flex justify-content-center">
        <div class="col-sm-6 border border-dark rounded ">
            <div class="jumbotron bg-dark text-white pt-3 rounded-top  pb-3">
                <h1 class=" text-center bg-dark   text-white pt-3 pb-3 websiteName "><i class="fa-solid fa-user-plus"></i> Új felhasználó <i class="fa-solid fa-user-plus"></i></h1>
            </div>
            <form action="{{url('userSave')}}" class="bg-dark text-white p-3" method="POST">
                @csrf
                <div class="form-group">
                    <label for="lastName">Vezetéknév*</label>
                    <input type="text" class="form-control" name="lastName" id="lastName" required>
                </div>
                <div class="form-group">
                    <label for="firstName">Keresztnév*</label>
                    <input type="text" class="form-control" name="firstName" id="firstName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" class="form-control" name="email" id="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Jelszó*</label>
                    <input type="password" class="form-control" name="password" id="password">
                </div>
                <div class="form-group">
                    <label for="userRole">Jogosultság*</label>
                    <select class="form-select" name="userRole" id="userRole">
                       @foreach($userRoles as $userRole)
                        <option value="{{$userRole->id}}">{{$userRole->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-check mt-3">
                    <input type="checkbox" name="status" id="status" checked>
                    <label for="status">Aktív</label>
                </div>
                <div class="form-group mt-3 justify-content-between d-flex">
                    <a href="javascript:history.go(-1)" class="btn btn-warning"> <i class="fa-solid fa-arrow-left"></i> Vissza</a>
                    <button type="submit" class="btn btn-success text-white" name="save"> <i class="fa-solid fa-floppy-disk"></i> MENT </button>
                </div>
            </form>
        </div>

    </div>

@endsection
