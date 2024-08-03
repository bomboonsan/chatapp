import React from 'react';
import ReactDOM from 'react-dom/client';
import Chat from './Chat.jsx';
import Chat2 from './Chat2.jsx';
import ChatSingle from './ChatSingle.jsx';


if (document.getElementById('main')) {

    ReactDOM.createRoot(document.getElementById('app')).render(
        <React.StrictMode>
            <Chat />
        </React.StrictMode>
    );

}



if (document.getElementById('main2')) {

    ReactDOM.createRoot(document.getElementById('app2')).render(
        <React.StrictMode>
            <Chat2 />
        </React.StrictMode>
    );

}




if (document.getElementById('mainSingle')) {

    ReactDOM.createRoot(document.getElementById('appSingle')).render(
        <React.StrictMode>
            <ChatSingle />
        </React.StrictMode>
    );

}

