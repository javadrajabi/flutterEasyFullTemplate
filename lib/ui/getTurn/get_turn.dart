import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/ui/getTurn/widget/turn.dart';
import 'package:provider/provider.dart';

class GetTurn extends StatefulWidget {
  const GetTurn({Key? key}) : super(key: key);

  @override
  _GetTurnState createState() => _GetTurnState();
}

class _GetTurnState extends State<GetTurn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration(seconds: 1)).then((_) {
    //   print('Future.delayed');
    Provider.of<HomeP>(context, listen: false).getServicesProvider({});
    // you code with context here
    // });
  }

// @override
// void didChangeDependencies() {
//   context.watch<HomeP>().getServices({});
//   super.didChangeDependencies();
// }

  List selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                childAspectRatio: 5 / 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemCount: context.watch<HomeP>().filterdedServices?.length ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              return Turn(
                name:
                    context.watch<HomeP>().filterdedServices![index].name ?? '',
                isLeft: index.remainder(2) == 0,
                onChange: (res) {
                  setState(() {
                    if (res) {
                      selectedServices.add(
                          context.read<HomeP>().filterdedServices![index].id);
                    } else {
                      selectedServices.removeWhere((element) =>
                      element ==
                          context.read<HomeP>().filterdedServices![index].id);
                    }
                    print(selectedServices);
                  });
                },
              );
            }),
        if (selectedServices.length != 0)
          Padding(
            padding: EdgeInsets.only(bottom: 70, right: 20, left: 20),
            child: InkWell(
              onTap: () async {
                Navigator.of(context).pushNamed('/services',arguments:selectedServices );
              },
              child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'ادامه',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),
            ),
          ),
      ],
    );
  }
}
