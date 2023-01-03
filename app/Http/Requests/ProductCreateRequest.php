<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'name'=>'required',
            'product_type_id'=>'required',
            'quantity'=>'required'

        ];
    }
    public function messages() {
        return [
            'name.required'=>'Az név mező kitöltése kötelező!',
            'email.email'=>'Hibás email formátum!',
            'quantity.required'=>'Darabszám megadása kötelező!'

        ];
    }
}
