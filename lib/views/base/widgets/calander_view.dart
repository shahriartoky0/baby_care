import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';

class CalendarView extends StatefulWidget {
  final DateTime dateSelected;

  const CalendarView({super.key, required this.dateSelected});

  @override
  State createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime selectedDay;

  // DateTime selectedDay = DateTime.now();
  DateTime _focusedWeekStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Set focused week to start from Monday
    _focusedWeekStart = _getWeekStart(DateTime.now());
    selectedDay = widget.dateSelected;
  }

  DateTime _getWeekStart(DateTime date) {
    // Get Monday of the week containing the date
    final int daysSinceMonday = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysSinceMonday);
  }

  List<DateTime> _getWeekDays() {
    final List<DateTime> days = <DateTime>[];
    for (int i = 0; i < 7; i++) {
      days.add(_focusedWeekStart.add(Duration(days: i)));
    }
    return days;
  }

  void _goToPreviousWeek() {
    setState(() {
      _focusedWeekStart = _focusedWeekStart.subtract(const Duration(days: 7));
    });
  }

  void _goToNextWeek() {
    setState(() {
      _focusedWeekStart = _focusedWeekStart.add(const Duration(days: 7));
    });
  }

  void _goToToday() {
    setState(() {
      selectedDay = DateTime.now();
      _focusedWeekStart = _getWeekStart(DateTime.now());
    });
  }

  void _showYearPicker() async {
    final int currentYear = _focusedWeekStart.year;
    final int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Year', style: Theme.of(context).textTheme.headlineMedium),
          content: SizedBox(
            width: double.minPositive,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              selectedDate: DateTime(currentYear),
              onChanged: (DateTime dateTime) {
                Navigator.of(context).pop(dateTime.year);
              },
            ),
          ),
        );
      },
    );

    if (selectedYear != null) {
      setState(() {
        _focusedWeekStart = DateTime(selectedYear, _focusedWeekStart.month, _focusedWeekStart.day);
        selectedDay = DateTime(selectedYear, selectedDay.month, selectedDay.day);
      });
    }
  }

  void _showDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDay,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        selectedDay = selectedDate;
        _focusedWeekStart = _getWeekStart(selectedDate);
      });
    }
  }

  bool _isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year && day1.month == day2.month && day1.day == day2.day;
  }

  bool _isToday(DateTime date) {
    final DateTime today = DateTime.now();
    return _isSameDay(date, today);
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> weekDays = _getWeekDays();
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        // Header with month/year and navigation
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 80),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: _showYearPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        DateFormat('MMMM yyyy').format(_focusedWeekStart),
                        style: textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(width: 50,),
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: AppColors.iconBackground,
                  child: Icon(Icons.chevron_left),
                ),
                onPressed: _goToPreviousWeek,
              ),
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: AppColors.iconBackground,
                  child: Icon(Icons.chevron_right),
                ),
                onPressed: _goToNextWeek,
              ),
            ],
          ),
        ),

        // 7-day calendar
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.4),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: <Widget>[
              // Day headers
              Row(
                children:
                    <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .map(
                          (String day) => Expanded(
                            child: Center(
                              child: Text(
                                day,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 16),

              // Date row
              Row(
                children:
                    weekDays.map((DateTime date) {
                      final bool isSelected = _isSameDay(date, selectedDay);
                      final bool isToday = _isToday(date);

                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDay = date;
                            });
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? AppColors.primaryColor
                                      : isToday
                                      ? AppColors.grey
                                      : Colors.transparent,
                              shape: BoxShape.circle,
                              border:
                                  isToday && !isSelected
                                      ? Border.all(color: AppColors.greenColor, width: 2)
                                      : null,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : isToday
                                          ? AppColors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),

        // Selected date info
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomSvgImage(
                assetName: AppIcons.calendarIcon,
                color: AppColors.primaryColor,
                height: 24,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Selected Date',
                        style: TextStyle(fontSize: 12, color: AppColors.grey),
                      ),
                      const SizedBox(width: 90),
                      TextButton.icon(
                        onPressed: _goToToday,
                        icon: const Icon(Icons.calendar_today, color: AppColors.medicineCardColor),
                        label: Text('Today', style: textTheme.labelSmall),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          // padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat('EEEE, MMMM d, yyyy').format(selectedDay),
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Quick navigation buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _showDatePicker,
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Pick Date'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}
