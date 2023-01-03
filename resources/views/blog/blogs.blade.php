@extends('layout')
@section('content')

    <div class="container mt-1 ">
        <div class="bg-dark text-white border border-dark rounded">
            <div class="jumbotron   pt-3 pb-3 border-bottom ">
                <h1 class=" text-center    websiteName "><i class="fa-solid fa-blog"></i> Blog bejegyzések listázása <i
                        class="fa-solid fa-blog"></i></h1>
            </div>
            @if(count($blogs)==0)
                <div class="alert alert-danger text-center m-3" role="alert">Sajnálom, egyenlőre nincs egy blog
                    bejegyzése sem amit listázni tudnék!
                </div>

            @else
                <form action="/blogs">
                    <div class="input-group p-2">
                        <input type="text" class="form-control" name="search" placeholder="Keresés:"
                               aria-label="Keressen" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit">Keresés</button>
                        </div>
                    </div>

                </form>
                <table class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Név</th>
                        <th>Cím</th>
                        <th>Alcím</th>

                        <th>Státusz</th>
                        <th class="text-center">Kép</th>
                        <th class="text-center">Műveletek</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php
                        $i=1;
                    @endphp
                    @foreach($blogs as $blog)
                        <tr class="align-middle">
                            <td>{{$i++}}</td>
                            <td>{{$blog->name}}</td>
                            <td>{{$blog->title}}</td>
                            <td>{{$blog->subtitle}}</td>
                            <td>{{$blog->status ? 'Aktív' : 'Inaktív'}}</td>
                            <td class="text-center">
                                @foreach($blog->getMedia('image') as $media)
                                    <img class="rounded" src="{{$media->getUrl('thumb')}}" alt="">
                                @endforeach
                            </td>

                            <td class="text-center">
                                <a class="btn btn-warning" href="{{route('blogEditById',$blog->id)}}"> <i
                                        class="fa-solid fa-edit"></i>
                                    Módosít</a>
                                <a class='btn btn-danger' href="{{route('blogDeleteById',$blog->id)}}"> <i
                                        class="fa-solid fa-trash"></i>
                                    Töröl</a>
                            </td>

                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot class="pb-2">
                    <tr>
                        <th>#</th>
                        <th>Név</th>
                        <th>Cím</th>
                        <th>Alcím</th>
                        <th>Státusz</th>
                        <th class="text-center">Kép</th>
                        <th class="text-center">Műveletek</th>
                    </tfoot>
                </table>

            @endif

        </div>
    </div>

@endsection

