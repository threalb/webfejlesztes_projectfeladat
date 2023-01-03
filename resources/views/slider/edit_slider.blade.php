@extends('layout')
@section('content')
    <div class="container mt-1  d-flex justify-content-center">
        <div class="col-sm-6 border border-dark rounded ">
            <div class="jumbotron bg-dark text-white pt-3 rounded-top  pb-3">
                <div class="jumbotron bg-dark text-white pt-3 rounded-top mt-1 pb-3">
                    <h1 class=" text-center bg-dark   text-white pt-3 pb-3 websiteName "><i class="fa-solid fa-screwdriver-wrench"></i> {{$slider->name}} módisítása <i class="fa-solid fa-file-image"></i></h1>
                </div>
            </div>
            <form action="{{ route('sliderUpdate')}}" class="bg-dark text-white p-3" method="POST"  enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" id="id" value="{{$slider->id}}">
                <div class="form-group">
                    <label for="name">Név*</label>
                    <input type="text" class="form-control" name="name" id="name"  value="{{$slider->name}}" required>
                </div>
                <div class="form-group">
                    <label for="title">Cím*</label>
                    <input type="text" class="form-control" name="title" id="title" value="{{$slider->title}}" required>
                </div>
                <div class="mb-3">
                    <label for="pictureLink" class="form-label">Adja meg a fájlt:</label>
                    <input class="form-control" type="file" id="pictureLink" name="pictureLink" value="{{$slider->picture_link}}">
                </div>
                <div class="form-group">
                    <label for="description">Leírás</label>
                    <textarea class="form-control" name="description" id="description" placeholder="Írjon hozzá leírást"
                              rows="3"> {{$slider->description}}</textarea>
                </div>
                             <div class="form-check mt-3">
                    <input type="checkbox" name="status" id="status" {{$slider->status ? 'checked' :''}}>
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
