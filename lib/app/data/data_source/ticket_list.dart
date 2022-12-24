// List<String> eventList = [
//   "افتتاح الاجنحة وفتح الابواب امام الزوار",
//   "انظلاق أغمال المركز الإعلامي",
//   "جولة التعارف والاطلاع على أجنحة المعرض وتحية ميديانية للمشاركين",
//   "انطلاق بطولة الروبوت الصنف الأول",
//   "انطلاق جلسات شراكه و حوارات",
// ];
// List<String> eventNumList = ["1-", "2-", "3-", "4-", "5-"];

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
  // Ticket(
  //     eventName: "انطلاق الفعاليات",
  //     day: "اليوم الأول",
  //     timeNumber: "10",
  //     timeText: "صباحاً",
  //     eventNum: eventNumList,
  //     event: eventList),
];
