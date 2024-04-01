// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class SensorDataProvider {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final _accelerometerEventController =
      StreamController<AccelerometerEvent>.broadcast();

  void startListening() {
    print("comecou a escutar");
    _accelerometerSubscription = accelerometerEvents.listen(
      (event) => _accelerometerEventController.add(event),
      onDone: () => print('Stream done'),
      onError: (error) => print('Stream error: $error'),
    );
  }

  void listenHate1s() {
    _accelerometerSubscription =
        accelerometerEventStream(samplingPeriod: Duration(seconds: 1))
            .listen(
      (event) => _accelerometerEventController.add(event),
    );
  }

  Stream<AccelerometerEvent> get accelerometerStream =>
      _accelerometerEventController.stream;

  void stopListening() {
    print("cancelou");
    _accelerometerSubscription?.cancel();
    _accelerometerEventController.close();
  }
}
