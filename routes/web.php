<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductTypeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\UserRoleController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[IndexController::class,'index']);
Route::get('/dashboard',[DashboardController::class,'index']);

Route::get('/login',[AuthController::class,'showLogin'])->name('login');
Route::post('/login',[AuthController::class,'login']);

Route::middleware('auth')->group(function(){
    Route::get('/logout',[AuthController::class,'logout']);

    /*****************************************************************************************/
    /****************************Felhasználók endpontok***************************************/
    /*****************************************************************************************/
    Route::get('/users',[UserController::class,'usersList']);
    Route::get('/userAdd',[UserController::class,'UserAdd']);
    Route::post('/userSave',[UserController::class,'userSave']);
    Route::get('/userEditById/{id}', [UserController::class,'userEditById']);
    Route::post('/userUpdate', [UserController::class,'userUpdate']);
    Route::get('/userDeleteById/{id}', [UserController::class,'userDeleteById']);
    Route::get('/userDelete/{user}',[UserController::class,'userDelete'])->name('userDelete');

    /*****************************************************************************************/
    /********************************Termék endpontok*****************************************/
    /*****************************************************************************************/
    Route::get('/products',[ProductController::class,'productsList']);
    Route::get ('/productAdd',[ProductController::class,'productAdd']);
    Route::post('/productSave',[ProductController::class,'productSave'])->name('productSave');
    Route::get('/productEdit/{id}',[ProductController::class,'productEdit'])->name('productEditById');
    Route::post('/productUpdate',[ProductController::class,'productUpdate'])->name('productUpdate');
    Route::get('/productDeleteById/{id}', [ProductController::class,'productDeleteById'])->name('productDeleteById');
    Route::get('/productDelete/{product}',[ProductController::class,'productDelete'])->name('productDelete');

    /*****************************************************************************************/
    /************************************Blog endpontok***************************************/
    /*****************************************************************************************/
    Route::get('/blogs',[BlogController::class,'blogsList']);
    Route::get('/blogAdd',[BlogController::class,'blogAdd']);
    Route::post('/blogSave',[BlogController::class,'blogSave'])->name('blogSave');
    Route::get('/blogEdit/{id}', [BlogController::class,'blogEdit'])->name('blogEditById');
    Route::post('/blogUpdate', [BlogController::class,'blogUpdate'])->name('blogUpdate');
    Route::get('/blogDeleteById/{id}', [BlogController::class,'blogDeleteById'])->name('blogDeleteById');
    Route::get('/blogDelete/{blog}',[BlogController::class,'blogDelete'])->name('blogDelete');

    /*****************************************************************************************/
    /**********************************Slider endpontok***************************************/
    /*****************************************************************************************/
    Route::get('/sliders',[SliderController::class,'slidersList']);
    Route::get('/sliderAdd',[SliderController::class,'sliderAdd']);
    Route::post('/sliderSave',[SliderController::class,'sliderSave']);
    Route::get('/sliderEdit/{id}', [SliderController::class,'sliderEdit'])->name('sliderEditById');
    Route::post('/sliderUpdate', [SliderController::class,'sliderUpdate'])->name('sliderUpdate');
    Route::get('/sliderDeleteById/{id}', [SliderController::class,'sliderDeleteById'])->name('sliderDeleteById');
    Route::get('/sliderDelete/{slider}',[SliderController::class,'sliderDelete'])->name('sliderDelete');

    /*****************************************************************************************/
    /*********************************Felhasználói jogosultság endpontok******************************/
    /*****************************************************************************************/
    Route::get('/userRoles',[UserRoleController::class,'showUserRoles'])->name('userRoles');
});
Route::get('showBlog/{blog}',[BlogController::class,'showBlogByIdOnPublic'])->name('showBlog');
