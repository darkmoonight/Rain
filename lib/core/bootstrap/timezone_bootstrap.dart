import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Loads device timezone data for IANA lookups (call once per isolate).
Future<void> initializeAppTimeZone() async {
  final timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz_data.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));
}
