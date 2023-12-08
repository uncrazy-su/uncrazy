<?php

namespace App\Http\Controllers;

use App\Models\Note;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

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
        foreach($notes as $note){
            $note['description']=Str::limit($note['description'],20);
        }
        return response(
            $notes,200
        );
    }

    public function show($id){
        $note = Note::find($id);
        return response(
            $note, 200
        );
    } 

    public function update(Request $request, $id){
        $note = Note::find($id);
            $note->update([
                'title'=> $request['title'],
                'description'=> $request['description']
            ]);
        return response(
            $note, 200
        );
    }

    public function delete($id){
        $note=Note::find($id);
        $note->delete();
        return response([
            'message'=>'Note has been deleted'
        ], 200);
    }

    public function search(Request $request){
        $note = Note::where('user_id', auth()->user()->id)->where('title','LIKE', '%'.$request['title']. '%')->get();//->whereLike('title', $request['title'])->values();
        return response(
            $note, 200
        );
    }

}
