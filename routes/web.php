<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Sleep;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/hello-world', function () {
    return 'hello-world';
});

Route::get('/phpinfo', function () {
    return phpinfo();
});

Route::get('/timeout', function () {
    sleep(12);
    return "sleep ended";
});
