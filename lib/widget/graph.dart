import 'dart:async';
import 'dart:math';
import 'package:ehealthapp/features/fall_detector/data/datasources/acelerometer_sensor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:ehealthapp/util/colors.dart';

class LineChartSample2 extends StatefulWidget {
  final SensorDataProvider sensorDataProvider;
  //SensorDataProvider get sensorDataProviders => sensorDataProvider;

  const LineChartSample2({super.key, required this.sensorDataProvider});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];
  List<FlSpot> sensorDataSpots = [];
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  //bool showAvg = false;
  List<FlSpot> sensorDataSpotsX = []; // Valores do eixo X
  List<FlSpot> sensorDataSpotsY = []; // Valores do eixo Y
  List<FlSpot> sensorDataSpotsZ = []; // Valores do eixo Z

  @override
  void initState() {
    super.initState();

    widget.sensorDataProvider.startListening(); // Certifique-se de que a escuta foi iniciada
    _accelerometerSubscription =
        widget.sensorDataProvider.accelerometerStream.listen((event) {
      print('$event');
      setState(() {
        double nextIndex =
            (sensorDataSpots.isNotEmpty ? sensorDataSpots.last.x + 1 : 0);
        double newX = nextIndex.clamp(0, 60);
        double newY = event.x.clamp(-3, 9);
        sensorDataSpots.add(FlSpot(newX, newY));

        if (newX >= 60) {
          sensorDataSpots.clear();
          sensorDataSpots.add(FlSpot(0, event.x.clamp(-3, 9))); // Limpa os pontos existentes
          nextIndex = 0;
          
        }
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 18, left: 12, top: 24, bottom: 12),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    // Aqui você pode formatar o valor como desejar, por exemplo, mostrando apenas valores inteiros para segundos
    String text = '${value.toInt()}s';

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    // Formatar o valor de aceleração. Aqui estamos assumindo que os valores já estão na escala desejada.
    // Você pode adicionar lógica para ajustar a unidade ou formato conforme necessário.
    String text = '${value.toStringAsFixed(1)}m/s²';

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 100,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.contentColorBlue,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppColors.contentColorCyan,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 30,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 9,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: AppColors.primaryColor, width: 0.7),
      ),
      minX: 0,
      maxX: 60,
      minY: -9,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          spots: sensorDataSpots,
          isCurved: true,
          color: AppColors.contentColorBlue,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: ColorTween(
              begin: gradientColors[0].withOpacity(0.3),
              end: gradientColors[1].withOpacity(0.3),
            ).transform(0.5),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    List<FlSpot> avgSpots = [];
    for (int i = 0; i < sensorDataSpotsX.length; i++) {
      // Acessa os valores de x, y e z para o ponto i
      double x = sensorDataSpotsX[i]
          .y; // Usando .y aqui porque FlSpot usa x para o índice e y para o valor
      double y = sensorDataSpotsY[i].y; // A mesma lógica se aplica aqui
      double z = sensorDataSpotsZ[i].y; // E aqui

      double magnitude =
          sqrt(x * x + y * y + z * z); // Cálculo da magnitude vetorial
      avgSpots.add(FlSpot(i.toDouble(), magnitude));
    }

    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: avgSpots,
          isCurved: true,
          color: AppColors.contentColorBlue,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: ColorTween(
              begin: gradientColors[0].withOpacity(0.3),
              end: gradientColors[1].withOpacity(0.3),
            ).transform(0.5),
          ),
        ),
      ],
      // Restante das configurações...
    );
  }
}
