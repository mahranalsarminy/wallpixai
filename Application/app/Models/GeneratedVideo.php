<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneratedVideo extends Model
{
    use HasFactory;

    protected $fillable = [
        'prompt',
        'path',
    ];
}