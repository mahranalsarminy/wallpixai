<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserFavoritesTables extends Migration
{
    public function up()
    {
        Schema::create('user_favorite_images', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('generated_image_id')->constrained('generated_images')->onDelete('cascade');
            $table->timestamps();
        });

        Schema::create('user_favorite_videos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('generated_video_id')->constrained('generated_videos')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('user_favorite_images');
        Schema::dropIfExists('user_favorite_videos');
    }
}