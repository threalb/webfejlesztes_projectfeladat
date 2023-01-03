@extends('layout')
@section('content')
    <div class="container mt-1  d-flex justify-content-center">
        <div class="col-sm-6 border border-dark rounded ">
            <div class="jumbotron bg-dark text-white pt-3 rounded-top  pb-3">
                <div class="jumbotron bg-dark text-white pt-3 rounded-top mt-1 pb-3">
                    <h1 class=" text-center bg-dark   text-white pt-3 pb-3 websiteName "><i
                            class="fa-solid fa-blog"></i> {{$blog->name}} módosítása <i
                            class="fa-solid fa-pen-to-square"></i> <span class="text-center">  @foreach($blog->getMedia('image') as $media)
                                <img class="rounded" src="{{$media->getUrl('thumb')}}" alt="">
                            @endforeach</span>
                </div>
                </h1>

            </div>
            <form action="{{ route('blogUpdate')}}" class="bg-dark text-white p-3" method="POST"
                  enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" id="id" value="{{$blog->id}}">
                <div class="form-group">
                    <label for="name">Név*</label>
                    <input type="text" class="form-control" name="name" id="name" value="{{$blog->name}}" required>
                </div>
                <div class="form-group">
                    <label for="title">Cím*</label>
                    <input type="text" class="form-control" name="title" id="title" value="{{$blog->title}}" required>
                </div>
                <div class="form-group">
                    <label for="subtitle">Alcím*</label>
                    <input type="text" class="form-control" name="subtitle" id="subtitle" value="{{$blog->subtitle}}"
                           required>
                </div>
                <div class="mb-3">
                    <label for="pictureLink" class="form-label">Adja meg a fájlt:</label>
                    <input class="form-control" type="file" id="pictureLink" name="pictureLink"
                           value="{{$blog->picture_link}}">
                </div>
                <div class="form-group">
                    <label for="description">Leírás</label>
                    <textarea class="form-control" name="description" id="description" placeholder="Írjon hozzá leírást"
                              rows="3"> {{$blog->description}}</textarea>
                </div>
                <div class="form-group">
                    <label for="content">Leírás</label>
                    <textarea class="form-control" name="content" id="content" placeholder="Írjon hozzá leírást"
                              rows="6"> {{$blog->description}}</textarea>
                </div>
                <div class="form-check mt-3">
                    <input type="checkbox" name="status" id="status" {{$blog->status ? 'checked' :''}}>
                    <label for="status">Aktív</label>
                </div>
                <div class="form-group mt-3 justify-content-between d-flex">
                    <a href="javascript:history.go(-1)" class="btn btn-warning"> <i class="fa-solid fa-arrow-left"></i>
                        Vissza</a>
                    <button type="submit" class="btn btn-success text-white" name="update"><i
                            class="fa-solid fa-floppy-disk"></i> MÓDOSÍT
                    </button>
                </div>
            </form>
        </div>

    </div>

@endsection
