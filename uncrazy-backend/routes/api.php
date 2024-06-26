<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\NoteController;
use App\Http\Controllers\TaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/login', [AuthController::class, 'login']);
Route::post('/signup', [AuthController::class, 'signup']);

Route::group(['middleware'=>['auth:sanctum']], function(){
    Route::get('/user', [AuthController::class, 'user']);
    Route::put('/user', [AuthController::class, 'update']);
    Route::post('/logout', [AuthController::class, 'logout']);
    
    Route::post('/tasks', [TaskController::class,'indexByDate']);
    Route::post('/tasks/overdue', [TaskController::class,'indexOverdue']);
    Route::post('/tasks/create', [TaskController::class, 'create']);
    Route::get('/tasks/{id}', [TaskController::class, 'show']);
    Route::put('/tasks/{id}', [TaskController::class, 'update']);
    Route::delete('/tasks/{id}', [TaskController::class, 'delete']);
    Route::post('/tasks/search', [TaskController::class, 'search']);
    
    Route::get('/notes', [NoteController::class,'index']);
    Route::post('/notes', [NoteController::class, 'create']);
    Route::get('/notes/{id}', [NoteController::class, 'show']);
    Route::put('/notes/{id}', [NoteController::class, 'update']);
    Route::delete('/notes/{id}', [NoteController::class, 'delete']);
    Route::post('/notes/search', [NoteController::class, 'search']);

    
});