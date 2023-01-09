<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    // Index
    public function index()
    {
        $projects = Project::all();
        return response()->json($projects);
    }
    // View
    public function view($id)
    {
        $project = Project::find($id);
        return response()->json($project);
    }
    // Store
    public function store(Request $request)
    {
        $request->validate([
            'leader_id'     => 'required',
            'name'          => 'required',
            'description'   => '',
            'start_date'    => 'required',
            'end_date'      => '',
            'deadline'      => 'required',
            'category'      => 'required',
        ]);
        $project = Project::create([
            'leader_id'         => $request->leader_id,
            'name'              => $request->name,
            'description'       => $request->description ?? Null,
            'is_available'      => $request->is_available,
            'start_date'           => $request->start_date,
            'end_date'           => $request->end_date ?? Null,
            'deadline'           => $request->deadline,
            'category'           => $request->category,
        ]);
        $user = User::find($request->user_id);
        $project->users()->attach($user);
        $project->users;

        return (response()->json($project));
    }
    // Update
    public function update(Request $request, $id)
    {
        $project = Project::find($id);
        if (request('description')) {
            $description = request('description');
        }
        if (request('end_date')) {
            $end_date = request('end_date');
        }
        $project->update([
            'leader_id'         => $request->leader_id,
            'name'              => $request->name,
            'description'       => $description ?? $project->description,
            'is_available'      => $request->is_available,
            'start_date'        => $request->start_date,
            'end_date'          => $end_date ?? $project->end_date,
            'deadline'           => $request->deadline,
            'category'           => $request->category,
        ]);
        $project->users()->detach();
        $user = User::find($request->user_id);
        $project->users()->attach($user);
        $project->users;

        return (response()->json($project));
    }
    // Destroy
    public function destroy($id)
    {
        $project = Project::find($id);
        $project->delete();
    }
}
