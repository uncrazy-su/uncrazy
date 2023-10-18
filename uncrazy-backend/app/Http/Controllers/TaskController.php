<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function create(Request $request){
        $user_id= auth()->user()->id;
        $task = Task::create([
            'user_id'=>$user_id,
            'name'=> $request['title'],
            'description'=> $request['description'],
            'date'=> $request['date'],
            'time'=> $request['time'],
            'image'=> $request['image'],
            'tag'=> $request['tag']
        ]);
        return response(
            $task, 200
        );
    }
}
