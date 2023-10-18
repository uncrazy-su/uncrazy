<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'name',
        'date',
        'time',
        'description',
        'image',
        'tag'
    ];

    public function users(){
        return $this->belongsToMany(User::class);
    }

}
