<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Models\Account;

class AuthController extends Controller
{
    public function register()
    {
        // $name = Session::get('name');
        // $avatar = Session::get('avatar');
        // $token = Session::get('token');
        return view('auth.register');
    }
    public function handleLineAuth(Request $request)
    {
        $name = $request->input('name');
        $avatar = $request->input('avatar');
        $token = $request->input('token');

        // validate
        $request->validate([
            'name' => 'required',
            'avatar' => 'required',
            'token' => 'required'
        ]);

        // check if exists
        $account = Account::where('token', $token)->first();
        if ($account) {

            $account_id = $account->id;

        } else {
            $account = new Account;
            $account->name = $name;
            $account->avatar = $avatar;
            $account->token = $token;
            $account->save();

            $account_id = $account->id;
        }



        // set session
        Session::put('account_id', $account_id);
        Session::put('token', $token);

        // dev response for testing with name , avatar and token
        return response()->json(['success' => true]);
    }


}
