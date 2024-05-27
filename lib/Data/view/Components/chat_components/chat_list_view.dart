import 'package:task_management/Data/view/Components/chat_components/receiver_row_view.dart';
import 'package:task_management/Data/view/Components/chat_components/sender_row_view.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Data/view/Components/chat_components/global_members.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: messageList.length,
      itemBuilder: (context, index) => (messageList[index].isSender)
          ? SenderRowView(senderMessage: messageList[index].message)
          : ReceiverRowView(receiverMessage: messageList[index].message),
    );
  }
}
