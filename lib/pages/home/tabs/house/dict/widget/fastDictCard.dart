import 'package:flutter/material.dart';
import 'package:template/config/themes/my_drawing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'playSound.dart';

enum FastDictFromTo { ENtoFA, FAtoEN }

class FastDictCard extends StatefulWidget {
  String word;
  String phonotic;
  List sounds;
  List means;
  String wordType;
  Function? onSelect;
  FastDictFromTo fromTo;

  FastDictCard(
      {Key? key,
      required this.word,
      required this.phonotic,
      required this.sounds,
      required this.means,
      required this.wordType,
      this.onSelect,
      required this.fromTo})
      : super(key: key);

  @override
  _FastDictCardState createState() => _FastDictCardState();
}

class _FastDictCardState extends State<FastDictCard> {
  List selectedMeans = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.indigo,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Directionality(
            // use this
            textDirection: widget.fromTo == FastDictFromTo.ENtoFA
                ? TextDirection.ltr
                : TextDirection.rtl, // set it to rtl
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(
                widget.word,
                style: TextStyle(color: MyColors.amber),
              ),
              subtitle: widget.phonotic != ''
                  ? Text(
                      widget.phonotic,
                      style:
                          TextStyle(color: MyColors.gray, fontFamily: 'Roboto'),
                    )
                  : null,
            ),
          ),
          if (widget.sounds.length > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < widget.sounds.length; i++)
                  InkWell(
                    child: Icon(widget.sounds[i]['type'] == 'us'
                        ? Icons.volume_up_sharp
                        : Icons.record_voice_over),
                    onTap: () {
                      PlaySound(widget.sounds[i]['url']);
                    },
                  )
              ],
            ),
          if (widget.wordType!= '')
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(widget.wordType),
            ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Wrap(
              children: [
                for (int i = 0; i < widget.means.length; i++)
                  FilterChip(backgroundColor: MyColors.cyanLite,
                    selectedColor: MyColors.amber.withOpacity(0.3),
                    label: Text(widget.means[i]),
                    selected: selectedMeans.contains(widget.means[i]),
                    onSelected: (bool value) {
                      setState(() {
                        selectedMeans.contains(widget.means[i])
                            ? selectedMeans.remove(widget.means[i])
                            : selectedMeans.add(widget.means[i]);
                      });
                    },
                  )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              launch('https://fastdic.com/word/' + widget.word);
            },
            child: Row(
              children: [
                Spacer(),
                Text(' مشاهده در سایت منبع '),
                Text(
                  'fastdic.com',
                  style: TextStyle(color: MyColors.orange),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10))

          // Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: SelectableText(
          //     'معانی دیگر: کلام، آگهداد، پیام، اطلاع، شایعه، زبانزد، حکم، دستور، پیمان، (w بزرگ - با the) کلام الله، کتاب مقدس، انجیل (the word of god هم می گویند)، (جمع) متن (در برابر مثلا موسیقی)، مطلب، (جمع) مشاجره، محاجه، دعوای لفظی، بگومگو، حرف ناخوشایند، (کامپیوتر) واژ، (با واژه) بیان کردن، در قالب لغت ریختن، به لفظ درآوردن، رجوع شود به: password، (قدیمی) ضرب المثل، گفته، (قدیمی) حرف زدن، سخن گفتن، عبارت',
          //     style: TextStyle(color: MyColors.gray),
          //   ),
          // ),
          // ButtonBar(
          //   alignment: MainAxisAlignment.start,
          //   children: [
          //     FlatButton(
          //       textColor: MyColors.orange,
          //       onPressed: () {
          //         // Perform some action
          //       },
          //       child: Text('معانی بیشتر'),
          //     ),
          //     FlatButton(
          //       textColor: MyColors.orange,
          //       onPressed: () {
          //         // Perform some action
          //       },
          //       child: Text('جملات مرتبط'),
          //     ),
          //     FlatButton(
          //       textColor: MyColors.orange,
          //       onPressed: () {
          //         // Perform some action
          //       },
          //       child: Text('مترادف'),
          //     ),
          //     FlatButton(
          //       textColor: MyColors.orange,
          //       onPressed: () {
          //         // Perform some action
          //       },
          //       child: Text('به انگلیسی'),
          //     ),
          //   ],
          // ),
          // Image.asset('assets/card-sample-image.jpg'),
          // Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
