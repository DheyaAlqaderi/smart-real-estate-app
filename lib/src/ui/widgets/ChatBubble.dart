import 'package:flutter/material.dart';
import '../../services/models/chat/ChatMessage.dart';
import '../screens/chat/ChatDetailPage.dart';

class ChatBubble extends StatefulWidget{
  ChatMessage chatMessage;
  ChatBubble({required this.chatMessage});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: (widget.chatMessage.type == MessageType.Receiver) // if condition
              ? BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: (widget.chatMessage.type  == MessageType.Receiver)
                      ? Colors.grey.shade200
                      : Color(0xFF234F68),
                  )
              : BoxDecoration(
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  ),
            color: (widget.chatMessage.type  == MessageType.Receiver)
                ? Colors.grey.shade200
                : Color(0xFF234F68),
                  ),
          padding: EdgeInsets.all(16),
          child: (widget.chatMessage.type == MessageType.Receiver)
              ? Text(widget.chatMessage.message)
              : Text(widget.chatMessage.message , style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}