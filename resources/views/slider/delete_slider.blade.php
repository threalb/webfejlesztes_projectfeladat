@extends('layout')
@section('content')
    <div class="container mt-1 d-flex justify-content-center">
        <div class="  text-white bg-dark  p-5 rounded">
            <div class="jumbotron  text-white pt-3 rounded-top mt-1 pb-3">
                <h1 class=" text-center    text-white pt-3 pb-3 websiteName "><i class="fa-solid fa-trash"></i></i> {{$slider->title}} törlése? <i class="fa-solid fa-file-image"></i></h1>
            </div>

                <input type="hidden" value="{{$slider->id}}" name="id">
                <div><h2 class="text-center">Valóban törli <i class="fa-solid fa-hashtag"></i>{{$slider->id}} ID-val  rendelkező képváltót? </h2></div>
                <div class="d-flex justify-content-between">
                    <a href="javascript:history.go(-1)" class="btn btn-warning ">
                        <i class="fa-solid fa-arrow-left"></i>
                        VISSZA
                    </a>

                    <a href="{{route('sliderDelete',$slider)}}"  class="btn btn-danger text-white" >
                        <i class="fa-solid fa-trash"></i>
                        TÖRÖL
                    </a>
                </div>
            </form>
        </div>
    </div>

@endsection
