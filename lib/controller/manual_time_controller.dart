import 'package:get/get.dart';

class ManualTimeController extends GetxController {
  Rx<DateTime> startLeftTime = DateTime.now().obs;
  Rx<DateTime> endLeftTime = DateTime.now().obs;
  Rx<DateTime> startRightTime = DateTime.now().obs;
  Rx<DateTime> endRightTime = DateTime.now().obs;
  Rx<Duration> leftDuration = Duration.zero.obs;
  Rx<Duration> rightDuration = Duration.zero.obs;

  String get totalDuration {
    // Don't modify observables in getter - just read them
    final Duration totalDuration = leftDuration.value + rightDuration.value;
    final int hours = totalDuration.inHours;
    final int minutes = totalDuration.inMinutes % 60;
    return '$hours hours $minutes mins';
  }

  // Calculate durations whenever times are updated
  void _calculateDurations() {
    leftDuration.value = endLeftTime.value.difference(startLeftTime.value);
    rightDuration.value = endRightTime.value.difference(startRightTime.value);
  }

  // Method to update start time for left side
  Future<void> updateStartLeftTime(DateTime time) async {
    startLeftTime.value = time;
    _calculateDurations();
  }

  // Method to update end time for left side
  Future<void> updateEndLeftTime(DateTime time) async {
    endLeftTime.value = time;
    _calculateDurations();
  }

  // Method to update start time for right side
  Future<void> updateStartRightTime(DateTime time) async {
    startRightTime.value = time;
    _calculateDurations();
  }

  // Method to update end time for right side
  Future<void> updateEndRightTime(DateTime time) async {
    endRightTime.value = time;
    _calculateDurations();
  }
}