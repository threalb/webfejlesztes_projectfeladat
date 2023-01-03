<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;

class BlogController extends Controller {
    public function blogsList() {
        $blogs = Blog::all();
        return view('blog.blogs', compact('blogs'));
    }

    public function blogAdd() {
        return view('blog.new_blog');
    }

    public function blogSave(Request $request, Blog $blog) {
        $name = $request->input('name', '');
        $title = $request->input('subtitle');
        $subtitle = $request->input('title');
        $description = $request->input('description');
        $content = $request->input('content');
        $status = $request->input('status') ? 1 : 0;
        if ($request->hasFile('pictureLink') && $request->file('pictureLink')->isValid()) {
            $blog->addMedia($request->file('pictureLink'))->toMediaCollection('image');
        }
        $blog->name = $name;
        $blog->title = $title;
        $blog->subtitle = $subtitle;
        $blog->description = $description;
        $blog->content = $content;
        $blog->status = $status;
        $blog->save();
        return redirect('/blogs');
    }

    public function blogEdit($id) {
        $blog = Blog::where('id', '=', $id)->first();
        return view('blog.edit_blog', compact('blog'));
    }

    public function blogUpdate(Request $request) {
        $id = $request->id;
        $name = $request->input('name');
        $title = $request->input('title');
        $subtitle = $request->input('subtitle');
        $description = $request->input('description');
        $content = $request->input('content');
        $status = $request->input('status') ? 1 : 0;
        $product = Blog::where('id', '=', $id)->get()->first();
        Blog::where('id', '=', $id)
            ->update([
                'name' => $name,
                'title' => $title,
                'subtitle' => $subtitle,
                'description' => $description,
                'content' => $content,
                'status' => $status,
            ]);
        if ($request->hasFile('pictureLink') && $request->file('pictureLink')->isValid()) {
            $product->clearMediaCollection('image');
            $product->addMedia($request->file('pictureLink'))->toMediaCollection('image');
        }
        return redirect('/blogs');
    }

    public function blogDeleteById($id) {
        $blog = Blog::where('id', '=', $id)->first();
        return view('blog.delete_blog', compact('blog'));
    }
    public function blogDelete(Blog $blog) {
        $blog->delete();
        return redirect('/blogs');
    }

    public function showBlogByIdOnPublic(Blog $blog) {
        $blog::all();
        return view('blog.show_blog_on_public', compact('blog'));
    }
}
