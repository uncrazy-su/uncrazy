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

    public function index(Request $request, $id){
        $tasks = auth()->user()->tasks;
        return response(
            $tasks, 200
        );
    }

    public function show($id){
        $task = Task::find($id);
        return response(
            $task, 200
        );
    }

    public function update(Request $request, $id){
        $task = Task::find($id);
        if($request->has('project_status')){
            $task->update([
                'status' => $request['task_status']
            ]);
        }
        else if($request->has('project_name')){
            $task->update([
                'title'=> $request['title'],
                'description'=> $request['description'],
                'date'=> $request['date'],
                'time'=> $request['time'],
                'reminder'=> $request['reminder'],
                'tag'=> $request['tag']
            ]);
        }

        return response(
            $task, 200
        );
    }

    public function delete($id){
        $task=Task::find($id);
        $task->delete();
        return response([
            'message'=>'Task has been deleted'
        ], 200);
    }
}
