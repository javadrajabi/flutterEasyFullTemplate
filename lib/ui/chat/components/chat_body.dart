import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/webService/requests/chat.dart';
import 'package:template/data/models/message_list.dart';
import 'package:template/provider/homeProvider.dart';
import 'messageBox.dart';
class ChatBody extends StatefulWidget {
  final List<Message> messageList;
  const ChatBody({Key? key,required this.messageList}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class ChatBody extends StatelessWidget {
//   ChatBody(this.messageList);

  ScrollController _scrollController = new ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView.separated(
          // controller: _scrollController,
          itemCount: widget.messageList.length,
          itemBuilder: (context, i) {
            return MessageBox(
              isMe:widget.messageList[i].senderUserId ==
                  context.watch<HomeP>().profile!.id.toString(),
              message: widget.messageList[i].message,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 2,
            );
          },
        ),
      ],
    );
  }

// Widget showEmojiPicker() {
//   return EmojiPicker(
//     rows: 4,
//     columns: 7,
//     onEmojiSelected: (emoji, category) {
//       print(emoji);
//       _sendMessageController.text = _sendMessageController.text + emoji.emoji;
//     },
//   );
// }
}
