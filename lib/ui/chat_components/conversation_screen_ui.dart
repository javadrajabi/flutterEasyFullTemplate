import 'package:flutter/material.dart';
import 'components/bottom_send_navigation.dart';

class ConversationScreen extends StatelessWidget {
  final String? username, profilePic, time;
  final bool? online;

  const ConversationScreen({
    Key? key,
    this.username,
    this.profilePic,
    this.time,
    this.online,
  }) : super(key: key);
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
                  username??'دکتر اپ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                (online??false)
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
                        time??'افلاین',
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
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Icon(Icons.more_vert, size: 20),
          //   color: Color(0xFF177767),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: BottomSendNavigation(),
    );
  }
}
