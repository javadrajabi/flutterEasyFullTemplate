import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/widget/switch/custom_switch.dart';

enum ItemType {
  Switch,
  More,
  Normal,
}
class SettingItem extends StatefulWidget {

  String title;
  bool? value;
  Function onTap;
  ItemType? type;
  SettingItem({Key? key,this.value,required this.title,required this.onTap,this.type}) : super(key: key);

  @override
  _SettingItemState createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {

  ItemType type=ItemType.Switch;
  bool isSwitched=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    type=widget.type??ItemType.Switch;
    isSwitched=widget.value??false;

  }

  @override
  Widget build(BuildContext context) {

      if(type==ItemType.Switch)
        return Container(

          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          // width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,style: TextStyle(color: MyColors.gray),),
              // Switch(
              //   value: isSwitched,
              //   onChanged: (value) {
              //     setState(() {
              //       isSwitched = value;
              //       print(isSwitched);
              //     });
              //   },
              //   activeTrackColor: Colors.yellow,
              //   activeColor: Colors.orangeAccent,
              // ),
              CustomMySwitch(switchBorder: Border.all( color: isSwitched ?MyColors.amber:MyColors.gray, width: 1, ),
                width: 35.0,
                height: 20.0,

                // valueFontSize: 25.0,
                // toggleSize: 45.0,
                value: isSwitched,

                activeText: '',
                inactiveText: '',
                toggleSize: 10,
                activeToggleColor: MyColors.amber,
                inactiveToggleColor: MyColors.gray,
                // borderRadius: 30.0,
                // padding: 8.0,
                inactiveColor: Colors.transparent,
                activeColor: Colors.transparent,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    isSwitched = val;
                  });
                  widget.onTap(val);
                },
              )

            ],
          ),
        );
      else if(type==ItemType.More)
        return InkWell(
          onTap: (){
            widget.onTap(true);
          },
          child: Container(

            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            // width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,style: TextStyle(color: MyColors.gray),),
                Icon(MyIcon.arrow___left_2)
              ],
            ),
          ),
        );
      else
        return InkWell(
          onTap: (){
            widget.onTap(true);
          },
          child: Container(

            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            // width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: MyColors.indigo, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,style: TextStyle(color: MyColors.gray),),

              ],
            ),
          ),
        );

  }
}
