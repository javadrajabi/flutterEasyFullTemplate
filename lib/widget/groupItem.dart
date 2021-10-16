import 'package:flutter/material.dart';

class GroupItem extends StatelessWidget {
  final String? text;
  final String? comment;
  final Function? onTop;
  final bool? showMore;

  GroupItem(
      {@required this.text, this.comment, @required this.onTop, this.showMore});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: (showMore != null && showMore!)
          ? PopupMenuButton<String>(
          onSelected: (String value) {
            print(value);
            // setState(() {
            //   _selection = value;
            // });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),


        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'edit',
            child: Text('ویرایش'),
          ),
          const PopupMenuItem<String>(
            value: 'delete',
            child: Text('حذف'),
          ),
          const PopupMenuItem<String>(
            value: 'favorite',
            child: Text('مورد علاقه'),
          ),
        ],
      )
          : SizedBox(),
      isThreeLine: true,
      title: Text(text!),
      subtitle: Text(
        comment ?? 'بدون کامنت',
        style: TextStyle(fontSize: 10),
      ),
      leading: Container(
        margin: EdgeInsets.all(5),
        width: 30,
        height: 30,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)),
          child: Container(
              color: Colors.blue,
              child: Center(child: Text(text!.substring(0, 1).toUpperCase()))),
        ),
      ),
      onTap: () async {
        onTop!();
      },
    );
  }
}
