import 'package:flutter/material.dart';
import 'play_button.dart';
import 'techno_screen.dart';
import 'disk.dart';

class Turntable extends StatelessWidget {
  const Turntable({super.key});

  @override
  Widget build(BuildContext context) {
    // might need the playback state to display what's playing on the technoscreen

    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4.0),
        shape: BoxShape.rectangle,
        color: Colors.grey[800],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes the position of the shadow
          ),
        ],
      ),
      child: const Stack(
        children: [
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Align(
          //       alignment: Alignment.topCenter,
          //       child: TechnoScreen(
          //         // Replace TechnoScreen with PlayButton
          //         albumName: 'Welcome,',
          //         artistName: 'Bennett',
          //       )),
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Align(alignment: Alignment.bottomCenter, child: PlayButton()),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Disk(isLeft: true,),
                ),
                Flexible(
                  child: Disk(isLeft: false,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
