<?php

namespace App\Http\Controllers;

use App\Models\Note;
use Illuminate\Http\Request;

class NoteController extends Controller
{
    public function create(Request $request){
        $table->integer('user_id');
        $table->string('title');
        $table->string('description');
    $note = Note::create([
            'user_id'=>$user_id,
            'title'=> $request['title'],
            'description'=> $request['description'],
        ]);
        return response(
            $note, 200
        );
    }
}
