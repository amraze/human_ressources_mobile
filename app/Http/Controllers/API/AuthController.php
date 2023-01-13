<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email'     => 'required|email',
            'password'  => 'required',
        ]);
        $user = User::where('email', $request['email'])->firstOrFail();
        if (!$user || !Hash::check($request['password'], $user->password))
            return response()->json(['message' => 'Wrong Input']);
        else {
            $token = $user->createToken('auth_token')->plainTextToken;
            $message = "Welcome Back !";
            $user->save();
            return response()->json(compact('message', 'user', 'token'));
        }
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response()->json(['message' => 'Logged Out']);
    }
}
