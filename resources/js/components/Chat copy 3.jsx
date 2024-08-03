import React, { useState, useEffect , useRef } from 'react';
import axios from 'axios';

const Chat = () => {
    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');
    const [room, setRoom] = useState(null);
    const [account, setAccount] = useState(null);

    const scroll = useRef();
    const scrollToBottom = () => {
        scroll.current.scrollIntoView({ behavior: 'smooth' });
    };

    useEffect(() => {
        scrollToBottom();
    }, [messages]);

    useEffect(() => {
        // For example:
        joinRoom('123', 'bomTest');
    }, []);

    const joinRoom = async (roomNumber, name) => {
        try {
            const response = await axios.post('/api/rooms/join', { room_number: roomNumber, name });
            setRoom(response.data.room);
            setAccount(response.data.account);

            // Fetch messages
            const messagesResponse = await axios.get(`/api/rooms/${response.data.room.id}/messages`);
            setMessages(messagesResponse.data);
            // console.log('Messages:', messagesResponse.data);

            // Listen for new messages
            window.Echo.channel(`room.${response.data.room.id}`)
                .listen('NewMessage', (e) => {
                    // console.log('NewMessage:', e);
                    // add new message to SetMessages state
                    setMessages(prevMessages => [...prevMessages, e]);

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

    return (
        <div>
            <div>
                {messages.map(message => (
                    <div key={message.id}>
                        <strong>{message.account?.name || 'Unknown'}: </strong>
                        {message.content}
                    </div>
                ))}
                <span ref={scroll}></span>
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
