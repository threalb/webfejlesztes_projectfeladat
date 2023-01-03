@extends('layout')
@section('content')
    <main class="">
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                @foreach($sliders as $key => $slider)
                    <div class="carousel-item {{$key==0?'active':''}}">
                        <div class="bd-placeholder-img align-middle h-100 text-bg-success">
                            @foreach($slider->getMedia('image') as $media)
                                <img class="bd-placeholder-img h-100 w-100" aria-hidden="true"
                                     preserveAspectRatio="xMidYMid slice" focusable="false"
                                     src="{{$media->getUrl('slide')}}" alt="">
                            @endforeach
                        </div>
                        <div class="container">
                            <div class="carousel-caption text-center">
                                <h1 class="websiteName">{{$slider->title}}</h1>
                                <p>{{$slider->description}}</p>

                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="container marketing" style="background-color: #efefef">

            <h1 class="text-center mb-5 websiteName pt-3 pb-2 border-bottom  subheading">Kézzel készített termékeim</h1>
            <div class="row ">
               @foreach($products as $product)
                    @if($product->status==1)
                        <div class="col-lg-4 text-center ">
                            <div class="border productCard p-2 h-100 shadowed rounded d-flex justify-content-center ">
                                <div class="bd-placeholder-img rounded-circle" focusable="false">
                                    <div class="bd-placeholder-img">
                                        @foreach($product->getMedia('image') as $media)
                                            <img class="circle shadowed rounded" src="{{$media->getUrl('public')}}"
                                                 alt="">
                                        @endforeach
                                    </div>
                                    <div class="mt-2">
                                        <h2 class="fw-normal websiteName productName  ">{{$product->name}}</h2>
                                    </div>
                                    <a class="link-dark descriptionLink" data-bs-toggle="collapse"
                                       data-bs-target="#decription_{{$product->id}}" aria-expanded="false"
                                       aria-controls="collapseExample">
                                        Kattints a leírás lenyitásához!
                                    </a>
                                    <div class="collapse" id="decription_{{$product->id}}">
                                        <div class="card card-body">
                                            {{$product->description}}
                                        </div>
                                    </div>

                                    <div
                                        class="d-flex justify-content-between bg-secondary rounded p-2 mb-2 text-white "  style="min-width: 300px">
                                        <span>Mérete: {{$product->size}} </span>
                                        <span>Típusa: {{$product->role->name}} </span>
                                        <span>Raktáron: {{$product->quantity}} db. </span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    @endif
                @endforeach

                <h1 class="text-center mb-5 websiteName pt-3 pb-2 border-bottom  subheading">Blog bejegyzéseim</h1>
                @foreach($blogs as $blog)
                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading fw-normal lh-1">{{$blog->title}} <span
                                    class="text-muted">{{$blog->subtitle}}</span>
                            </h2>
                            <p class="lead">{{$blog->description}}</p>
                        </div>
                        <div class="col-md-5">
                            <div class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto">
                                @foreach($blog->getMedia('image') as $media)
                                    <img class="shadowed" src="{{$media->getUrl('blogs')}}"
                                         alt="">
                                @endforeach
                            </div>
                        </div>
                        <a class="link-dark descriptionLink" href="{{route('showBlog',$blog)}}">Kattints a bővebb
                            leírásér!</a>
                    </div>
                    <hr class="featurette-divider">
                @endforeach
            </div>

            <footer class="footer">

                <p class="float-end"><a href="#" class="link-dark descriptionLink"><i
                            class="fa-solid fa-circle-chevron-up"></i> Back to top</a></p>
                @foreach($companyDatas as $companyData)
                  &copy; 2021–{{date('Y')}} {{$companyData->name}} &middot;
                        {{$companyData->address_zip_code}} {{$companyData->address_city}} {{$companyData->address}} &middot;
                        {{$companyData->phone_number}} &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
                        <img src="images/favicon-32x32.png" alt="logo" title="logo"></p>
                @endforeach
            </footer>
    </main>
@endsection
