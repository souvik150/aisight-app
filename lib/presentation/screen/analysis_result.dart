import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../components/graph.dart';

class AnalysisResult extends StatefulWidget {
  const AnalysisResult({super.key});

  @override
  State<StatefulWidget> createState() => AnalysisResultState();
}

class AnalysisResultState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Result'),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: const [
            Graph(),
          ],
        ),
      ),
    );
  }
}
