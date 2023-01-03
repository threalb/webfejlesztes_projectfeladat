<?php

namespace App\Http\Controllers;

use App\Models\UserRole;
use Illuminate\Http\Request;

class UserRoleController extends Controller
{
    public function showUserRoles(){
        $userRoles=UserRole::all();
        return view('user.user_roles',compact('userRoles'));
    }
}
