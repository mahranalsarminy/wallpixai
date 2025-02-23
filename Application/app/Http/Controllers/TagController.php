<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;

class TagController extends Controller
{
    public function index(Tag $tag)
    {
        $media = $tag->media()->latest()->paginate(10);
        return view('tags.index', compact('tag', 'media'));
    }
}