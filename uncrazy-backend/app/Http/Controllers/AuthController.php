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
                'Invalid Credentials'
            ], 403);
        }
        //$user = auth()->user();
        $token = auth()->user()->createToken('secret')->plainTextToken;

        return response(
            $token, 200
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
        
        $token=$user->createToken('secret')->plainTextToken;

        return response(
            $token, 200
        );
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response([
            'logout'
        ], 200);
    }

    // get user detail
    public function user()
    {
        return response(
            auth()->user()
        , 200);
    }

    public function update(Request $request){
        $user = auth()->user();
        if($request->has('name')){
            $user->update([
                'name'=> $request['name'],
            ]);
        }
        else if($request->has('email')){
            $user->update([
                'email'=> $request['email']
            ]);
        }
        else if($request->has('phone_no')){
            $user->update([
                'phone_no'=> $request['phone_no']
            ]);
        }
        else if($request->has('image')){
            $image = $this->saveImage($request->image, 'profiles');
            $user->update([
                'image'=>$image
            ]);
        }
        else if($request->has('password')){
            $user->update([
                'password'=> bcrypt($request['password']),
            ]);
        }
        return response(
            auth()->user()
        , 200);
    }    
}
