<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\CategoryMedia;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        return view('admin.categories.index', compact('categories'));
    }

    public function create()
    {
        return view('admin.categories.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        Category::create($request->all());

        return redirect()->route('admin.categories.index')->with('success', 'Category created successfully.');
    }

    public function show(Category $category)
    {
        return view('admin.categories.show', compact('category'));
    }

    public function uploadMedia(Request $request, Category $category)
    {
        $request->validate([
            'media.*' => 'required|mimes:jpeg,png,jpg,gif,svg,mp4,avi,mov|max:20480',
        ]);

        foreach ($request->file('media') as $file) {
            $path = $file->store('category_media');
            CategoryMedia::create([
                'category_id' => $category->id,
                'media_type' => $file->getClientMimeType(),
                'media_path' => $path,
            ]);
        }

        return redirect()->route('admin.categories.show', $category->id)->with('success', 'Media uploaded successfully.');
    }
}