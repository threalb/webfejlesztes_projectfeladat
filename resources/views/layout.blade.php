@php use Illuminate\Support\Facades\Auth; @endphp
    <!doctype html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Didus handmade</title>
    <style>
        body {
            background-image: url("/images/body_bg.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .shadowed {
            box-shadow: 5px 5px 10px black;
            border-radius: 3px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark d-flex  "
     aria-label="Tenth navbar example">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08"
                aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">
                        <img src="images/favicon-32x32.png" alt="logo" title="logo">
                        <span class="fst-italic fw-bold websiteName">DIDUS handmade</span>

                    </a>
                </li>
                 @auth()
                    <li class="nav-item text-white">
                        <a href="dashboard" class="nav-link"><i class="fa-solid fa-dashboard"></i> Vezérlőpult</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-images"></i> Képváltók
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="/sliders">
                                    <i class="fa-solid fa-list"></i> Képváltók listázása listázása
                                </a>
                            </li>
                            @if(Auth::user()->user_role_id==1 || Auth::user()->user_role_id==2  )
                            <li>
                                <a class="dropdown-item" href="sliderAdd">
                                    <i class="fa-solid fa-circle-plus"></i> Új képváltó feltöltése
                                </a>
                            </li>
                            @endif
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-gift"></i> Termékek
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="/products"></i><i class="fa-solid fa-list"></i> Termékek
                                    listázása</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/productAdd"><i class="fa-solid fa-circle-plus"></i> Új
                                    termék</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item text-white  dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <i class="fa-solid fa-blog"></i> Blog
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item " href="/blogs">
                                    <i class="fa-solid fa-list"></i> Blogok listázása
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="blogAdd">
                                    <i class="fa-solid fa-circle-plus"></i> Új blog
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false"><i
                                class="fa-solid fa-users"></i> Felhasználók</a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="/users">
                                    <i class="fa-solid fa-users"> </i> Felhasználók listázása
                                </a>
                            </li>
                            @if(Auth::user()->user_role_id==1)
                                <li>
                                    <a class="dropdown-item" href="/userAdd">
                                        <i class="fa-solid fa-user-plus"></i> Új felhasználó
                                    </a>
                                </li>
                            @endif
                            <li>
                                <a class="dropdown-item" href="{{route('userRoles')}}">
                                    <i class="fa-solid fa-shield-halved"></i> Felhasználói jogosultságok
                                </a>
                            </li>
                        </ul>
                    </li>

                   <li class="nav-item dropend border rounded ">
                        <a class="nav-link dropdown-toggle active" href="#" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <i class="fa-solid fa-user-tie"></i>
                            <span class="text-muted ">Bejelentkezve mint:</span>
                            {{Auth::user()->last_name}} {{Auth::user()->first_name}}
                        </a>
                        <ul class="dropdown-menu">
                            @auth
                                <li>
                                <a href="/logout" class="nav-link btn btn-danger text-white p-1 m-1">
                                    kijelentkezés
                                </a></li>

                            @endauth

                            @guest()  <li>
                                <a href="/login" class="nav-link btn btn-primary text-white p-1">bejelentkezés</a>
                                @endguest
                                </li>
                            <li></li>
                        </ul>
                    </li>
                @endauth
                @guest()
                    <li>
                        <a href="/login" class="nav-link websiteName   text-white " id="loginBtn"> Bejelentkezés</a>
                    </li>
                @endguest
            </ul>
        </div>
    </div>
</nav>
@yield('content')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
</body>
</html>
