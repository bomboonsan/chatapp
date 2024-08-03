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
            <div class="my-5 flex justify-center gap-5">
                <a href="{{ route('home') }}" class="">
                    <svg class="w-8 h-8 fill-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960"><path d="M240-200h120v-240h240v240h120v-360L480-740 240-560v360Zm-80 80v-480l320-240 320 240v480H520v-240h-80v240H160Zm320-350Z"/></svg>
                </a>

            </div>
            <hr class="my-4" />
            <div>
                <p class="text-gray-800 font-semibold text-center">
                    ประวัติการชำระเงิน
                </p>
            </div>
            <div class="overflow-x-auto">
                <table class="table">
                    <!-- head -->
                    <thead>
                        <tr>
                        <th></th>
                        <th>Name</th>
                        <th>Item</th>
                        <th>Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- row 1 -->
                        <tr>
                        <th>1</th>
                        <td>Cy Ganderton</td>
                        <td>Quality Control Specialist</td>
                        <td>14/7/2024</td>
                        </tr>
                        <!-- row 2 -->
                        <tr>
                        <th>2</th>
                        <td>Hart Hagerty</td>
                        <td>Desktop Support Technician</td>
                        <td>10/7/2024</td>
                        </tr>
                        <!-- row 3 -->
                        <tr>
                        <th>3</th>
                        <td>Brice Swyre</td>
                        <td>Tax Accountant</td>
                        <td>26/6/2024</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</body>
</html>
