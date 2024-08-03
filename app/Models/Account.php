<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'token'];

    public function rooms()
    {
        return $this->hasMany(Room::class, 'owner_id');
    }

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

}
