<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    @viteReactRefresh
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gabarito:wght@400..900&family=Noto+Sans+Thai:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
    <main class="flex items-center justify-center min-h-screen h-full bg-[#e1f0eb] py-3 px-2">
        <div class="max-w-xl w-full bg-white rounded-lg px-4 py-10 shadow-xl shadow-neutral-600/10">
            <div class="text-center mb-10">
                <img src="{{ $account->avatar }}" alt="profile" class="w-24 h-24 rounded-full mx-auto" loading="lazy" />
                <p class="text-gray-800 font-semibold text-lg">
                    {{ $account->name }}
                </p>
            </div>
            <div class="mb-10 flex flex-col md:flex-row gap-5 justify-center items-center">
                <form action="{{ route('roomCreate') }}" method="POST"enctype="multipart/form-data">
                    @csrf
                    <button type="submit" class="btn btn-wide bg-[#16B57B] text-white hover:bg-[#197252]">
                        <i class="fa-solid fa-square-plus text-xl"></i>
                        CREATE ROOM
                    </button>
                </form>

                <button class="btn btn-wide btn-neutral" onclick="my_modal_5.showModal()">
                    <i class="fa-solid fa-arrow-right-to-bracket text-xl"></i>
                    JOIN ROOM
                </button>
            </div>
            <div class="bg-neutral-100 p-4 rounded-lg mb-5">
                <p class="text-gray-800 font-semibold text-lg mb-3">ประวัติสนทนา</p>
                <ul class="list-disc list-inside space-y-0">
                    @foreach ($historyRooms as $room)
                        <li><a href="{{ route('chat-single', $room->room_number) }}">ห้องสนทนา: #{{ $room->room_number }}</a></li>
                    @endforeach
                </ul>
            </div>
            <div class="flex justify-center gap-5">
                <a href="{{ route('payment') }}" class="btn">ชำระเงิน</a>
                <a href="{{ route('check') }}" class="btn">ตรวจสอบสินค้า</a>
            </div>
        </div>
    </main>
    <dialog id="my_modal_5" class="modal modal-bottom sm:modal-middle">
        <div class="modal-box">
            <div class="flex justify-between">
                <h3 class="text-lg font-bold w-1/2 m-0">ระบุเลขที่ห้องสนทนา</h3>
                <div class="modal-action w-1/3 m-0">
                    <form method="dialog">
                        <!-- if there is a button in form, it will close the modal -->
                        <button class="">
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#5f6368"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg>
                        </button>
                    </form>
                </div>
            </div>
            <div class="py-4">
                <div class="join w-full">
                    <input id="room-id" class="input input-bordered join-item w-full outline-none focus:outline-none" placeholder="123456" />
                    <button id="handle-join" class="btn join-item rounded-r-full">JOIN</button>
                </div>
            </div>
        </div>
    </dialog>
    <script>
        document.getElementById('handle-join').addEventListener('click', () => {
            const roomId = document.getElementById('room-id').value;
            console.log('Join room:', roomId);
            window.location.href = "https://linux-8000.bomboonsan.com/chat/" + roomId;
        });
    </script>
</body>
</html>
