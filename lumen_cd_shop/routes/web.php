<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


//matches localhost:8888/lumen/public/
$router->get('/', function () use ($router) {
    return $router->app->version();
});

//localhost:8888/lumen_cd_shop/public/albums
$router->get('/albums', 'AlbumController@getAll');
$router->get('/albums/{id}', 'AlbumController@getOne');
$router->post('/albums/add', 'AlbumController@save');
$router->post('/albums/edit/{id}', 'AlbumController@update');
$router->delete('/albums/delete/{id}', 'AlbumController@delete');

//localhost:8888/lumen_cd_shop/public/singers
$router->get('/singers', 'SingerController@getAll');
$router->get('/singers/{id}', 'SingerController@getOne');
$router->post('/singers/add', 'SingerController@save');
$router->post('/singers/edit/{id}', 'SingerController@update');
$router->delete('/singers/delete/{id}', 'SingerController@delete');













