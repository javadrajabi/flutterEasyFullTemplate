// import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template/models/messageModel.dart';
import 'messageBox.dart';

class BottomSendNavigation extends StatefulWidget {
  @override
  _BottomSendNavigationState createState() => _BottomSendNavigationState();
}

class _BottomSendNavigationState extends State<BottomSendNavigation>
    with SingleTickerProviderStateMixin {
  TextEditingController _sendMessageController = TextEditingController();

  bool showEmoji = false;

  FocusNode focusNode = FocusNode();

  Icon _emojiIcon = Icon(
    Icons.sentiment_satisfied_alt,
    color: Colors.grey,
    size: 20,
  );

  @override
  void initState() {
    super.initState();
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          setState(() {
            showEmoji = false;
            _emojiIcon = Icon(
              Icons.sentiment_very_satisfied_sharp,
              color: Colors.grey,
              size: 20,
            );
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 50),
            children: List.generate(
              messages.length,
              (index) {
                return MessageBox(
                  isMe: messages[index]['isMe'],
                  message: messages[index]['message'],
                );
              },
            ),
          ),
         Container(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: TextField(
                                focusNode: focusNode,
                                cursorColor: Colors.black,
                                controller: _sendMessageController,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type Here",
                                  prefixIcon: IconButton(
                                    icon: _emojiIcon,
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        showEmoji = !showEmoji;
                                        _emojiIcon =
                                            Icon(Icons.keyboard);
                                      });
                                    },
                                  ),
                                  // suffixIcon: Icon(
                                  //   Icons.now_wallpaper,
                                  //   color: Colors.grey,
                                  //   size: 20,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(right: 12),
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey.shade200,
                          //     borderRadius: BorderRadius.only(
                          //       bottomRight: Radius.circular(20),
                          //       topRight: Radius.circular(20),
                          //     ),
                          //   ),
                          //   child: Icon(
                          //     Icons.mic_none_rounded,
                          //     color: Colors.grey,
                          //     size: 20,
                          //   ),
                          // ),

                          Container(
                            // padding: EdgeInsets.only(right: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),

                ),
              ),
              // showEmoji ? showEmojiPicker() : Container(),

        ],
      ),
      onWillPop: () {
        if (showEmoji) {
          setState(() {
            showEmoji = false;
          });
        } else {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
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
