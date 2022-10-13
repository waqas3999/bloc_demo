import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkin_state.dart';
class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(CheckInState(convertedDateTime: '', status: '', checkinlist: [],));

  /*void checkin()=>emit(date = new DateTime.now();
      print(date);
  );*/
void CheckIn(){/*
  state.date = new DateTime.now();
  print(state.date)*/
  DateTime now = DateTime.now();
state.status="CheckIn to Q-solution";
state.convertedDateTime= "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
  emit(state.copyWith(convertedDateTime: state.convertedDateTime));
  emit(state.copyWith(status: state.status));
 // state.checkinlist=[state.status,state.convertedDateTime];
  emit(state.copyWith(checkinlist: state.checkinlist!.add([state.status,state.convertedDateTime])));
  print(state.convertedDateTime);
  print(state.checkinlist);
}



}