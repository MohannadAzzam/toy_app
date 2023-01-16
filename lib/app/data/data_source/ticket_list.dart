
import 'package:toy_app/app/data/data_source/event_list.dart';
import 'package:toy_app/app/data/data_source/event_num_list.dart';
import 'package:toy_app/app/data/models/ticket.dart';

List<Ticket> ticketList = [
  Ticket(
    eventName: "انطلاق الفعاليات",
    day: "اليوم الأول",
    timeNumber: "10",
    timeText: "صباحاً",
    event: eventList ,
    eventNum: eventNumList,
  ),
  Ticket(
    eventName: "انطلاق الفعاليات",
    day: "",
    timeNumber: "10",
    timeText: "صباحاً",
    event: eventList ,
    eventNum: eventNumList,
  ),
];
