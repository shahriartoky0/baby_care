class TimerMeasureClass {
  final int leftBreastTime;
  final int rightBreastTime;
  final int totalTime;
  final DateTime registeredTime;

  // Constructor
  TimerMeasureClass({
    required this.leftBreastTime,
    required this.rightBreastTime,
    required this.totalTime,
    DateTime? registeredTime,
  }) : registeredTime = registeredTime ?? DateTime.now();
}
