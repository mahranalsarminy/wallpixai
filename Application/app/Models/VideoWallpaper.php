<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VideoWallpaper extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'path',
    ];
}