import 'package:audioplayers/audioplayers.dart';
import 'package:beable/providers/toefl_vocabulary/tv_part1_level1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class tvquestion4 extends StatefulWidget {
  const tvquestion4({super.key});

  @override
  State<tvquestion4> createState() => _tvquestion4State();
}

class _tvquestion4State extends State<tvquestion4> {
  int selected_step = 0;

  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  int second = 0;
  Widget customRadioBorder(
    int index, {
    required String text,
  }) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<Tv_Part1_Level1Info>().setTexts4(value4: ('$index'));
          setState(() => selected_step = index);
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: selected_step == index ? Colors.blue : Colors.black38,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 80,
          //width: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Century Gothic',
                          fontSize: 20,
                          color: selected_step == index
                              ? Colors.blue
                              : Colors.grey,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customaudioplayer({required String audio}) {
    player.setSourceAsset(audio);

    player.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime =
            '0${(duration.inSeconds / 60).floor()}:${duration.inSeconds % 60}';
      });
    });
    player.onPositionChanged.listen((event) {
      setState(() {
        second = event.inSeconds;
        currentTime = '0${event.inMinutes}:$second';
      });
      if (second >= 60) {
        setState(() {
          second = event.inSeconds - 60;
          currentTime = '0${event.inMinutes}:$second';
        });
      }
    });

    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 50),
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(80),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          player.pause();

                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          player.resume();

                          print(player.getDuration());
                          print(player.getCurrentPosition());
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      }),
                  IconButton(
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      player.stop();

                      setState(() {
                        isPlaying = false;
                      });
                    },
                  ),
                  Text(
                    "   $currentTime",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    " | ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    completeTime,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool buttonaudio = false;
    return Column(
      children: <Widget>[
        Image.asset('assets/toefl_vocabulary/part1_level1/tv_question4.png',
            height: 200, fit: BoxFit.contain),
        customaudioplayer(
            audio: 'toefl_vocabulary/part1_level1/tv_question4.mp3'),
        SizedBox(
          height: 20,
        ),
        Title(
          color: Colors.black,
          child: Text(
            "Why does the studen go to see the professor ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        customRadioBorder(1,
            text: "To ask the professor to be her club's advisor"),
        SizedBox(height: 20),
        customRadioBorder(2,
            text:
                "To get advice about choosing a topic for an upcoming seminar"),
        SizedBox(height: 20),
        customRadioBorder(3,
            text: "To receive feedback on her recent presentation"),
        SizedBox(height: 20),
        customRadioBorder(4,
            text: "To get permission from the professor to form a club"),
      ],
    );
  }
}
