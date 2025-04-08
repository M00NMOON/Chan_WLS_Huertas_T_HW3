<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Singer;


class SingerController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getAll() {
         $singers = Singer::all();
         return response()->json($singers);
     }

        public function getOne($id) {
            $singer = Singer::select('id','name','age' )->where('singers.id', '=', $id)->get();
            return response()->json($singer);
        }
        public function save(Request $request) {
            $this->validate($request, [
                'name' => 'required',
                'age' => 'required'
            ]);
            $singer = Singer::create($request->all());
            return response()->json($singer, 201);
        }
        public function update(Request $request, $id) {
            $singer = Singer::findOrFail($id);
        
            $this->validate($request, [
                'name' => 'required',
                'age' => 'required'
            ]);
            $singer->update($request->all());
            return response()->json($singer);
        }
        public function delete($id) {
            $singer = Singer::findOrFail($id);
            $singer->delete();
            return response()->json(null, 204);
        }
    
     
}
