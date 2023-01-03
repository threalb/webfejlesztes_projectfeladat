<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller {
    public function showLogin() {
        return view('login');
    }

    public function login(LoginRequest $credentials) {
        if (Auth::attempt(['email' => $credentials->email, 'password' => $credentials->password])) {
            return redirect('dashboard');
        }
        return redirect('login')->with('failed', 'Hibás felhasználónév, vagy jelszó.');;

    }

    public function logout() {
        Auth::logout();
        return redirect('/ ');
    }

}
