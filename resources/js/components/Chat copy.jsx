import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Chat = () => {
    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');
    const [room, setRoom] = useState(null);
    const [account, setAccount] = useState(null);

    useEffect(() => {
        // Join or create room logic here
        // For example:
        // joinRoom('ROOM123', 'John Doe');
    }, []);

    const joinRoom = async (roomNumber, name) => {
        try {
            const response = await axios.post('/api/rooms/join', { room_number: roomNumber, name });
            setRoom(response.data.room);
            setAccount(response.data.account);

            // Fetch messages
            const messagesResponse = await axios.get(`/api/rooms/${response.data.room.id}/messages`);
            setMessages(messagesResponse.data);

            // Listen for new messages
            window.Echo.channel(`room.${response.data.room.id}`)
                .listen('NewMessage', (e) => {
                    setMessages(prevMessages => [...prevMessages, e.message]);
                });
        } catch (error) {
            console.error('Error joining room:', error);
        }
    };

    const sendMessage = async () => {
        if (newMessage.trim() === '') return;

        try {
            // await axios.post(`/api/rooms/${room.id}/messages`, {
            //     content: newMessage,
            //     account_id: account.id,
            // });
            await axios.post(`/api/rooms/1234/messages`, {
                content: newMessage,
                account_id: 3,
            });
            setNewMessage('');
        } catch (error) {
            console.error('Error sending message:', error);
        }
    };

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
