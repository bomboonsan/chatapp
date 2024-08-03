<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RoomController;

Route::get('/', function () {
    // return view('welcome');
    return redirect('/home');
});


Route::get('/home', [RoomController::class, 'home'])->name('home');
Route::get('/payment', [RoomController::class, 'payment'])->name('payment');
Route::get('/check', [RoomController::class, 'check'])->name('check');
Route::get('/chat', [RoomController::class, 'chat'])->name('chat');
Route::get('/chat/{roomId}', [RoomController::class, 'chatSingle'])->name('chat-single');


Route::get('/register', [AuthController::class, 'register'])->name('register');
Route::post('/line-auth', [AuthController::class, 'handleLineAuth'])->name('handleLineAuth');

Route::post('/rooms', [RoomController::class, 'create'])->name('roomCreate');
