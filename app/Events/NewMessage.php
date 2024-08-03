<?php

namespace App\Events;

use App\Models\Message;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class NewMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;

    public function __construct(Message $message)
    {
        $this->message = $message;
    }

    public function broadcastOn(): array
    {
        return [
            new Channel('room.' . $this->message->room_id),
        ];
    }

    public function broadcastWith()
    {
        return [
            'id' => $this->message->id,
            'room_id' => $this->message->room_id,
            'content' => $this->message->content,
            'created_at' => $this->message->created_at,
            'updated_at' => $this->message->updated_at,
            'account_id' => $this->message->account_id,
            'account' => [
                'id' => $this->message->account->id,
                'name' => $this->message->account->name,
                'token' => $this->message->account->token,
                'avatar' => $this->message->account->avatar,
                'created_at' => $this->message->account->created_at,
                'updated_at' => $this->message->account->updated_at,
            ],
        ];
    }
}
