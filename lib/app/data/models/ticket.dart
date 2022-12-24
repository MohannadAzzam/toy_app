
import 'package:toy_app/app/data/models/event.dart';
import 'package:toy_app/app/data/models/evetn_num.dart';

class Ticket {
  String day;
  String eventName;
  String timeNumber;
  String timeText;
  List<EventNum> eventNum;
  List<Event> event;

  Ticket({
    required this.eventName,
    required this.day,
    required this.timeNumber,
    required this.timeText,
    required this. eventNum,
    required this. event
  });
}
