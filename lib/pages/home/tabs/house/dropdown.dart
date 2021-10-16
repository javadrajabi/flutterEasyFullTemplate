import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:template/models/status/Device.dart';
import 'package:template/models/status/Imei.dart';
import 'package:template/widget/overlayContainer/overlay_container.dart';

class DropDownW extends StatefulWidget {
  final Function onChange;
  final Function onTap;
  final Imei? selectedImei;
  final List<Device>? options;

  const DropDownW(
      {Key? key,
      this.selectedImei,
      required this.options,
      required this.onChange,
      required this.onTap,
      })
      : super(key: key);

  @override
  _DropDownWState createState() => _DropDownWState();
}

class _DropDownWState extends State<DropDownW> {
  bool _dropdownShown = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        widget.onTap();
        setState(() {
          _dropdownShown = !_dropdownShown;
        });
      },
      child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 10),
          // width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: MyColors.indigo,
              //new Color.fromRGBO(255, 0, 0, 0.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'نام دستگاه:',
                style: TextStyle(fontSize: 12, color: MyColors.gray),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.selectedImei!.name ?? '',
                      // style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      MyIcon.arrow___down_2,
                      size: 16,
                    )
                  ],
                ),
              ),
              OverlayContainer(
                show: _dropdownShown,
                asWideAsParent: true,
                // Let's position this overlay to the right of the button.
                position: OverlayContainerPosition(
                  // Left position.
                  0,
                  // Bottom position.
                  -10,
                ),
                // The content inside the overlay.
                child: Container(
                  // height: 70,
                  decoration: BoxDecoration(
                    color: MyColors.cyanLite,
                    //new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 15,
                        offset: Offset(0, 15), // changes position of shadow
                      ),
                    ],
                  ),

                  // padding: const EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      if (widget.options != null)
                        for (int i = 0; i < widget.options!.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                _dropdownShown = !_dropdownShown;
                              });
                              widget.onChange(widget.options![i]);

                            },
                            child: ListTile(
                              title: Text(widget.options![i].imei!.name ?? ''),
                            ),
                          ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
