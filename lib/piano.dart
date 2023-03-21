import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

enum KeyColor { white, black }

final player = AudioPlayer();

class PianoKey extends StatelessWidget {
  final KeyColor color;
  final double width;
  final String keyAudio;

  const PianoKey.white({
    super.key,
    required this.width,
    required this.keyAudio,
  }) : color = KeyColor.white;

  const PianoKey.black({
    super.key,
    required this.width,
    required this.keyAudio,
  }) : color = KeyColor.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => player.play(DeviceFileSource("assets/$keyAudio")),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: color == KeyColor.white ? Colors.white : Colors.black,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
      ),
    );
  }
}

class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  PianoState createState() => PianoState();
}

class PianoState extends State<Piano> {
  _buildwhiteKeys(double whiteKeySize) {
    return Row(
      children: [
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key08.mp3",
        ),
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key10.mp3",
        ),
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key12.mp3",
        ),
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key13.mp3",
        ),
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key15.mp3",
        ),
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key17.mp3",
        ),
        PianoKey.white(
          width: whiteKeySize,
          keyAudio: "key19.mp3",
        )
      ],
    );
  }

  _buildblackKeys(
      double pianoHeight, double blackKeySize, double whiteKeySize) {
    return SizedBox(
      height: pianoHeight * 0.55,
      child: Row(
        children: [
          SizedBox(
            width: whiteKeySize - blackKeySize / 2,
          ),
          PianoKey.black(
            width: blackKeySize,
            keyAudio: "key09.mp3",
          ),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            keyAudio: "key11.mp3",
          ),
          SizedBox(
            width: whiteKeySize,
          ),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            keyAudio: "key14.mp3",
          ),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            keyAudio: "key16.mp3",
          ),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            keyAudio: "key18.mp3",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final whiteKeySize = constraints.maxWidth / 7;
        final blackKeySize = whiteKeySize / 2;
        return Stack(
          children: [
            _buildwhiteKeys(whiteKeySize),
            _buildblackKeys(constraints.maxHeight, blackKeySize, whiteKeySize),
          ],
        );
      },
    );
  }
}
