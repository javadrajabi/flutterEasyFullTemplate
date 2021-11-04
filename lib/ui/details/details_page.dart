import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.blue,
          ),
        ),
        
        title: Text(
          'جزییات نوبت',
          style: TextStyle(color: Colors.blue,fontSize: 18),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: TextButton(onPressed: (){}, child: Text('لغو نوبت', style: TextStyle(color: Colors.red),)),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color:Colors.white  ,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.yellow,Colors.orange], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      // boxShadow: <BoxShadow>[
                      //   BoxShadow(
                      //       color: FitnessAppTheme.grey.withOpacity(0.6),
                      //       offset: const Offset(1.1, 1.1),
                      //       blurRadius: 10.0),
                      // ],
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text('خدمت گیرنده',style: TextStyle(color: Colors.black54,fontSize: 16),),
                    Image.asset('assets/logo1.png',width: 35,),
                    Text('جواد رجبی',style: TextStyle(color: Colors.black45,fontSize: 12)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment,
                      children: [
                        Text('09119541821',style: TextStyle(color: Colors.black45,fontSize: 12)),IconButton(onPressed: (){

                        }, icon: Icon(Icons.call,color: Colors.green,)),
                      ],
                    )
                  ],),
                ),

                  Container(

                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.blue,Colors.lightBlueAccent], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight:Radius.circular(30.0) ),
                      // boxShadow: <BoxShadow>[
                      //   BoxShadow(
                      //       color: FitnessAppTheme.grey.withOpacity(0.6),
                      //       offset: const Offset(1.1, 1.1),
                      //       blurRadius: 10.0),
                      // ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('خدمت دهنده',style: TextStyle(color: Colors.black54,fontSize: 16),),
                        Image.asset('assets/logo1.png',width: 35,),
                        Text('Dornica',style: TextStyle(color: Colors.black45,fontSize: 12)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('01134722589',style: TextStyle(color: Colors.black45,fontSize: 12)),IconButton(onPressed: (){

                            }, icon: Icon(Icons.call,color: Colors.green,)),
                          ],
                        )
                      ],),
                  ),

              ],),
              SizedBox(
                width: double.infinity, // <-- match_parent
                child:  TextButton(

                  onPressed: () {

                    // Navigator.of(context).push(route)
                    print('vbvb');
                  },
                  child:Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.red.shade200,Colors.orange.shade200], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(8.0)),
                      ),

                      child: Text('لغو نوبت',style: TextStyle(color: Colors.red),)),
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('سه شنبه 20 مهر 1400 ساعت 20:30')
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('خدمات : داروی مجهز به حسگر های دیجیتالی')
                ],),
              SizedBox(
                width: double.infinity, // <-- match_parent
                child:  TextButton(

                  onPressed: () {

                    Navigator.of(context).pushNamed('/servantDetails');
                    print('vbvb');
                  },
                  child:Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.lightBlueAccent,Colors.blue.shade700], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(8.0)),
                      ),

                      child: Text('نمایش اطلاعات کامل خدمت دهنده',style: TextStyle(color: Colors.white),)),
                ),),
              Divider(),
              Row(children: [
                Text('تاریخ درخواست : ',style: TextStyle(color: Colors.black54),),
                Text('شنبه 17 مهر 1400 ساعت 12:30 ')
              ],),
              Divider(),
              Row(children: [
                Text('وضعیت درخواست : ',style: TextStyle(color: Colors.black54),),
                Text('ثبت شده ')
              ],),
              Divider(),
              Row(children: [
                Text('تاریخ تایید درخواست : ',style: TextStyle(color: Colors.black54),),
                Text('شنبه 17 مهر 1400 ساعت 12:30 ')
              ],),
              Divider(),
              Row(children: [
                Text('وضعیت حضور: ',style: TextStyle(color: Colors.black54),),
                Text('نامشخص ')
              ],),
              Divider(),
              Row(children: [
                Text('تاریخ حضور : ',style: TextStyle(color: Colors.black54),),
                Text(' ')
              ],),
              Divider(),
              Row(children: [
                Text('ادرس : ',style: TextStyle(color: Colors.black54),),
                Text(' ')
              ],),
              Divider(),
                Text('مکان بر روی نقشه : ',style: TextStyle(color: Colors.black54),),
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(36.579625, 53.048533),
                      zoom: 13.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        // subdomains: ['a', 'b', 'c'],
                        attributionBuilder: (_) {
                          return Text("© OpenStreetMap contributors",style: TextStyle(fontSize: 10),);
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(36.579625, 53.048533),
                            builder: (ctx) =>
                                Icon(Icons.pin_drop,color: Colors.red,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
