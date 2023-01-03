<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductType;


use Illuminate\Http\Request;

class ProductController extends Controller {
    public function productsList() {
        $products = Product::all();
        return view('product.products', ['products' => $products]);
    }

    public function productAdd() {
        $productTypes = ProductType::all();
        return view('product.new_product', ['productTypes' => $productTypes]);
    }

    public function productSave(Request $request, Product $product) {
        $name = $request->input('name');
        $size = $request->input('size');
        $productTypeId = $request->input('productTypeId');
        $quantity = $request->input('quantity');
        $description = $request->input('description');
        $status = $request->input('status') ? 1 : 0;

        if ($request->hasFile('pictureLink') && $request->file('pictureLink')->isValid()) {
            $product->addMedia($request->file('pictureLink'))->toMediaCollection('image');
        } else {
          echo'<div class="alert alert-danger" role="alert">Hiba a kép feltöltése során!</div>';
        }
        $product->name = $name;
        $product->size = $size;
        $product->product_type_id = $productTypeId;
        $product->quantity = $quantity;
        $product->description = $description;
        $product->status = $status;
        $product->save();


        return redirect('/products');

    }

    public function productEdit($id) {
        $product = Product::where('id', '=', $id)->first();
        $productTypes = ProductType::all();
        return view('product.edit_product', compact('product', 'productTypes'));
    }

    public function productUpdate(Request $request) {
        $id = $request->id;
        $name = $request->name;
        $size = $request->size;
        $productTypeId = $request->productTypeId;
        $description = $request->description;
        $status = $request->status ? 1 : 0;
        $product = Product::where('id', '=', $id)->get()->first();

        Product::where('id', '=', $id)
            ->update([
                'name' => $name,
                'size' => $size,
                'product_type_id' => $productTypeId,
                'description' => $description,
                'status' => $status,

            ]);
        if ($request->hasFile('pictureLink') && $request->file('pictureLink')->isValid()) {
            $product->clearMediaCollection('image');
            $product->addMedia($request->file('pictureLink'))->toMediaCollection('image');

        }
        return redirect('/products');
    }

    public function productDeleteById($id) {
        $product = Product::where('id', '=', $id)->first();
        return view('product.delete_product', compact('product'));
    }
    public function productDelete(Product $product){
        $product->delete();
        return redirect('/products');
    }
}

