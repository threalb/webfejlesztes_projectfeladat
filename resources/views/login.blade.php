@extends('layout')
@section('content')
    <section class="h-100 gradient-form mt-5" >
        <div class="container py-2 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-10 ">
                    <div class="card rounded-3 text-black">
                        <div class="row g-0">
                            <div class="col-lg-6 sha">
                                <div class="card-body p-md-5 mx-md-4">

                                    <div class="text-center">

                                            <img src="/images/publicPage/didus_logo.svg" class="loginLogo" alt="asd">

                                        <h2 class="mt-3 mb-3 pb-1"><span class="websiteName">We are Handmade</span> !
                                        </h2>
                                    </div>

                                    <form action="/login" method="POST">
                                        @csrf
                                        <p class="text-sm-center h5">Jelentkezz be az adminfelület eléréséhez!</p>
                                        @if(session('failed'))
                                        <div class="alert alert-danger " role="alert">
                                            {{session('failed')}}
                                        </div>
                                        @endif
                                        <div class="form-outline ">
                                            <label class="form-label h5" for="email">Email</label>
                                            <input type="email" id="email" name="email" class="form-control"
                                                   placeholder="Adja meg az e-mail címét.">
                                            <p class="text-danger"> @error('email')
                                                {{$message}}
                                                @enderror</p>
                                        </div>

                                        <div class="form-outline">
                                            <label class="form-label h5" for="password">Jelszó</label>
                                            <input type="password" id="password" name="password" placeholder="Adja meg az e-mailhez tarozó jelszavát." class="form-control">
                                            <p class="text-danger">  @error('password')
                                                {{$message}}
                                                @enderror</p>
                                        </div>

                                        <div class="text-center pt-1 mb-5 pb-1">
                                            <button class="btn btn-primary  fa-lg gradient-custom-2 mb-3 p-3"
                                                    type="submit">Bejelentkezés
                                            </button>

                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                <div class=" px-3 py-4 p-md-5 mx-md-4">
                                    <h4 class="mb-4 text-center">Üdvözöllek <br><span
                                            class="websiteName">DIDUS Handmade</span><br> oldalán!</h4>
                                    <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
                                        do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection
