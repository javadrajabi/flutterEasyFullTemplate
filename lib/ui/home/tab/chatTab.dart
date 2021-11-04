import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:template/data/webService/requests/chat.dart';
import 'package:template/provider/chat_provider.dart';
import 'package:template/widget/select_dialog/select_dialog.dart';
import 'package:template/data/models/member/services_list.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  getList() {
    context.read<ChatP>().getUsersInMessage();
  }

  // serviceList = [];
  Future<List<Service>>? getAllServicesList() async {
    print('getAllServicesList');
    return (await ApiChat.getAllServicesList())?.data ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Container(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(50)),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.search)),
                    border: InputBorder.none,
                    fillColor: Colors.grey,
                    hintText: 'جستجو',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  ),
                ),
              ),
              // actions: [
              //   IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
              // ],
            ),
            body: ListView.separated(
              itemCount: context
                  .watch<ChatP>()
                  .userInChat
                  .length,
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () async {
                    var userChat = context
                        .read<ChatP>()
                        .userInChat[i];
                   await Navigator.of(context).pushNamed('/chatScreen', arguments: {
                      "name": userChat.member != null
                          ? ((userChat.member?.fname ?? '') +
                          ' ' +
                          (userChat.member?.lname ?? ''))
                          : userChat.sp?.name ?? '',
                      "id": userChat.member != null
                          ? (userChat.member?.id.toString())
                          : userChat.sp?.id.toString(),
                      "type": userChat.member != null ? "1" : "2",
                      "parent_id": userChat.parentId.toString()
                    });
                  },
                  tileColor: Colors.grey.shade100,
                  title: Text(
                    context
                        .watch<ChatP>()
                        .userInChat[i].member != null
                        ? ((context
                        .watch<ChatP>()
                        .userInChat[i]
                        .member
                        ?.fname ??
                        '') +
                        ' ' +
                        (context
                            .watch<ChatP>()
                            .userInChat[i]
                            .member
                            ?.lname ??
                            ''))
                        : context
                        .watch<ChatP>()
                        .userInChat[i].sp?.name ?? '',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  trailing: Text(
                    context
                        .watch<ChatP>()
                        .userInChat[i]
                        .updatedAt
                        ?.split('T')[0] ??
                        '',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                  leading: Image.asset(
                    'assets/logo1.png',
                    width: 40,
                  ),
                  // contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 2,
                );
              },
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 70, right: 20, left: 20),
          child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: FittedBox(
                  child: FloatingActionButton(
                      heroTag: "btn19",
                      backgroundColor: Colors.green,
                      onPressed: () async {
                        final res = await getAllServicesList();
                        String ex1 = "انتخاب نشده";
                        List<String> names = [];
                        if ((res?.length ?? 0) > 0) {
                          names = res!.map((e) => e.name ?? '').toList();
                        }

                        await SelectDialog.showModal<String>(
                          context,
                          // label: "",
                          selectedValue: ex1,
                          items: names,
                          onChange: (String selected) {
                            setState(() {
                              ex1 = selected;
                            });
                          },
                        );
                        if (ex1 != "انتخاب نشده") {
                       var elem=   res!.where((element) => element.name == ex1).first;
                       await Navigator.of(context).pushNamed(
                              '/chatScreen', arguments: {
                            "name": ex1,
                            "id": elem.id.toString(),
                            "type": "2",
                            "parent_id": null
                          });

                       print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                       getList();
                        }
                      },
                      child: Icon(Icons.add_comment, color: Colors.white)))),
        ),
      ],
    );
  }
}
