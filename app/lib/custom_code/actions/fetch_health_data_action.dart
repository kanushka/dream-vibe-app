import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Map<String, dynamic>> fetchHealthData() async {
  HealthFactory health = HealthFactory();

  // Define the types of data to fetch
  List<HealthDataType> types = [
    HealthDataType.STEPS,
    HealthDataType.WORKOUT,
    HealthDataType.SLEEP_IN_BED,
  ];

  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateTime.now();

  // Request access to the data
  bool accessWasGranted = await health.requestAuthorization(types);

  // Request activity recognition and location permissions
  PermissionStatus activityRecognitionStatus = await Permission.activityRecognition.request();
  PermissionStatus locationStatus = await Permission.location.request();

  Map<String, dynamic> healthData = {};

  if (accessWasGranted && activityRecognitionStatus.isGranted && locationStatus.isGranted) {
    for (HealthDataType type in types) {
      // Fetch new data
      List<HealthDataPoint> data = await health.getHealthDataFromType(startDate, endDate, type);

      // Save all the new data points
      healthData[type.toString()] = data;
    }
  }

  return healthData;
}














class HealthDataPoint {
}


class HealthDataType {
  static var STEPS;
  
  static var WORKOUT;
  
  static var SLEEP_IN_BED;
}

class HealthFactory {
  getHealthDataFromType(DateTime startDate, DateTime endDate, HealthDataType type) {}
}
