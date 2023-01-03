@extends('layout')
@section('content')
    @php
        $numbersOfProducts= count($products);
        $numbersOfBlogs= count($blogs);
        $numbersOfSliders= count($sliders);
    @endphp

    <div class="container mt-1 rounded">
        <div class="bg-dark text-white rounded ">
            <div class="jumbotron pt-3 pb-3 border-bottom rounded-top ">
                <h1 class="text-center"> Üdvözöllek a <span class="websiteName">Didus HandMade</span> vezérlőpultján.
                </h1>
                <hr>
                <ul>
                    <h1 class=" text-center    websiteName ">
                        <i class="fa-solid fa-circle-info"></i>
                        Általános információk listázása
                        <i class="fa-solid fa-list"></i>
                    </h1>
                    <li><h4>Összesen {{$numbersOfProducts}} db termék található az adatbázisban.</h4></li>
                    <li><h4>Összesen {{$numbersOfBlogs}} db blog található az adatbázisban.</h4></li>
                    <li><h4>Összesen {{$numbersOfSliders}} db képváltó található az adatbázisban.</h4></li>
                </ul>
            </div>
        </div>
    </div>

@endsection
