<?php

namespace App\Http\Controllers;

use App\Models\Media;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function index(Request $request)
    {
        $query = Media::query();

        if ($request->filled('category')) {
            $query->where('category_id', $request->category);
        }

        if ($request->filled('date')) {
            $query->whereDate('created_at', $request->date);
        }

        if ($request->filled('rating')) {
            $query->whereHas('ratings', function ($q) use ($request) {
                $q->havingRaw('AVG(rating) >= ?', [$request->rating]);
            });
        }

        if ($request->filled('type')) {
            $query->where('type', $request->type);
        }

        $media = $query->latest()->paginate(10);

        return view('search.index', compact('media'));
    }
}