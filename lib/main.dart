import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var my_list1 = ['rock', 'paper', 'scissor'];
  var my_list2 = ['rock', 'paper', 'scissor'];
  String winner = 'Who is winner?';

  void random() {
    my_list1.shuffle();
  }

  void random2() {
    my_list2.shuffle();
  }

  void play() {
    if (my_list1[0] == 'rock' && my_list2[0] == 'paper') {
      winner = 'Player two is winner';
    } else if (my_list1[0] == 'paper' && my_list2[0] == 'scissor') {
      winner = 'Player two is winner';
    } else if (my_list1[0] == 'scissor' && my_list2[0] == 'rock') {
      winner = 'Player two is winner';
    } else if (my_list1[0] == 'paper' && my_list2[0] == 'rock') {
      winner = 'Player one is winner';
    } else if (my_list1[0] == 'scissor' && my_list2[0] == 'paper') {
      winner = 'Player one is winner';
    } else if (my_list1[0] == 'rock' && my_list2[0] == 'scissor') {
      winner = 'Player one is winner';
    } else {
      winner = 'Tie';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock-Paper-Scissors'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(winner),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Player1'),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          random();
                          play();
                        });
                      },
                      child: Image(
                          width: 200,
                          height: 200,
                          image: AssetImage('./images/${my_list1[0]}.jpg'))),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Player2'),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          random2();
                          play();
                        });
                      },
                      child: Image(
                          width: 200,
                          height: 200,
                          image: AssetImage('./images/${my_list2[0]}.jpg'))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
