<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ApplyLeave;
use App\Models\User;
use Auth;

class AdminController extends Controller
{
    public function approveLeave(){
        $leaves = ApplyLeave::where('status','=','0')->get();

        return view('approveLeave',compact('leaves'));
    }

    public function leaveAction(Request $request){
        $leave=ApplyLeave::find($request->id);
        $leave=$leave->update(['status'=>$request->status]);
        return $request->status;
    }

    public function showUsers(){
        $users = User::where('id',"!=",Auth::user()->id)->paginate(10);
        return view('showUsers',compact('users'));
    }

    public function delete(Request $request){
        $user=User::find($request->id);
        $user=$user->delete();
    }

    public function edit($id) {
        $user = User::find($id);
        return view('editUser',compact('user'));
    }

    public function update(Request $request) {
        $user = User::find($request->id);
        $data = $this->validate($request, [
            'name' => 'required',
            'email' => 'required',
            'role' => 'required',
        ]);
        $user->name = $data['name'];
        $user->email = $data['email'];
        $user->role = $data['role'];

        $user->save();
        
        return redirect('/showUsers');
    }

}
