<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\CompanyData;
use App\Models\Product;
use App\Models\Slider;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(){
        $sliders =Slider::all();
        $products=Product::all();
        $blogs=Blog::all();
        $companyDatas=CompanyData::all();
        return view('dashboard',compact('sliders','products','blogs','companyDatas'));

    }
}
