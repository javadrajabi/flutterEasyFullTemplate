import 'package:flutter/material.dart';


class GetTurnAppBar extends StatefulWidget with PreferredSizeWidget{
  final Function onClose;
  final Function(String) onTextSearch;

  const GetTurnAppBar({Key? key,required this.onClose,required this.onTextSearch}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(110);
}

class _HomeAppBarState extends State<GetTurnAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // automaticallyImplyLeading: false,
      // toolbarHeight: 150,
      title: Center(child: Text('نوع خدمت',style: TextStyle(color: Colors.blue),)),
      bottom:PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          // height: 200 ,
            margin: EdgeInsets.symmetric(vertical: 5),
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
              onChanged: widget.onTextSearch,
            ),
          ),
      ),
      // leading: IconButton(icon: Icon(Icons.close,color: Colors.blue,), onPressed: () {}),
      actions: [
        IconButton(icon: Icon(Icons.close,color: Colors.blue,), onPressed: () {
          widget.onClose();
        }),
      ],
    );






  }
}
