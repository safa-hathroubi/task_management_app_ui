/*import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top:80),
            child: Column(
              children: [
                Text(
                  'Chats',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 15, width: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

import 'package:task_management/Data/view/Components/chat_components/chat_list_view.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/chat_components/global_members.dart';
import 'package:task_management/Data/models/message_data_modal.dart';
import 'package:task_management/Data/view/Components/themes/colors.dart';

class MyChatApp extends StatefulWidget {
  const MyChatApp({Key? key}) : super(key: key);

  @override
  MyChatAppState createState() => MyChatAppState();
}

class MyChatAppState extends State<MyChatApp> {
  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;
  ScrollController scrollController = ScrollController();

  Future<void> scrollAnimation() async {
    return await Future.delayed(
        const Duration(milliseconds: 100),
            () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FigmaPalette.lightDarkGrey, //Color(0xFF4D5482),
      appBar: AppBar(
        backgroundColor: FigmaPalette.transparentGrey,//const Color(0xFF4D5482),
        leadingWidth: 50.0,
        titleSpacing: -8.0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: FigmaPalette.red,//Color(0xFF90C953),
            child: Text('X',
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
        title: const ListTile(
          title: Text('XD Usama',
              style: TextStyle(
                color: Colors.white,
              )),
          subtitle: Text('online',
              style: TextStyle(
                color: Colors.white70,
              )),
        ),
        actions: const [
          Icon(Icons.videocam),
          Padding(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: Icon(Icons.call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatListView(scrollController: scrollController)),
          Container(
            // height: 50,
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: FigmaPalette.darkDarkGrey,//Color(0xFF333D56),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
                  child: Transform.rotate(
                      angle: 45,
                      child: const Icon(
                        Icons.attach_file_sharp,
                        color: Colors.white,
                      )),
                ),
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 11.0),
                  child: Transform.rotate(
                    angle: -3.14 / 5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            messageList.add(
                                MessageData(textEditingController.text, true));
                            textEditingController.clear();
                            scrollAnimation();
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            messageList.add(
                                MessageData(textEditingController.text, false));
                            textEditingController.clear();
                            scrollAnimation();
                          });
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
