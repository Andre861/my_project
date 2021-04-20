<?php

use App\Http\Controllers\DiagnoseController;
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

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', function () {
    return view('main');
});

// Route::get('/', function () {
//     return view('landing');
// });

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::resource('diagnose',DiagnoseController::class);
    // TODO:: check `php artisan route:list` to see what's inside this resource route
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get("/about", function () {
    return view('about');
});

Route::get("/contact", function () {
    return view('contact');
});

Route::get("/search", function () {
    return view('search');
});
