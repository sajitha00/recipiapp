import 'package:flutter/material.dart';
import 'package:recipiapp/backend/chat_service.dart';

class ChatScreen extends StatelessWidget {
  final String? receiverId;

  const ChatScreen({Key? key, this.receiverId, String? name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ChatScreenBody(receiverId: receiverId),
    );
  }
}

class ChatScreenBody extends StatefulWidget {
  final String? receiverId;

  const ChatScreenBody({Key? key, this.receiverId}) : super(key: key);

  @override
  _ChatScreenBodyState createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<List<Chat>>(
            stream: _chatService.getMessagesWith(widget.receiverId!),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<Chat> chats = snapshot.data!;
              return ListView.builder(
                reverse: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(chats[index].message),
                    subtitle: Text(chats[index].timestamp.toString()),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _chatService.sendMessage(widget.receiverId!, _messageController.text);
                  _messageController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
