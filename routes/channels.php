<?php

use Illuminate\Support\Facades\Broadcast;
use App\Models\Room;

Broadcast::channel('room.{roomId}', function ($user, $roomId) {
    // // ตรวจสอบว่าผู้ใช้มีสิทธิ์เข้าถึงห้องแชทหรือไม่
    $room = Room::findOrFail($roomId);
    // // ในที่นี้เราจะอนุญาตให้ทุกคนเข้าถึงได้ แต่คุณสามารถเพิ่มเงื่อนไขการตรวจสอบเพิ่มเติมได้
    return true;
});
