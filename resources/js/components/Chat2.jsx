import React, { useState, useEffect , useRef } from 'react';
import axios from 'axios';

const Chat = () => {
    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');
    const [room, setRoom] = useState(null);
    const [account, setAccount] = useState(null);

    const myName = 'aunTest';

    const scroll = useRef();
    const scrollToBottom = () => {
        scroll.current.scrollIntoView({ behavior: 'smooth' });
    };

    useEffect(() => {
        scrollToBottom();
    }, [messages]);

    useEffect(() => {
        // For example:
        joinRoom('123', myName);
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
        <div className="border-[10px] border-[#ecf5f4] rounded-2xl bg-white">
            <section>
                <div className="room-header">

                </div>
                <div className="messages-box">
                    {messages.map(message => (
                        <div className={message.account.name == myName ? 'chat chat-end' : ' chat chat-start'}  key={message.id}>
                            <div className="chat-image avatar">
                                <div className="w-10 rounded-full">
                                <img
                                    alt="Tailwind CSS chat bubble component"
                                    src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                                </div>
                            </div>
                            <div className="chat-header">
                                {message.account?.name || 'Unknown'}
                                <time className="text-xs opacity-50 ml-1">{new Date(message.created_at).toLocaleDateString('fr-FR', { year: '2-digit', month: '2-digit', day: '2-digit' }) }, {new Date(message.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</time>
                            </div>
                            <div className="chat-bubble">{message.content}</div>
                            {/* <div className="chat-footer opacity-50">Seen at {message.content}</div> */}
                        </div>

                    ))}
                    <span ref={scroll}></span>
                </div>
                <div className="join w-full p-2">
                    <input
                        className="input input-bordered join-item w-full rounded-l-full focus:outline-none"
                        type="text"
                        value={newMessage}
                        onChange={(e) => setNewMessage(e.target.value)}
                    />
                    <button id="send"  className="btn join-item rounded-r-full bg-[#16b57b]" onClick={sendMessage}>
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFF"><path d="M120-160v-640l760 320-760 320Zm80-120 474-200-474-200v140l240 60-240 60v140Zm0 0v-400 400Z"/></svg>
                    </button>
                </div>
            </section>
        </div>
    );
};

export default Chat;
