<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;
use App\Models\User;
use Faker\Core\Number;

class UserController extends Controller
{
    // Index
    public function index()
    {
        $users = User::all();
        return response()->json($users);
    }
    // View
    public function view($id)
    {
        $user = User::find($id);
        return response()->json($user);
    }
    // Store
    public function store(Request $request)
    {
        $request->validate([
            'first_name'        => 'required',
            'last_name'         => 'required',
            'age'               => 'required',
            'is_available'      => 'required',
            'position'           => 'required',
            'overall_performance' => '',
            'image'             => '',
            'email'              => 'email',
            'password'  => 'required',
        ]);
        if (request('image')) {
            $imagePath = request('image')->store('uploads');
        }
        $user = User::create([
            'first_name'        => $request->first_name,
            'last_name'         => $request->last_name,
            'age'               => $request->age,
            'is_available'      => $request->is_available,
            'position'           => $request->position,
            'overall_performance' => $request->overall_performance ?? 0,
            'image'             => $imagePath ?? Null,
            'email'              => $request->email,
            'password'  => bcrypt($request->password),
        ]);
        $user->createToken('auth_token')->plainTextToken;

        return (response()->json($user));
    }
    // Update
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if (request('image')) {
            $imagePath = request('image')->store('uploads');
        }
        if (request('password')) {
            $password = bcrypt($request->password);
        }
        $user->update([
            'first_name'      => $request->first_name,
            'last_name'     => $request->last_name,
            'age'     => $request->age,
            'is_available'  => $request->is_available,
            'position'  => $request->position,
            'overall_performance'  => $request->overall_performance ?? $user->performance,
            'email'  => $user->email,
            'image'     => $imagePath ?? $user->image,
            'password'  => $password ?? $user->password,

        ]);

        return (response()->json($user));
    }
    // Destroy
    public function destroy($id)
    {
        $user = User::find($id);
        $user->delete();
    }
}
