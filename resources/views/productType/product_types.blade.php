@extends('layout')
@section('content')

    <div class="container mt-1 ">
        <div class="bg-dark text-white border border-dark rounded">
            <div class="jumbotron   pt-3 pb-3 border-bottom ">
                <h1 class=" text-center    websiteName "><i class="fa-solid fa-users"></i> Képváltók listázása <i
                        class="fa-solid fa-users"></i></h1>
            </div>

            </form>
            <table class="table table-dark table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Név</th>

                    <th>Státusz</th>



                </tr>
                </thead>
                <tbody>
                @php
                    $i=1;
                @endphp
                @foreach($productTypes as $productType)
                    <tr class="align-middle">
                        <td>{{$i++}}</td>
                        <td>{{$productType->name}}</td>

                        <td>{{$productType->status ? 'Aktív' : 'Inaktív'}}</td>




                    </tr>
                @endforeach
                </tbody>
                <tfoot class="pb-2">
                <tr>
                    <th>#</th>
                    <th>Név</th>

                    <th>Státusz</th>

                </tfoot>
            </table>
        </div>
    </div>

@endsection

