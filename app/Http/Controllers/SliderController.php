<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Slider;
use Illuminate\Support\Facades\Gate;
class SliderController extends Controller {
    public function slidersList() {
        $sliders = Slider::all();
        return view('slider/sliders', compact('sliders'));
    }

    public function sliderAdd() {
        if (! Gate::allows('superadmin' ) || Gate::allows('admin' )) {
            abort(403);
        }
        return view('slider/new_slider', [
        ]);
    }

    public function sliderSave(Request $request ) {
        if (! Gate::allows('superadmin' ) || Gate::allows('admin' )) {
            abort(403);
        }
        $slider = Slider::create($request->all());
        if ($request->hasFile('pictureLink') && $request->file('pictureLink')->isValid()) {
            $slider->addMedia($request->file('pictureLink'))->withResponsiveImages()->toMediaCollection('image');
        }
        return redirect('/sliders');
    }

    public function sliderEdit($id) {
        if (! Gate::allows('superadmin' ) || Gate::allows('admin' )) {
        abort(403);
    }
        $slider = Slider::where('id', '=', $id)->first();
        return view('slider/edit_slider', compact('slider'));

    }

    public function sliderUpdate(Request $request) {
        if (! Gate::allows('superadmin' ) || Gate::allows('admin' )) {
            abort(403);
        }
        $id = $request->input('id');
        $name = $request->input('name');
        $description = $request->input('description');
        $title = $request->input('title');
        $status = $request->input('status') ? 1 : 0;
        $slider = Slider::where('id', '=', $id)->get()->first();
        Slider::where('id', '=', $id)->update([
            'name' => $name,
            'description' => $description,
            'title' => $title,
            'status' => $status
        ]);
        if ($request->hasFile('pictureLink') && $request->file('pictureLink')->isValid()) {
            $slider->clearMediaCollection('image');
            $slider->addMedia($request->file('pictureLink'))->withResponsiveImages()->toMediaCollection('image');

        }
        return redirect('/sliders');
    }

    public function sliderDeleteById($id) {
        if (! Gate::allows('superadmin' ) || Gate::allows('admin' )) {
            abort(403);
        }
        $slider = Slider::where('id', '=', $id)->first();
        return view('slider/delete_slider', compact('slider'));
    }

    public function sliderDelete(Slider $slider) {
        if (! Gate::allows('superadmin' ) || Gate::allows('admin' )) {
            abort(403);
        }
        $slider->delete();
        return redirect('/sliders');
    }
}

