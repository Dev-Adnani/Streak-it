import 'package:flutter/foundation.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/ui/utils/day_of_week.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  /// 1. Initialize Awesome Notifications
  Future<void> init() async {
    await AwesomeNotifications().initialize(
      // Must be a valid resource (e.g. "resource://mipmap/ic_launcher")
      'resource://mipmap/ic_launcher',
      [
        NotificationChannel(
          channelKey: 'habit_reminder_channel',
          channelName: 'Habit Reminders',
          channelDescription: 'Reminders to complete your habit',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.High,
          ledColor: Colors.white,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: 'Group 1',
        )
      ],
      debug: kDebugMode,
    );

    // 2. Check or request permissions
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      isAllowed =
          await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    if (kDebugMode) {
      print('Awesome Notifications permission granted? $isAllowed');
    }

    // 3. (Optional) Listen to taps/callbacks
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceived,
      onNotificationCreatedMethod: (received) async {
        if (kDebugMode) print('Notification created: ${received.id}');
      },
      onNotificationDisplayedMethod: (received) async {
        if (kDebugMode) print('Notification displayed: ${received.id}');
      },
      onDismissActionReceivedMethod: (received) async {
        if (kDebugMode) print('Notification dismissed: ${received.id}');
      },
    );
  }

  @pragma('vm:entry-point')
  static Future<void> _onActionReceived(ReceivedAction receivedAction) async {
    if (kDebugMode) {
      print('Notification action tapped! Payload: ${receivedAction.payload}');
    }
    // Navigate in-app if needed
  }

  /// Schedules weekly notifications for each day in `habit.reminderDays`
  Future<void> scheduleHabitReminders(Habit habit) async {
    // 1. Check if notifications are allowed
    final bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      if (kDebugMode) {
        print('User disallowed notifications. Aborting schedule.');
      }
      return;
    }

    // 2. Cancel existing notifications for this habit
    await cancelHabitReminders(habit);

    // 3. Validate data
    if (habit.reminderTime == null ||
        habit.reminderDays == null ||
        habit.reminderDays!.isEmpty) {
      return;
    }

    final reminderTime = habit.reminderTime!;
    final days = habit.reminderDays!; // e.g. ["Mon", "Wed", "Fri"]

    // 4. For each day in `reminderDays`, create & schedule a weekly notification
    for (final dayStr in days) {
      // *** Use your custom dayOfWeekFromString() ***
      final dayOfWeek = dayOfWeekFromString(dayStr);
      if (dayOfWeek == null) continue;

      // Convert DayOfWeek -> 1..7 (Monday=1, Tuesday=2, Sunday=7)
      final weekdayValue = dayOfWeek.value;

      // Create a unique notification ID
      final notificationId = _createNotificationId(habit.habitId, weekdayValue);

      // Notification content
      final content = NotificationContent(
        id: notificationId,
        channelKey: 'habit_reminder_channel',
        title: habit.habitName ?? 'Habit Reminder',
        body: habit.habitDescription ?? 'Time to work on your habit!',
        notificationLayout: NotificationLayout.Default,
        payload: {'habitId': habit.habitId},
      );

      // Awesome Notifications schedule
      final schedule = NotificationCalendar(
        weekday: weekdayValue, // 1=Mon..7=Sun
        hour: reminderTime.hour,
        minute: reminderTime.minute,
        second: 0,
        millisecond: 0,
        repeats: true, // repeat every week
      );

      // Schedule
      await AwesomeNotifications().createNotification(
        content: content,
        schedule: schedule,
      );

      if (kDebugMode) {
        print(
          'Scheduled $dayStr => weekday=$weekdayValue at '
          '${reminderTime.hour}:${reminderTime.minute}, Notif ID=$notificationId',
        );
      }
    }
  }

  /// Cancel all notifications for this habit
  Future<void> cancelHabitReminders(Habit habit) async {
    if (habit.reminderDays == null || habit.reminderDays!.isEmpty) return;

    for (final dayStr in habit.reminderDays!) {
      final dayOfWeek = dayOfWeekFromString(dayStr);
      if (dayOfWeek == null) continue;
      final weekdayValue = dayOfWeek.value;

      final notificationId = _createNotificationId(habit.habitId, weekdayValue);
      await AwesomeNotifications().cancel(notificationId);
    }
  }

  /// Example: habitId = "abc123", weekday=1 => "abc123_1".hashCode => unique ID
  int _createNotificationId(String habitId, int weekday) {
    final key = '${habitId}_$weekday';
    return key.hashCode & 0x7FFFFFFF;
  }
}
