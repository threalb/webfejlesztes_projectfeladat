@extends('layout')
@section('content')
    <div class="container mt-1 ">
        <div class="bg-dark text-white border border-dark rounded">
            <div class="jumbotron   pt-3 pb-3 border-bottom ">
                <h1 class=" text-center    websiteName "><i class="fa-solid fa-users"></i> Képváltók listázása <i
                        class="fa-solid fa-users"></i></h1>
            </div>
            @if(count($products)==0)
                <div class="alert alert-danger text-center m-3" role="alert">Sajnálom, egyenlőre nincs egy terméke sem amit listázni tudnék!
                </div>
            @else
            <table class="table table-dark table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Név</th>
                    <th>Kategória</th>
                    <th>Méret</th>
                    <th>mennyiség</th>
                    <th>Státusz</th>
                    <th class="text-center">Kép</th>
                    <th class="text-center">Műveletek</th>

                </tr>
                </thead>
                <tbody>
                @php
                    $i=1;
                @endphp
                @foreach($products as $product)
                    <tr class="align-middle">
                        <td>{{$i++}}</td>
                        <td>{{$product->name}}</td>
                        <td>{{$product->role->name}}</td>
                        <td>{{$product->size }}</td>
                        <td>{{$product->quantity }}</td>
                        <td>{{$product->status ? 'Aktív' : 'Inaktív'}}</td>
                        <td class="text-center">
                            @foreach($product->getMedia('image') as $media)
                                <img class="rounded" src="{{$media->getUrl('thumb')}}" alt="">
                            @endforeach
                        </td>

                        <td  class="text-center">
                            <a class="btn btn-warning" href="{{route('productEditById',$product->id)}}"> <i
                                    class="fa-solid fa-edit"></i>
                                Módosít</a>
                            <a class='btn btn-danger' href="{{route('productDeleteById',$product->id)}}"> <i
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
                    <th>Kategória</th>
                    <th>Méret</th>
                    <th>mennyiség</th>
                    <th>Státusz</th>
                    <th class="text-center">Kép</th>
                    <th class="text-center">Műveletek</th>
                </tfoot>
            </table>
            @endif
        </div>
    </div>

@endsection

