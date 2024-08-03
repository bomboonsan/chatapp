<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Room;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;

class RoomController extends Controller
{

    public function home()
    {
        $account_id = Session::get('account_id');
        $token = Session::get('token');

        if (empty($account_id) || empty($token)) {
            return redirect('register');
        }

        $account = Account::where('id', $account_id)->first();

        $messageRooms = Message::where('account_id', $account_id)->get();

        $historyRooms = array();

        foreach ($messageRooms as $messageRoom) {
            $room = Room::where('id', $messageRoom->room_id)->first();
            $historyRooms[] = $room;
        }

        // remove duplicate rooms
        $historyRooms = array_unique($historyRooms, SORT_REGULAR);

        return view('home' , compact('account' , 'historyRooms'));
    }

    public function payment()
    {
        $account_id = Session::get('account_id');
        $token = Session::get('token');

        if (empty($account_id) || empty($token)) {
            return redirect('register');
        }

        $account = Account::where('id', $account_id)->first();
        return view('payment' , compact('account'));
    }

    public function check()
    {
        $account_id = Session::get('account_id');
        $token = Session::get('token');

        if (empty($account_id) || empty($token)) {
            return redirect('register');
        }

        $account = Account::where('id', $account_id)->first();
        return view('check' , compact('account'));
    }

    public function create(Request $request)
    {
        // $request->validate([
        //     'name' => 'required|string|max:255',
        //     'token' => 'required|string',
        // ]);

        // $account = Account::firstOrCreate(
        //     ['token' => $request->token],
        //     ['name' => $request->name]
        // );

        $account_id = Session::get('account_id');
        $token = Session::get('token');

        $account = Account::where('id', $account_id)->first();
        // verify name in database
        if ($account->id != $account_id || $account->token != $token) {
            return response()->json(['message' => 'Invalid token'], 401);
        }

        $RandomNumber = mt_rand(111111,999999);

        $room = Room::create([
            'name' => $account->name,
            // 'owner_id' => $account->id,
            'owner_id' => $account_id,
            'room_number' => $RandomNumber,
        ]);

        // return route "chat"
        return redirect(route('chat-single', $RandomNumber));

    }

    public function chat()
    {
        return view('chat');
    }

    public function chatSingle()
    {
        $account_id = Session::get('account_id');
        $token = Session::get('token');
        if (empty($account_id) || empty($token)) {
            return redirect('register');
        }
        return view('chatSingle' , compact('account_id' , 'token'));
    }

    public function join(Request $request)
    {
        $request->validate([
            'room_number' => 'required|string|exists:rooms,room_number',
            'name' => 'required|string|max:255',
        ]);

        $room = Room::where('room_number', $request->room_number)->firstOrFail();

        // check name in database
        $account = Account::where('name', $request->name)->first();
        // if (empty($account)) {
        //     $account = Account::create([
        //         'name' => $request->name,
        //         'token' => Str::random(32),
        //     ]);
        // }

        return response()->json([
            'room' => $room,
            'account' => $account,
        ]);
    }

    public function joinSingle(Request $request)
    {
        $request->validate([
            'room_number' => 'required|string|exists:rooms,room_number',
            'account_id' => 'required',
        ]);

        $room = Room::where('room_number', $request->room_number)->firstOrFail();

        // check name in database
        $account = Account::where('id', $request->account_id)->first();
        // if (empty($account)) {
        //     $account = Account::create([
        //         'name' => $request->name,
        //         'token' => Str::random(32),
        //     ]);
        // }

        return response()->json([
            'room' => $room,
            'account' => $account,
        ]);
    }
}
