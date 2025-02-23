<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request, $id)
    {
        $request->validate([
            'comment' => 'required|string|max:1000',
        ]);

        Comment::create([
            'user_id' => auth()->id(),
            'item_id' => $id,
            'comment' => $request->comment,
        ]);

        return redirect()->route('item.show', $id)->with('success', 'Comment added successfully.');
    }
}