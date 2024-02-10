//this clas to maake a local notification
import 'package:awesome_notifications/awesome_notifications.dart';


class NotifCall {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {}

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {}

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    // Get.offNamedUntil(page, (route) => route != '' ,arguments: receivedAction);
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
  }
}
