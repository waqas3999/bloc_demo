part of 'checkin_cubit.dart';

class CheckInState {
  List<dynamic>? checklist;

  CheckInState(
      {required this.checklist});

  CheckInState copyWith(
      {
      List<dynamic>? checklist}) {
    return CheckInState(
        checklist: checklist ?? this.checklist);
  }
}
