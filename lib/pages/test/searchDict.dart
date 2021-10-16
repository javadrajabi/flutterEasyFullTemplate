import 'package:flutter/material.dart';
import 'package:template/data/webService/requests/dict.dart';

class SearchDict extends StatefulWidget {
  const SearchDict({Key? key}) : super(key: key);

  @override
  _SearchDictState createState() => _SearchDictState();
}

class _SearchDictState extends State<SearchDict> {

  List words=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: TextField(onChanged: (s)async{
      if(s.length>2){
       ApiDict.GuessTheWordAbadis(s).then((value) {
         setState(() {
           words=value;
         });
       });

      }
    },),),
        body:

        ListView.builder
      (
        itemCount:words.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Text(words[index]);
        }
    )

    );
  }
}
