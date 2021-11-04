import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:template/data/models/message_list.dart';
import 'package:template/data/models/necessary_chat.dart';
import 'package:template/data/webService/requests/chat.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/widget/scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/bottom_send_navigation.dart';
import 'components/chat_body.dart';
import 'components/messageBox.dart';

class ConversationScreen extends StatefulWidget {
  final data;

  const ConversationScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  // getMessagesList({required String fname, required String lname}) {
  //   print('getUsersInMessage');
  //   ApiChat.getMessagesList()
  //       .then((value) {
  //     userInChat = value?.data ?? [];
  //   });
  // }
  // final dataKey = new GlobalKey();
  ItemScrollController _scrollController = ItemScrollController();
  late NecessaryChat initValues;
  List<Message> messageList = [];
  // ScrollController _scrollController = new ScrollController();
  getMessages() {
    if (initValues.parentId != null) {
      ApiChat.getMessagesList(parentId: initValues.parentId!).then((value) {
        setState(() {
          messageList = value?.data ?? [];
        });
        Future.delayed(Duration(milliseconds: 20), (){
          _scrollController.scrollTo(index:(messageList.length>2? (messageList.length-1):0), duration: Duration(milliseconds: 300));
        });

      });
    }
  }
  late Timer mytimer;
  @override
  void initState() {
    super.initState();
    initValues = NecessaryChat.fromJson(widget.data);
    getMessages();
    mytimer = Timer.periodic(Duration(seconds: 5), (timer) {
      // getMessages();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mytimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          title: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRect(
                  child: Image.asset('assets/logo1.png'),
                ),
              ),
              // Container(
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: NetworkImage(profilePic??''),
              //   fit: BoxFit.cover,
              // ),
              //   ),
              // ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    initValues.name ?? '',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  (false)
                      ? Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 1),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Active Now",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'افلاین',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                ],
              ),
            ],
          ),
          actions: [
            // IconButton(
            //   icon: Icon(Icons.videocam, size: 20),
            //   color: Color(0xFF177767),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: Icon(Icons.call, size: 20),
              color: Color(0xFF177767),
              onPressed: () {
                launch("tel://" + (initValues.mobile ?? ''));
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.more_vert, size: 20),
            //   color: Color(0xFF177767),
            //   onPressed: () {},
            // ),
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              itemCount: messageList.length,
              itemBuilder: (context, i) {
                return MessageBox(
                  isMe:messageList[i].senderUserId ==
                      context.watch<HomeP>().profile!.id.toString(),
                  message: messageList[i].message,
                );
              },
            ),
            // ListView.separated(
            //   controller: _scrollController,
            //   itemCount: messageList.length,
            //   itemBuilder: (context, i) {
            //     return MessageBox(
            //       isMe:messageList[i].senderUserId ==
            //           context.watch<HomeP>().profile!.id.toString(),
            //       message: messageList[i].message,
            //     );
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return SizedBox(
            //       height: 2,
            //     );
            //   },
            // ),
          ],
        ),
        bottomNavigationBar: BottomSendNavigation(
          onSent: (message) {
            ApiChat.sendMessage(
                    receiver_user_id: initValues.id!,
                    message: message,
                    receiver_type: initValues.type!,

            )
                .then((value) {
                  initValues.parentId=value!.parentId;
              setState(() {
                messageList.add(value);
              });
              // Scrollable.ensureVisible(dataKey.currentContext??context);
              // _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
              Future.delayed(Duration(milliseconds: 20), (){
                _scrollController.scrollTo(index:(messageList.length>2? (messageList.length-1):0), duration: Duration(milliseconds: 300));
              });
            });
          },
        ));
  }
}
