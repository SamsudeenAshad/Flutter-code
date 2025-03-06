import 'dart:math';

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
      title: 'Mini Cricket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bat = Random().nextInt(7);
  int ball = 6;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Cricket'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              spacing: 5,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                          "https://png.pngtree.com/png-clipart/20240625/original/pngtree-cricket-bat-vector-illustration-clipart-isolsted-background-png-image_15408136.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                      Text("Bat", style: TextStyle(color: Colors.white)),
                      Text(
                        bat.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                          "https://img.pikbest.com/png-images/20241017/isolated-cricket-ball-vector-color-version_10960413.png!w700wp",
                        ),
                      ),
                      Text("Ball", style: TextStyle(color: Colors.white)),
                      Text(
                        ball.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Total Score: $total",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            (ball > 0)
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ball -= 1;
                        total += bat;
                        bat = Random().nextInt(7);
                      });
                    },
                    child: Text("Hit", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bat = Random().nextInt(7);
                        ball = 6;
                        total = 0;
                      });
                    },
                    child: Text("Reset", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
