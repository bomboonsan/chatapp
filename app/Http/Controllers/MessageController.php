<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\Room;
use Illuminate\Http\Request;
use App\Events\NewMessage;

class MessageController extends Controller
{
    public function store(Request $request, Room $room)
    {
        $request->validate([
            'content' => 'required|string',
            'account_id' => 'required|exists:accounts,id',
        ]);

        $message = $room->messages()->create([
            'content' => $request->content,
            'account_id' => $request->account_id,
        ]);

        broadcast(new NewMessage($message))->toOthers();

        return response()->json($message);
    }

    public function index(Room $room)
    {
        return response()->json($room->messages()->with('account')->get());
    }
}
