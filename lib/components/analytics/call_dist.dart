import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CallTimeDistribution extends StatefulWidget {
  final List<String> labels;
  final List<int> values;

  const CallTimeDistribution(
      {super.key, required this.values, required this.labels});

  @override
  State<CallTimeDistribution> createState() => _CallTimeDistributionState();
}

class _CallTimeDistributionState extends State<CallTimeDistribution> {
  final List<BarChartGroupData> barGroups = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 8,
        )
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: 10,
        )
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 14,
        )
      ],
    ),
  ];

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      // color: AppColors.contentColorBlue.darken(20),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Morning';
        break;
      case 1:
        text = 'Afternoon';
        break;
      case 2:
        text = 'Evening';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.0,
      height: 300.0,
      child: BarChart(
        BarChartData(
          // barTouchData: barTouchData,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: getTitles,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          // borderData: borderData,

          barGroups: barGroups,
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
        ),
      ),
    );
  }
}
