<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request){
        $attrs = $request->validate([
            'email'=>'required',
            'password'=>'required'
        ]);
        if(!Auth::attempt()){
            return response([
                'message'=>'invalid credentials'
            ]);
        }
        $user = auth()->user();
        $user['token']=auth()->user()->createToken('secret')->plainTextToken;

        return response(
            $user, 200
        );
    }

    public function signup(Request $request){
        $attrs = $request->validate([
            'email'=>'required',
            'password'=>'required'
        ]);
        $user = User::create([
            'name'=> $request['name'],
            'email'=> $attrs['email'],
            'password'=> bcrypt(($attrs['password']))
        ]);
        $user['token']=auth()->user()->createToken('secret')->plainTextToken;

        return response(
            $user, 200
        );
    }
}
