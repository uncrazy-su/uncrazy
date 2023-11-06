<?php

namespace App\Http\Controllers;

use App\Models\Note;
use Illuminate\Http\Request;

class NoteController extends Controller
{
    public function create(Request $request){
        $user_id= auth()->user()->id;
        $note = Note::create([
            'user_id'=>$user_id,
            'title'=> $request['title'],
            'description'=> $request['description'],
        ]);
        return response(
            $note, 200
        );
    }

    public function index(){
        $notes = auth()->user()->notes;
        return response(
            $notes,200
        );
    }
}
