<?php

use App\Http\Controllers\ContractController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});

// Route::get('/contracts', [ContractController::class, 'index'])->name('contract.list');
// Route::get('/contract/create', [ContractController::class, 'create']);
// Route::post('/contract/store', [ContractController::class, 'store'])->name('contract.store');
// Route::get('/contract/edit', [ContractController::class, 'edit']);
// Route::post('/contract/update', [ContractController::class, 'update']);
// Route::post('/contract/delete', [ContractController::class, 'delete']);

Route::resource('/contract', ContractController::class);
