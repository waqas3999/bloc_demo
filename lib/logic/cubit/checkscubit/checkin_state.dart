part of 'checkin_cubit.dart';

class CheckInState{
 final DateTime? date;
 String? convertedDateTime;
 String? status;
 List<dynamic>? checklist;
 CheckInState(
     {required this.checklist,this.date,required this.convertedDateTime,required this.status});
 CheckInState copyWith(
     {DateTime? date,
       String? convertedDateTime,String? status, List<dynamic>? checklist}) {
   return CheckInState(
     date: date ?? this.date,
     convertedDateTime: convertedDateTime ?? this.convertedDateTime, status: status ?? this.status,
    checklist: checklist ?? this.checklist);
 }
}