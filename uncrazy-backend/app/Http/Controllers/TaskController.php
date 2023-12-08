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

    public function indexByDate(Request $request){
        $tasks = auth()->user()->tasks->where('date', '=', $request['date'])->sortBy('time')->sortBy('status')->values();
        return response(
            $tasks, 200
        );
    }

    public function indexOverdue(Request $request){
        $tasks = auth()->user()->tasks->where('date', '<', $request['date'])->where('status', 0)->sortBy('time')->sortBy('status')->values();
        return response(
            $tasks, 200
        );
    }

    public function indexByTag(Request $request){
        $tasks = auth()->user()->tasks->where('date', '=', $request['date'])->where('tag','=', $request['tag'])->sortBy('time')->sortBy('status')->values();
        return response(
            $tasks, 200
        );
    }

    public function search(Request $request){
        $tasks = Task::where('user_id', auth()->user()->id)->where('title','LIKE', '%'.$request['title']. '%')->get();//->whereLike('title', $request['title'])->values();
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
        if($request->has('status')){
            $task->update([
                'status' => $request['status']
            ]);
        }
        else if($request->has('title')){
            $task->update([
                'title'=> $request['title'],
                'description'=> $request['description'],
                'date'=> $request['date'],
                'time'=> $request['time'],
                'repetition'=> $request['repetition'],
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
