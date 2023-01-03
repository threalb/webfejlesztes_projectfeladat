@extends('layout')
@section('content')
    <div class="container mt-1 d-flex justify-content-center">
        <div class="  text-white bg-dark  p-5 rounded">
            <div class="jumbotron  text-white pt-3 rounded-top mt-1 pb-1">
                <h1 class=" text-center    text-white pt-3 pb-3 websiteName "><i class="fa-solid fa-trash"></i></i> {{$product->name}} törlése? <i class="fa-solid fa-gift"></i></h1>
            </div>
            <div class="text-center  mb-3">
                @foreach($product->getMedia('image') as $media)
                    <img class="rounded " src="{{$media->getUrl('public')}}" alt="">
                @endforeach
            </div>


            <div><h2 class="text-center">Valóban törli <i class="fa-solid fa-hashtag"></i>{{$product->id}} ID-val  rendelkező terméket? </h2></div>
            <div class="d-flex justify-content-between">
                <a href="javascript:history.go(-1)" class="btn btn-warning ">
                    <i class="fa-solid fa-arrow-left"></i>
                    VISSZA
                </a>

                <a href="{{route('productDelete',$product)}}"  class="btn btn-danger text-white" >
                    <i class="fa-solid fa-trash"></i>
                    TÖRÖL
                </a>
            </div>

        </div>
    </div>

@endsection
