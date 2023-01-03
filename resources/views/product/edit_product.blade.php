@extends('layout')
@section('content')
    <div class="container mt-1  d-flex justify-content-center">
        <div class="col-sm-6 border border-dark rounded ">
            <div class="jumbotron bg-dark text-white pt-3 rounded-top  pb-3">
                <h2 class=" text-center bg-dark   text-white pt-3 pb-3 websiteName "><i
                        class="fa-solid fa-screwdriver-wrench"></i>{{$product->name}} nevű termék módosítása <i
                        class="fa-solid fa-gift"></i></h2>
            </div>
            <form action="{{route('productUpdate')}}" class="bg-dark text-white p-3" method="POST"
                  enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" id="id" value="{{$product->id}}">
                <div class="form-group">
                    <label for="name">Név*</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="Adja meg a termék nevét"
                           value="{{$product->name}}" required>
                </div>
                <div class="form-group">
                    <label for="size">Méret</label>
                    <input type="number" class="form-control" name="size" id="size"
                           placeholder="Adja meg a termék méretét" value="{{$product->size}}">
                </div>
                <div class="form-group">
                    <label for="productType">Típus*</label>
                    <select class="form-select" name="productTypeId" id="productTypeId">
                        @foreach($productTypes as $productType)
                            <option
                                value="{{$productType->id}}" {{ $productType->id == $product->product_type_id ? 'selected':''}}>{{$productType->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="quantity">Mennyiség*</label>
                    <input type="number" class="form-control" name="quantity" id="quantity"
                           placeholder="Adja meg a termék dararbszámát" value="{{$product->quantity}}">
                </div>
                <div class="form-group">
                    <label for="description">Leírás</label>
                    <textarea class="form-control" name="description" id="description" placeholder="Írjon hozzá leírást"
                              rows="4"> {{$product->description}}</textarea>
                </div>
                <div class="mb-3">
                    <label for="pictureLink" class="form-label">Adja meg a fájlt:</label>
                    <input class="form-control" type="file" id="pictureLink" name="pictureLink">
                </div>
                <div class="form-check mt-3">
                    <input type="checkbox" name="status" id="status" value="1" checked>
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
