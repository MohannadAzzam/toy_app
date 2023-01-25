import 'package:toy_app/app/data/models/organizers/services.dart';

class Organizer {
  final String avatar;
  final String arabicName;
  final String englishName;
  final String phone;
  final String email;
  final String description;
  final List<Services> servicesList;

  Organizer({
    required this.avatar,
    required this.arabicName,
    required this.englishName,
    required this.phone,
    required this.email,
    required this.description,
    required this.servicesList,
  });
}
