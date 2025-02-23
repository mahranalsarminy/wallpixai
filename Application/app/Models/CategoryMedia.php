<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryMedia extends Model
{
    use HasFactory;

    protected $fillable = ['category_id', 'media_type', 'media_path'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}