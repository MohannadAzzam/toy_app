

import '../models/tickets/ticket.dart';
import 'event_list.dart';
import 'event_num_list.dart';

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
