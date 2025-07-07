class TimerMeasureClass {
  final int leftBreastTime;
  final int rightBreastTime;
  final int totalTime;
  final DateTime registeredTime;
  final DateTime? pressedTime;
  final DateTime? sleepStopTime;

  // Constructor
  TimerMeasureClass({
    required this.leftBreastTime,
    required this.rightBreastTime,
    required this.totalTime,
    this.pressedTime,
    this.sleepStopTime,
    DateTime? registeredTime,
  }) : registeredTime = registeredTime ?? DateTime.now();
}
