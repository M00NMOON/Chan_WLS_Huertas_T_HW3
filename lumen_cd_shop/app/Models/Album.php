<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Album extends Model
{
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'genre',
        'release_date',
        'description',
        'image_file',
        'image_alt',
        'singer_id'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
