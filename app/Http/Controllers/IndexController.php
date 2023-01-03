<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\Product;
use App\Models\Slider;
use App\Models\CompanyData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class IndexController extends Controller {
    public function index() {
        $sliders =Slider::all();
        $products=Product::all();
        $blogs=Blog::all();
        $companyDatas=CompanyData::all();
        return view('home',compact('sliders','products','blogs','companyDatas'));
    }
}
