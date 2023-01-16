<?php

use Illuminate\Support\Facades\Route;

//tous les api sont maintenant sont accessible a tous , ils sont ouverts.
//pour securiser nos api il faut enlever le commentaire de ligne suivant pour fermer nos api 
//grace a "middleware' => ['auth:sanctum']" qui sera appliqué sur l'ensemble des routes .
// Route::group(['middleware' => ['auth:sanctum']], function () {
Route::post('/login', [App\Http\Controllers\API\AuthController::class, 'login']);
Route::get('/logout', [App\Http\Controllers\API\AuthController::class, 'logout']);

//---------------- User's Routes ----------------//
Route::post('/users', [App\Http\Controllers\UserController::class, 'store']);//Post to store data ,la fonction store existe dans le User Controller ou ils sont definis notre CRUD , de meme pour les autres.
Route::get('/users', [App\Http\Controllers\UserController::class, 'index']);//get to fetch data 
Route::get('/users/{id}', [App\Http\Controllers\UserController::class, 'view']);//get to fetch data
Route::patch('/users/{id}', [App\Http\Controllers\UserController::class, 'update']);//patch to update data 
Route::delete('/users/{id}', [App\Http\Controllers\UserController::class, 'destroy']);//delete to destroy data 

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
// });
