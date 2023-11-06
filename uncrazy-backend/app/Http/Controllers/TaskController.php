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
            'title'=> $request['title'],
            'description'=> $request['description'],
            'date'=> $request['date'],
            'time'=> $request['time'],
            'reminder'=> $request['reminder'],
            'tag'=> $request['tag'],
            'status'=>0
        ]);
        return response(
            $task, 200
        );
    }

    public function index(){
        $tasks = auth()->user()->tasks;
        return response(
            $tasks, 200
        );
    }
}
