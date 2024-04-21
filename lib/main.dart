import 'package:flutter/material.dart';
import 'services/painter.dart';
import 'services/point.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Drawing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
        ),
      ),
      home: const DrawingApp(),
    )
  );
}

class DrawingApp extends StatefulWidget {
  const DrawingApp({super.key});

  @override
  State<DrawingApp> createState() => _DrawingAppState();
}

class _DrawingAppState extends State<DrawingApp> {
  Point? point;
  List<Point> curve = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing App'),
      ),
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            point = Point(
                offsets: [details.localPosition]
            );

            if (point == null) return;
            curve.add(point!);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            if (point == null) return;

            point = point?.copyWith(
                offsets: point!.offsets..add(details.localPosition));
            curve.last = point!;
          });
        },
        onPanEnd: (_) {
          point = null;
        },
        child: CustomPaint(
          painter: Painter(
            curve: curve
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      )
    );
  }
}
