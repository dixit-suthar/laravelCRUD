<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ApplyLeave;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('dashboard');
    }

    public function applyLeave()
    {
        return view('applyLeave');
    }

    public function statusLeave()
    {
        $leaves = ApplyLeave::where('users_id','=',Auth::user()->id)->get();

        return view('statusLeave', compact('leaves'));
    }

    public function create(Request $request) {

        $leave = new ApplyLeave;
        $leave->users_id = Auth::user()->id;
        $leave->from = date('Y-m-d', strtotime($request['from']));
        $leave->to = date('Y-m-d', strtotime($request['to']));
        $leave->num_of_days = $request['numDays'];
        $leave->type_leave = $request['type_leave'];
        $leave->status = '0';
        $leave->save();

        return redirect('/applyLeave')->with('msg', '"Leave Applied Successfully"');
    }


}
