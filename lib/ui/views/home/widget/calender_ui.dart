import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:table_calendar/table_calendar.dart';

class StreakCalender extends StatefulWidget {
  final Map<DateTime, int>? datasets;
  final Color color;
  final Function(DateTime completion) updateCompletion;

  const StreakCalender({
    super.key,
    required this.color,
    required this.updateCompletion,
    required this.datasets,
  });

  @override
  State<StreakCalender> createState() => _StreakCalenderState();
}

class _StreakCalenderState extends State<StreakCalender> {
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: 500,
      child: Column(
        children: [
          VerticalSpaceBox.s5,
          TableCalendar(
            firstDay: DateTime.now().subtract(const Duration(days: 180)),
            lastDay: DateTime.now(),
            focusedDay: focusedDay,
            daysOfWeekHeight: 40,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                focusedDay = focusedDay;
              });
              widget.updateCompletion(selectedDay);
            },
            onPageChanged: (newFocusedDay) {
              setState(() {
                focusedDay = newFocusedDay;
              });
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (widget.datasets?.keys
                        .any((element) => isSameDay(element, date)) ??
                    false) {
                  return Container(
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                    width: 6,
                    height: 6,
                  );
                }

                return null;
              },
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(color: Colors.white),
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
              formatButtonVisible: false,
              titleCentered: true,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            "Tap on a date to add / remove completion",
            style: AppTextStyles.bodyText5,
          ),
        ],
      ),
    );
  }
}

// Helper function to compare DateTime objects without time component
bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
