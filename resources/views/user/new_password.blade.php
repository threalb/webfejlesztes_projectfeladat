@extends('layout')
@section('content')
    <div class="container mt-1  d-flex justify-content-center">
        <div class="col-sm-6 border border-dark rounded ">
            <div class="jumbotron bg-dark text-white pt-3 rounded-top  pb-3">
                <h1 class=" text-center bg-dark   text-white pt-3 pb-3 websiteName ">
                    <i class="fa-solid fa-key"></i>
                     Jelszó módisítása
                    <i class="fa-solid fa-key"></i>
                </h1>
            </div>
            <form action="{{route('UserPasswordUpdate',$user)}}" class="bg-dark text-white p-3" method="POST"
                  enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" id="id" value="{{$user->id}}">
                <h1>{{$user->last_name}} {{$user->first_name}}</h1>
                <div class="form-group">
                    <label for="currentPass">Jelenlegi jelszó</label>
                    <input type="password" class="form-control" name="currentPass" id="currentPass"
                           placeholder="Adja meg a jelenlegi jelszavát" >
                </div>  <div class="form-group">
                    <label for="newPass">Jelenlegi jelszó</label>
                    <input type="password" class="form-control" name="newPass" id="newPass"
                           placeholder="Adja meg az új jelszavát">
                </div>  <div class="form-group">
                    <label for="newRePass">Jelenlegi jelszó</label>
                    <input type="password" class="form-control" name="newRePass" id="newRePass"
                           placeholder="Adja meg az új jelszavát mégegyszer">
                </div>

                <div class="form-group mt-3 justify-content-between d-flex">
                    <a href="javascript:history.go(-1)" class="btn btn-warning"> <i class="fa-solid fa-arrow-left"></i>
                        Vissza</a>
                    <button type="submit" class="btn btn-success text-white" name="save"><i
                            class="fa-solid fa-floppy-disk"></i> MENT
                    </button>
                </div>
            </form>
        </div>

    </div>

@endsection
