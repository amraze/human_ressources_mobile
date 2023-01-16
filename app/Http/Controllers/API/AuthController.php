<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //Ce Auth Controller permer de controller le processus d'authentification d'un user par generation de token 
    //
    public function login(Request $request)
    {
        $request->validate([
            'email'     => 'required|email',//lors de la login le champ d'input d'adresse mail doit etre de format mail sinon un message sera affiché
            'password'  => 'required',
        ]);
        $user = User::where('email', $request['email'])->firstOrFail();
        if (!$user || !Hash::check($request['password'], $user->password))//si le mdp saisie n'est pas correct 
            return response()->json(['message' => 'Wrong Input']);//si auth failed alors affiché ce message 
        else {
            $token = $user->createToken('auth_token')->plainTextToken;//si auth succeded alors generation de token 
            $message = "Welcome Back !";
            $user->save();
            return response()->json(compact('message', 'user', 'token'));
        }
    }

    public function logout()
    //le logout consiste tout simplement a supprimer le token
    {
        auth()->user()->tokens()->delete();
        return response()->json(['message' => 'Logged Out']);
    }
}
