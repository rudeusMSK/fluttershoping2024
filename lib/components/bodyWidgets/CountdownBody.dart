// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final String hh;
  final String mm;
  final String ss;

  AttendanceScreen({required this.hh, required this.mm, required this.ss});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  //static var countdownDuration = Duration(minutes: 10);
  static var countdownDuration1 = const Duration(minutes: 10);
  //Duration duration = Duration();
  Duration duration1 = const Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {

    var hours1;
    var mints1;
    var secs1;
    hours1 = int.parse(widget.hh);
    mints1 = int.parse(widget.mm);
    secs1 = int.parse(widget.ss);
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
    //color: Color.fromARGB(255, 255, 255, 255), // Đặt màu nền cho toàn bộ Container
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        "Sale 50%",
      style:  TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 168, 15, 15),
      fontSize: 25),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTime1(),
        ],
      ),
    ],
      ),
    );
}


  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = const Duration());
    }
  }

  void startTimer1() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime1());
  }

  void addTime1() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration1.inHours);
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
        buildTimeCard(time: hours, header: 'HOURS'),
         SizedBox(
          width: 8,
        ),
        buildTimeCard(time: minutes, header: 'MINUTES'),
         SizedBox(
          width: 8,
        ),
        buildTimeCard(time: seconds, header: 'SECONDS'),
         SizedBox(
          width: 8,
        ),
      ]),
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              //  color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(header, style: const TextStyle(color: Colors.black45)),
        ],
      );
}
