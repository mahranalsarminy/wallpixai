<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MediaRating extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'media_id', 'rating'];
}