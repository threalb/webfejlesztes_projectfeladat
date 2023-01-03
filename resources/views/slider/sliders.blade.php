@extends('layout')
@section('content')

    <div class="container mt-1 ">
        <div class="bg-dark text-white border border-dark rounded">
            <div class="jumbotron   pt-3 pb-3 border-bottom ">
                <h1 class=" text-center    websiteName "><i class="fa-solid fa-images"></i> Képváltók listázása <i
                        class="fa-solid fa-list"></i></h1>
            </div>
            <table class="table table-dark table-striped   ">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Név</th>
                    <th>Cím</th>
                    <th>Státusz</th>
                    <th class="text-center">Kép</th>
                    <th class="text-center">Műveletek</th>

                </tr>
                </thead>
                <tbody>
                @php
                    $i=1;
                @endphp
                @foreach($sliders as $slider)
                    <tr class="align-middle">
                        <td>{{$i++}}</td>
                        <td>{{$slider->name}}</td>
                        <td>{{$slider->title }}</td>
                        <td>{{$slider->status ? 'Aktív' : 'Inaktív'}}</td>
                        <td class="text-center">
                            @foreach($slider->getMedia('image') as $media)
                                <img class="rounded" src="{{$media->getUrl('thumb')}}" alt="">
                            @endforeach
                        </td>
                        <td  class="text-center">
                            @if(Auth::user()->user_role_id==1 || Auth::user()->user_role_id==2  )
                                <a class="btn btn-warning" href="{{route('sliderEditById',$slider->id)}}"> <i
                                        class="fa-solid fa-edit"></i>
                                    Módosít</a>
                                <a class='btn btn-danger' href="{{route('sliderDeleteById',$slider->id)}}"> <i
                                        class="fa-solid fa-trash"></i>
                                    Töröl</a>
                            @endif
                        </td>


                    </tr>
                @endforeach
                </tbody>
                <tfoot class="pb-2">
                <tr>
                    <th>#</th>
                    <th>Név</th>
                    <th>Cím</th>
                    <th>Státusz</th>
                    <th class="text-center">Kép</th>
                    <th  class="text-center">Műveletek</th>
                </tfoot>
            </table>
        </div>
    </div>

@endsection
