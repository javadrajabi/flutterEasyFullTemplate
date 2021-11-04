import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/provider/notifProvider.dart';
import 'package:template/ui/home/tab/widgets/notifCard.dart';

class NotifList extends StatelessWidget {

  const NotifList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(context.watch<NotifP>().notifList);
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
            Icon(Icons.notifications_none,size: 30,color: Colors.blue,),
            SizedBox(width: 10),
            Text(
              'اعلانات',
              style: TextStyle(
                color: Colors.blue,
                // fontSize: 16,
              ),
            ),
          ],
        ),

      ),
      body: (context.watch<NotifP>().notifList!= null && (context.watch<NotifP>().notifList?.length??0)>0 )?ListView.builder(
        itemCount: context.watch<NotifP>().notifList?.length??0,
        itemBuilder: (context, i){
       return   NofifCard(text: context.watch<NotifP>().notifList![i].details??'',date:context.watch<NotifP>().notifList![i].createdAt?? '',);
        },
      ):
      Center(child: Text('اعلانی وجود ندارد!'))
      ,
    );
  }
}
