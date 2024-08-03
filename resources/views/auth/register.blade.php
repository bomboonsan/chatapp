<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LINE AUTH</title>
    @viteReactRefresh
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body>

    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <main class="flex items-center justify-center min-h-screen h-full bg-[#e1f0eb]">
        <lottie-player class="w-1/4 h-auto aspect-square" src="https://lottie.host/3db1e221-cd2f-4e60-ad3f-c0969687bd8b/eR78szDH6d.json" background="transparent"  speed="1" loop autoplay></lottie-player>
    </main>

    <script src="https://static.line-scdn.net/liff/edge/versions/2.21.4/sdk.js"></script>
    <script>
        function initializeLiff(myLiffId) {
            liff
                .init({
                    liffId: myLiffId
                })
                .then(() => {
                    if (!liff.isLoggedIn()) {
                        liff.login();
                    } else {
                        liff.getProfile()
                            .then(profile => {
                                // Send profile data to the server

                                // console.log(profile); // Display the profile data on the console.

                                // fetch('{{ route("handleLineAuth") }}', {
                                alert('loading...');
                                fetch('https://linux-8000.bomboonsan.com/line-auth', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json',
                                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                                    },
                                    body: JSON.stringify({
                                        name: profile.displayName,
                                        avatar: profile.pictureUrl,
                                        token: profile.userId
                                    })
                                })
                                .then(response => response.json())
                                .then(data => {
                                    // console.log(data);
                                    if (data.success) {
                                        // Redirect to the home page
                                        setTimeout(() => {
                                            window.location.href = '{{ route("home") }}';

                                        }, 200)
                                    } else {
                                        alert('Error: Failed to register');
                                    }
                                });
                            });
                    }
                });
        }

        initializeLiff('2005912571-AMOooJPR');
    </script>
</body>
</html>
