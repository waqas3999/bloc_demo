part of 'Checkin_cubit.dart';

class CheckInState{
 final DateTime? date;
 String? convertedDateTime;
 String? status;
 bool ischecked;
 List<dynamic>? checkinlist;
 List<dynamic>? checkoutlist;
 CheckInState(
     {  this.date,required this.convertedDateTime,required this.status,required this.checkinlist,required this.ischecked,required this.checkoutlist});
 CheckInState copyWith(
     {DateTime? date,
       String? convertedDateTime,String? status,List<dynamic>? checkinlist,bool? ischecked, List<dynamic>? checkoutlist}) {
   return CheckInState(
     date: date ?? this.date,
     convertedDateTime: convertedDateTime ?? this.convertedDateTime, status: status ?? this.status, checkinlist: checkinlist ?? this.checkinlist,
   ischecked: ischecked ?? this.ischecked, checkoutlist: checkoutlist ?? this.checkoutlist
   );
 }
}