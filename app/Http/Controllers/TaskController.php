<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    // Index
    public function index()
    {
        $tasks = Task::all();
        return response()->json($tasks);
    }
    public function view($id)
    {
        $task = Task::find($id);
        return response()->json($task);
    }
    // Add
    public function store(Request $request)
    {
        $request->validate([
            'user_id'     => 'required',
            'project_id'  => 'required',
            'name'        =>  'required',
            'description'  => 'required',
            'leader_grade' => 'required',
            'date_grade'   => 'required',
            'start_date'   => '',
            'end_date'     => '',
            'deadline'     => 'required',
        ]);
        $task = Task::create([
            'user_id'         => $request->user_id,
            'project_id'      => $request->project_id,
            'name'            => $request->name ,
            'description'     => $request->description,
            'leader_grade'    => $request->leader_grade,
            'date_grade'      => $request->date_grade ,
            'start_date'      => $request->start_date ?? Null,
            'end_date'        => $request->end_date ?? Null,
            'deadline'        => $request->deadline,
        ]);

        return (response()->json($task));
    }
    // Edit
    public function update(Request $request, $id)
    {
        $task = Task::find($id);
        $task->update([
            'user_id'         => $request->user_id,
            'project_id'              => $request->project_id,
            'name'       => $name ?? $task->name,
            'description'      => $request->description,
            'leader_grade'        => $request->leader_grade,
            'date_grade'          => $end_date ?? $task->date_grade,
            'start_date'           => $request->start_date,
            'end_date'           => $request->end_date,
            'deadline'           => $request->deadline,
        ]);

        return (response()->json($task));
    }
    // Destroy
    public function destroy($id)
    {
        $task = task::find($id);
        $task->delete();
    }
}
