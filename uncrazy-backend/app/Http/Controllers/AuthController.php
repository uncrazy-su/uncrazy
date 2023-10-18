<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request){
        $attrs = $request->validate([
            'phone_no'=>'required_without:email',
            'email'=>'required_without:phone_no',
            'password'=>'required'
        ]);
        
        if(!Auth::attempt($attrs)){
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
            'phone_no'=>'required_without:email|unique:users,phone_no',
            'email'=>'required_without:phone_no|unique:users,email',
            'password'=>'required'
        ]);

        $user = User::create([
            'name'=> $request['name'],
            'email'=> $attrs['email'] ?? null,
            'phone_no'=>$attrs['phone_no'] ?? null,
            'password'=> bcrypt(($request['password']))
        ]);
        
        $user['token']=$user->createToken('secret')->plainTextToken;

        return response(
            $user, 200
        );
    }
}
