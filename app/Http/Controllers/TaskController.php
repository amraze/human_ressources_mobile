<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
//Ce controller contient les fonctions CRUD de la table taks .
{
    // View all tasks grace a la fonction index .
    public function index()
    {
        $tasks = Task::all();//derriere ca il y a une requete qui fetch tous les task dans le varible tasks
        return response()->json($tasks);// la reponse est une format json de tous les tasks .le format Json sera consommé en frontend pour faire les traitements voulus .
    }
    // View one task selon l'ID .
    public function view($id)
    {
        $task = Task::find($id);
        return response()->json($task);
    }
    // Add one task grace a la fonction store .
    public function store(Request $request)
    {
        $request->validate([//on definit les champs necessaires a remplir .
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
        $task = Task::create([//cration d'une instance de la classe Task dont les informations issues du formulaire d'ajout task dans le frontend .
            'user_id'         => $request->user_id,
            'project_id'      => $request->project_id,
            'name'            => $request->name,
            'description'     => $request->description,
            'leader_grade'    => $request->leader_grade,
            'date_grade'      => $request->date_grade,
            'start_date'      => $request->start_date ?? Null,
            'end_date'        => $request->end_date ?? Null,
            'deadline'        => $request->deadline,
        ]);

        return (response()->json($task));
    }
    // Edit one task
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
    // Delete one task
    public function destroy($id)
    {
        $task = task::find($id);
        $task->delete();
    }
}

