import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyPiano());
}

class MyPiano extends StatefulWidget {
  @override
  _MyPianoState createState() => _MyPianoState();
}

var audioPlayer = AudioCache();
void PlaySound(int FileNumber) {
  audioPlayer.play('note$FileNumber.wav');
}

List<Color> colorList = <Color>[
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];
List<String> nameButtonList = <String>[
  'Do',
  'Re',
  'Me',
  'Fa',
  'So',
  'Ra',
  'Si',
  ''
];

///利用function來處理行為類似的button陣列
///因為顏色與文字不容易用迴圈來控制
///所以套用陣列來當字典檔處理
List<Widget> GetPianoKeys() {
  List<Widget> results = <Widget>[];
  for (int i = 0; i < 7; i++) {
    results.add(Expanded(
      child: FlatButton(
          color: colorList[i],
          onPressed: () {
            PlaySound(i + 1);
          },
          child: Text(nameButtonList[i])),
    ));
  }
  return results;
}

class _MyPianoState extends State<MyPiano> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: GetPianoKeys()
                  // [
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.red,
                  //       onPressed: () {
                  //         PlaySound(1);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.orange,
                  //       onPressed: () {
                  //         PlaySound(2);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.yellow,
                  //       onPressed: () {
                  //         PlaySound(3);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.green,
                  //       onPressed: () {
                  //         PlaySound(4);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.blue,
                  //       onPressed: () {
                  //         PlaySound(5);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.indigo,
                  //       onPressed: () {
                  //         PlaySound(6);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: FlatButton(
                  //       color: Colors.purple,
                  //       onPressed: () {
                  //         PlaySound(7);
                  //       },
                  //       child: null,
                  //     ),
                  //   ),
                  // ],
                  )),
        ),
      ),
    );
  }
}
