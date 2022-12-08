<?php

namespace App\Http\Controllers;

use App\Models\Performance;
use Illuminate\Http\Request;

class PerformanceController extends Controller
{
    // Index
    public function index()
    {
        $performances = Performance::all();
        return response()->json($performances);
    }
    // View
    public function view($id)
    {
        $performance = Performance::find($id);
        return response()->json($performance);
    }
    // Store
    public function store(Request $request)
    {
        $request->validate([
            'user_id'     => 'required',
            'project_id'    => 'required',
            'value'    => 'required',
        ]);
        $performance = Performance::create([
            'user_id'         => $request->user_id,
            'project_id'      => $request->project_id,
            'value'           => $request->value,
        ]);

        return (response()->json($performance));
    }
    // Update
    public function update(Request $request, $id)
    {
        $performance = Performance::find($id);
        $performance->update([
            'user_id'         => $request->user_id,
            'project_id'      => $request->project_id,
            'value'           => $request->value,
        ]);

        return (response()->json($performance));
    }
    // Destroy
    public function destroy($id)
    {
        $performance = Performance::find($id);
        $performance->delete();
    }
}
