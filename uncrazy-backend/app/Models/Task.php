<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'title',
        'date',
        'time',
        'description',
        'reminder',
        'tag',
        'status'
    ];

    public function users(){
        return $this->belongsToMany(User::class);
    }

}
