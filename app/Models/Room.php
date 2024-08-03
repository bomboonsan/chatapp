<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'owner_id', 'room_number'];

    public function owner()
    {
        return $this->belongsTo(Account::class, 'owner_id');
    }

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

}
