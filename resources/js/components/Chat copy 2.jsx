import React, { useState, useEffect } from 'react';
import axios from 'axios';



const Chat = () => {
    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');
    const [room, setRoom] = useState(null);
    const [account, setAccount] = useState(null);



    const joinRoom = async (roomNumber, name) => {
        try {
            const response = await axios.post('/api/rooms/join', { room_number: roomNumber, name });
            setRoom(response.data.room);
            setAccount(response.data.account);

            // Fetch messages
            const messagesResponse = await axios.get(`/api/rooms/${response.data.room.id}/messages`);
            // console.log('Messages:', messagesResponse);
            // console.log('response:', response);
            setMessages(messagesResponse.data);


            window.Echo.channel('`room.${response.data.room.id}`')
                .listen('NewMessage', (e) => {
                    console.log('NewMessage:', e);

                    setMessages(prevMessages => [...prevMessages, e.message]);

                });

        } catch (error) {
            console.error('Error joining room:', error);
        }
    };

    const sendMessage = async () => {
        if (newMessage.trim() === '') return;

        try {
            await axios.post(`/api/rooms/${room.id}/messages`, {
                content: newMessage,
                account_id: account.id,
            });
            setNewMessage('');
        } catch (error) {
            console.error('Error sending message:', error);
        }
    };


    useEffect(() => {
        // For example:
        joinRoom('123', 'bomTest');
    }, []);

    return (
        <div>
            <div>
                {messages.map(message => (
                    <div key={message.id}>
                        <strong>{message.account.name}: </strong>
                        {message.content}
                    </div>
                ))}
            </div>
            <input
                type="text"
                value={newMessage}
                onChange={(e) => setNewMessage(e.target.value)}
            />
            <button onClick={sendMessage}>Send</button>
        </div>
    );
};

export default Chat;
