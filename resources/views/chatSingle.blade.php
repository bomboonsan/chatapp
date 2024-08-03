<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel</title>
    @viteReactRefresh
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gabarito:wght@400..900&family=Noto+Sans+Thai:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
    <main id="mainSingle" class="bg-[#e1f0eb] w-screen h-screen flex justify-center items-center p-2">
        <div id="appSingle" class="max-w-3xl w-full"></div>
    </main>
    <script>
        window.account_id = '{{$account_id}}';
    </script>
</body>
</html>
