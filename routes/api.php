<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\MessageController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::post('/rooms/join', [RoomController::class, 'join']);
Route::post('/rooms/joinsingle', [RoomController::class, 'joinSingle']);
Route::post('/rooms/{room}/messages', [MessageController::class, 'store']);
Route::get('/rooms/{room}/messages', [MessageController::class, 'index']);
