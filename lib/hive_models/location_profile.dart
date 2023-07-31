import 'package:hive/hive.dart';
part 'location_profile.g.dart';
@HiveType(typeId: 1)
class LocationProfile {
  LocationProfile(
      {required this.id,
      required this.color,
      required this.lat,
      required this.lng,
      required this.latSign,
      required this.lngSign,
      required this.bodyFontSize,required this.headlineFontSize,required this.labelFontSize});

  @HiveField(0)
  String id;

  @HiveField(1)
  String lat;

  @HiveField(2)
  String latSign;

  @HiveField(3)
  String lng;

  @HiveField(4)
  String lngSign;

  @HiveField(5)
  double headlineFontSize;

  @HiveField(6)
  double labelFontSize;

  @HiveField(7)
  double bodyFontSize;

  @HiveField(8)
  String color;
}
