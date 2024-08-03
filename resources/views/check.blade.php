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

                </p>
            </div>
            <div class="overflow-x-auto">
                <ul class="timeline justify-center">
                    <li>
                      <div class="timeline-start timeline-box">ชำระเงิน</div>
                      <div class="timeline-middle">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          class="text-primary h-5 w-5">
                          <path
                            fill-rule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
                            clip-rule="evenodd" />
                        </svg>
                      </div>
                      <hr class="bg-primary" />
                    </li>
                    <li>
                      <hr class="bg-primary" />
                      <div class="timeline-middle">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          class="text-primary h-5 w-5">
                          <path
                            fill-rule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
                            clip-rule="evenodd" />
                        </svg>
                      </div>
                      <div class="timeline-end timeline-box">ส่งของ</div>
                      <hr class="bg-primary" />
                    </li>
                    <li>
                      <hr class="bg-primary" />
                      <div class="timeline-start timeline-box">ได้รับสินค้า</div>
                      <div class="timeline-middle">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          class="text-primary h-5 w-5">
                          <path
                            fill-rule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
                            clip-rule="evenodd" />
                        </svg>
                      </div>
                      <hr />
                    </li>
                    <li>
                      <hr />
                      <div class="timeline-middle">
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          class="h-5 w-5">
                          <path
                            fill-rule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
                            clip-rule="evenodd" />
                        </svg>
                      </div>
                      <div class="timeline-end timeline-box">รอยืนยัน</div>
                    </li>
                </ul>
            </div>
        </div>
    </main>
</body>
</html>
