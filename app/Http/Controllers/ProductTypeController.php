<?php

namespace App\Http\Controllers;

use App\Models\ProductType;
use Illuminate\Http\Request;

class ProductTypeController extends Controller
{
    public function showProductTypes(){
        $productTypes=ProductType::all();
        return view('productType/product_types',compact('productTypes'));
    }
}
