part of 'Checkin_cubit.dart';

class CheckInState{
 final DateTime? date;
 String? convertedDateTime;
 String? status;
 List<dynamic>? checkinlist;
 CheckInState(
     {  this.date,required this.convertedDateTime,required this.status,required this.checkinlist});
 CheckInState copyWith(
     {DateTime? date,
       String? convertedDateTime,String? status,List<dynamic>? checkinlist}) {
   return CheckInState(
     date: date ?? this.date,
     convertedDateTime: convertedDateTime ?? this.convertedDateTime, status: status ?? this.status, checkinlist: checkinlist ?? this.checkinlist,
   );
 }
}