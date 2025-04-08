<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Album;


class AlbumController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getAll() {
         $albums = Album::join('singers', 'singer_id', '=', 'singers.id')->select('singers', 'singer_id', '=', 'singers.id')->select('albums.id','title','genre','release_date','description','image_file','image_alt','name','age')->orderBy('release_date', 'desc')->get();
         return response()->json($albums);
     }


     public function getOne($id) {
        $album = Album::join('singers', 'singer_id', '=', 'singers.id')->select('singers', 'singer_id', '=', 'singers.id')->select('albums.id','title','genre','release_date','description','image_file','image_alt','name','age')->where('albums.id', '=', $id)->get();
         return response()->json($album);
     }


     public function save(Request $request) {
        $this->validate($request, [
            'title' => 'required',
            'singer_id' => 'required',
            'release_date' => 'required|date',
            'image_file' => 'required',
            'image_alt' => 'required',
            'description' => 'required',
            'genre' => 'required'
        ]);

        // if ($request->hasFile('image_file')) {
        //     $file = $request->file('image_file');
        //     $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
        //     $imagePath = $file->storeAs('images', $filename, 'public');
        //  } else {
        //      return response()->json(['error' => 'Image upload failed'], 400);
        //  }

         $album = Album::create([
             'title' => $request->title,
             'singer_id' => $request->singer_id,
             'release_date' => $request->release_date,
             'genre' => $request->genre,
             'description' => $request->description,
             'image_file' => $request->image_file,
             'image_alt' => $request->image_alt
             //'image_file' => $imagePath
         ]);

        return response()->json($album, 201);
    }



    /* public function save(Request $request) {
         $this->validate($request, [
             'title' => 'required',
             'author_id' => 'required',
             'published_date' => 'required|date',
             'book_image' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048'
         ]);

         if ($request->hasFile('book_image')) {
            $file = $request->file('book_image');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
            $imagePath = $file->storeAs('images', $filename, 'public');
         } else {
             return response()->json(['error' => 'Image upload failed'], 400);
         }

         $book = Book::create([
             'title' => $request->title,
             'author_id' => $request->author_id,
             'published_date' => $request->published_date,
             'book_image' => $imagePath
         ]);

         return response()->json($book, 201);
     } */
    

    public function update(Request $request, $id) {
        $album = Album::findOrFail($id);
    
        $this->validate($request, [
            'title' => 'required',
            'singer_id' => 'required',
            'release_date' => 'required',
            'image_file' => 'required',
            'image_alt' => 'required',
            'description' => 'required',
            'genre' => 'required'
        ]);
        $album->update($request->all());
        return response()->json($album);
    }
    
    
    public function delete($id) {
        $album = Album::findOrFail($id);
        $album->delete();
        return response()->json(null, 204);
    }
    
}
