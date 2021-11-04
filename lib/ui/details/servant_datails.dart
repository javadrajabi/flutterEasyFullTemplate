import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ServantDetails extends StatefulWidget {
  const ServantDetails({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<ServantDetails> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'مرکز پروفایل',
          style: TextStyle(color: Colors.blue, fontSize: 18),
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
          // width: MediaQuery.of(context).size.width*0.9,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'گروه خدمت : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(' ')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'گروه خدمت : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Container(
                      // color:Colors.white  ,
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'رونمایی از رباتهای خانگی و اسپیکر هوشمند ، ترفند های استفاده از گلکسی نوت هشت پرو . '))
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'ادرس : ',
                    style: TextStyle(color: Colors.black54),
                  ),

                      Container(
                        // color:Colors.white  ,
                          width: MediaQuery.of(context).size.width*0.7,
                          padding: const EdgeInsets.all(8.0),
                          child:
                       Text(
                          'ساری ، کمربندی غربی، حدفاصل میدان امام و خزر، جنب موسسه قرض الحسنه محمد رسول الله ، شرکت دورنیکا '))
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'استان : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('مازندران ')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'شهر : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('شهرستان ')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'شیفت صبح : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('دوشنبه ،شنبه،یکشنبه،سه شنبه،چهارشنبه')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'شیفت عصر : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('دوشنبه ،پنج شنبه،سه شنبه،چهارشنبه')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'شیفت شب : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('پنجشنبه،جمعه،سه شنبه،چهارشنبه')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'توضیحاتی ندارد : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('پنجشنبه،جمعه،سه شنبه،چهارشنبه')
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'نوبت دهی : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text('نیاز به تایید')
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo1.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
