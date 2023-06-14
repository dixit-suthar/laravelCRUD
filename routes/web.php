<?php

use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect('login');
});

Auth::routes(['verify' => true]);

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('dashboard');
    Route::get('/applyLeave', [App\Http\Controllers\HomeController::class, 'applyLeave'])->name('applyLeave');
    Route::get('/statusLeave', [App\Http\Controllers\HomeController::class, 'statusLeave'])->name('statusLeave');
    Route::post('/applyLeave/create', [App\Http\Controllers\HomeController::class, 'create'])->name('createLeave');

    Route::middleware(['isAdmin'])->group(function () {
        Route::get('/approveLeave', [App\Http\Controllers\AdminController::class, 'approveLeave'])->name('approveLeave');
        Route::post('/approveLeave/action', [App\Http\Controllers\AdminController::class, 'leaveAction'])->name('leaveAction');

        Route::get('/showUsers', [App\Http\Controllers\AdminController::class, 'showUsers'])->name('showUsers');
        Route::post('/showUsers/delete', [App\Http\Controllers\AdminController::class, 'delete'])->name('deleteUser');
        Route::get('/showUsers/edit/{id}', [App\Http\Controllers\AdminController::class, 'edit'])->name('editUser');
        Route::post('/showUsers/update', [App\Http\Controllers\AdminController::class, 'update'])->name('updateUser');
    });
});

