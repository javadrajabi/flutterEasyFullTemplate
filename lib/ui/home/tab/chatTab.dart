import 'package:flutter/material.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
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
            itemCount: 30,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/chatScreen');
                },
                tileColor: Colors.grey.shade100,
                title: Text(' دکتر اپ ' + i.toString()),
                trailing: Text(
                  '1400/07/13 18:50',
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
          ),
          // drawer: Drawer(
          //   child: Container(),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add_comment, color: Colors.white)),
        )
      ],
    );
  }
}
