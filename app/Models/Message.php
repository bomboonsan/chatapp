<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $fillable = ['room_id', 'account_id', 'content'];

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function account()
    {
        return $this->belongsTo(Account::class);
    }

}
