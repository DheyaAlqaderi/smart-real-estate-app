import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../services/models/chat/ChatMessage.dart';
import '../../../services/models/chat/SendMenuItems.dart';
import '../../widgets/ChatBubble.dart';
import '../../widgets/ChatDetailPageAppBar.dart';

enum MessageType{
  Sender,
  Receiver,
}


class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you Hello Jane,"
                          " I'm good what about you Hello Jane, I'm good what"
                          " about you Hello Jane,"
                          " I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you Hello Jane,"
        " I'm good what about you Hello Jane, I'm good what"
        " about you Hello Jane,"
        " I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you Hello Jane,"
        " I'm good what about you Hello Jane, I'm good what"
        " about you Hello Jane,"
        " I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you Hello Jane,"
        " I'm good what about you Hello Jane, I'm good what"
        " about you Hello Jane,"
        " I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "I'm fine, Working from home", type: MessageType.Receiver),
    ChatMessage(message: "Oh! Nice. Same here man", type: MessageType.Sender),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  final TextEditingController controller = TextEditingController();
  late Function(String) onSend;

  void showModal(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: MediaQuery.of(context).size.height/2,
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16,),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index].color.shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(menuItems[index].icons,size: 20,color: menuItems[index].color.shade400,),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  final ScrollController _scrollController = ScrollController();
  @override


  void initState() {
    super.initState();
    // Schedule the scroll to the end after the first frame is built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailPageAppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 80,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: chatMessage.length,
                padding: EdgeInsets.only(bottom: 80),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatBubble(
                    chatMessage: chatMessage[index],
                  );
                },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 80,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModal();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF234F68),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 21),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message...",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onPressSend();
                    },
                    icon: Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

void _onPressSend() {
  if (controller.text.isNotEmpty) {
    setState(() {
      chatMessage.add(
          ChatMessage(message: controller.text, type: MessageType.Sender));
      controller.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
}