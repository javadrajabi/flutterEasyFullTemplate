import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/provider/homeProvider.dart';
import 'package:template/ui/get_service/widget/service_record.dart';

class Services extends StatefulWidget {

  final selectedService;
  const Services({Key? key,required this.selectedService}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.selectedService);
    Provider.of<HomeP>(context, listen: false).getSpecialServicesProvider(widget.selectedService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "سروریس دهنده",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<(context.watch<HomeP>().specialServicesProviders?.length??0);i++)
            ServiceRecord(

              onTop:(){
                print(context.read<HomeP>().specialServicesProviders![i].toJson());
                Navigator.of(context).pushNamed('/selectTurnDate',arguments: {
                  "services-providers": context.read<HomeP>().specialServicesProviders![i],
                  "selected-service":widget.selectedService
                      });
              },
              title: context.read<HomeP>().specialServicesProviders![i].name??'',
              text: context.read<HomeP>().specialServicesProviders![i].description??'...',
            ),
          ],
        ),
      ),
    );
  }
}
