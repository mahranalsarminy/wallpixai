<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ItemController extends Controller
{
    public function show($id)
    {
        $item = Item::findOrFail($id);
        $comments = Comment::where('item_id', $id)->get();
        $similarContent = $this->getSimilarContent($item->title);

        return view('item.show', compact('item', 'comments', 'similarContent'));
    }

    private function getSimilarContent($query)
    {
        $apiKey = config('services.pexels.api_key');
        $similarContentCount = config('services.pexels.similar_content_count', 10);
        $response = Http::withHeaders([
            'Authorization' => $apiKey
        ])->get('https://api.pexels.com/v1/search', [
            'query' => $query,
            'per_page' => $similarContentCount,
        ]);

        return $response->json()['photos'] ?? [];
    }
}