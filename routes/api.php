<?php

use Illuminate\Support\Facades\Route;


Route::group(['middleware' => ['auth:sanctum']], function () {

    //---------------- User's Routes ----------------//
    Route::post('/users', [App\Http\Controllers\UserController::class, 'store']);
    Route::get('/users', [App\Http\Controllers\UserController::class, 'index']);
    Route::get('/users/{id}', [App\Http\Controllers\UserController::class, 'view']);
    Route::patch('/users/{id}', [App\Http\Controllers\UserController::class, 'update']);
    Route::delete('/users/{id}', [App\Http\Controllers\UserController::class, 'destroy']);

    //---------------- Project's Routes ----------------//
    Route::post('/projects', [App\Http\Controllers\ProjectController::class, 'store']);
    Route::get('/projects', [App\Http\Controllers\ProjectController::class, 'index']);
    Route::get('/projects/{id}', [App\Http\Controllers\ProjectController::class, 'view']);
    Route::patch('/projects/{id}', [App\Http\Controllers\ProjectController::class, 'update']);
    Route::delete('/projects/{id}', [App\Http\Controllers\ProjectController::class, 'destroy']);

    //---------------- Performance's Routes ----------------//
    Route::post('/performances', [App\Http\Controllers\PerformanceController::class, 'store']);
    Route::get('/performances', [App\Http\Controllers\PerformanceController::class, 'index']);
    Route::get('/performances/{id}', [App\Http\Controllers\PerformanceController::class, 'view']);
    Route::patch('/performances/{id}', [App\Http\Controllers\PerformanceController::class, 'update']);
    Route::delete('/performances/{id}', [App\Http\Controllers\PerformanceController::class, 'destroy']);

    //---------------- Task's Routes ----------------//
    Route::post('/tasks', [App\Http\Controllers\TaskController::class, 'store']);
    Route::get('/tasks', [App\Http\Controllers\TaskController::class, 'index']);
    Route::get('/tasks/{id}', [App\Http\Controllers\TaskController::class, 'view']);
    Route::patch('/tasks/{id}', [App\Http\Controllers\TaskController::class, 'update']);
    Route::delete('/tasks/{id}', [App\Http\Controllers\TaskController::class, 'destroy']);
});
