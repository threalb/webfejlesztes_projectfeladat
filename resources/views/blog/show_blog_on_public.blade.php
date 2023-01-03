@extends('layout')
@section('content')
    <div class="container shadowed pt-2 h-100 "  style="background-color: #efefef">
        <div>
            <h1 class="websiteName"> {{$blog->title}}</h1>
        </div>
        <div class="text-center mt-2 col-md-6 ">
            @foreach($blog->getMedia('image') as $media)
                <img class="shadowed" src="{{$media->getUrl('blog')}}" aria-hidden="true"
                preserveAspectRatio="xMidYMid slice" focusable="false"
                     alt="{{$blog->title}}" title="{{$blog->title}}">
            @endforeach
        </div>
        <div>

            <h3 class="text-end text-muted mt-3 mb-3 "> {{$blog->subtitle}}</h3>
            <p class="fst-italic p-3">{{$blog->content}}</p>
        </div>
        <div class="">
            <a href="/" class="fs-5 link-dark descriptionLink  ">Vissza a főoldalra</a>
        </div>
    </div>
@endsection
