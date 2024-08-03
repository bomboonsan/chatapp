<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel</title>
    @viteReactRefresh
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body>
    <main id="main" class="bg-[#e1f0eb] w-screen h-screen flex justify-center items-center">
        <div id="app" class="max-w-3xl w-full"></div>
    </main>
</body>
</html>
