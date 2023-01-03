<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller {
    public function usersList() {
        $users = User::with('role')->get();
        return view('user/users', ['users' => $users]);
    }
    public function userAdd() {
        if (! Gate::allows('superadmin' )) {
            abort(403);
        }
        $userRoles = UserRole::query();
        return view('user/new_user', [
            'userRoles' => $userRoles->get(),
           ]);
    }

    public function userSave(Request $request) {
        if (! Gate::allows('superadmin' )) {
            abort(403);
        }
        $request->validate([
            'firstName' => 'required',
            'lastName' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'userRole' => 'required',
            'employeeCategory' => 'required',
        ]);
        $firstName = $request->firstName;
        $lastName = $request->lastName;
        $email = $request->email;
        $password = Hash::make($request->password);
        $status = $request->status ? 1 : 0;
        $userRole = $request->userRole;

        $user = new User();
        $user->first_name = $firstName;
        $user->last_name = $lastName;
        $user->email = $email;
        $user->password = $password;
        $user->status = $status;
        $user->user_role_id = $userRole;
        $user->save();
        return redirect('/users');
    }

    public function userEditById($id) {
        if (! Gate::allows('superadmin' )) {
            abort(403);
        }
        $user = User::where('id', '=', $id)->first();
        $userRoles = UserRole::get();
        return view('user/edit_user', compact('user', 'userRoles', 'employeeCategories'));
    }

    public function userUpdate(Request $request) {
        if (! Gate::allows('superadmin' )) {
            abort(403);
        }
        $id = $request->id;
        $firstName = $request->firstName;
        $lastName = $request->lastName;
        $email = $request->email;
        $password = Hash::make($request->password);
        $status = $request->status ? 1 : 0;
        $userRoleId = $request->userRole;


        User::where('id', '=', $id)->update([
            'first_name' => $firstName,
            'last_name' => $lastName,
            'email' => $email,
            'password' => $password,
            'status' => $status,
            'user_role_id' => $userRoleId,

        ]);
        return redirect('/users');
    }

    public function userDeleteById($id) {
        if (! Gate::allows('superadmin' )) {
            abort(403);
        }
        $user = User::where('id', '=', $id)->first();
        return view('user/delete_user', compact('user'));
    }

    public function userDelete(User $user) {
        if (! Gate::allows('superadmin' )) {
            abort(403);
        }
        $user->delete();
        return redirect('/users');
    }

}
