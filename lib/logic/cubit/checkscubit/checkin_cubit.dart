import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkin_state.dart';
class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(CheckInState(convertedDateTime: '', status: '', checkinlist: [], ischecked: false, checkoutlist: [], mergelist: []));

  /*void checkin()=>emit(date = new DateTime.now();
      print(date);
  );*/

void CheckIn(){/*
  state.date = new DateTime.now();
  print(state.date)*/
  DateTime now = DateTime.now();
state.status="CheckIn to Q-solution";
state.convertedDateTime= "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
  //emit(state.copyWith(convertedDateTime: state.convertedDateTime));
  //emit(state.copyWith(status: state.status));
  //state.checkinlist=[state.status,state.convertedDateTime];

  emit(state.copyWith(checkinlist: state.checkinlist?..add(state.checkinlist)));
  print(state.convertedDateTime);
 // state.status=true as String?;
  print(state.checkinlist);
}

  void CheckOut(){/*
  state.ischecked=true;
  state.date = new DateTime.now();
  print(state.date)*/

    DateTime now = DateTime.now();
   state.ischecked ? state.status="CheckOut to Q-solution" : "Already you are CheckIn" ;
    state.convertedDateTime= "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";

    emit(state.copyWith(convertedDateTime: state.convertedDateTime));
    emit(state.copyWith(status: state.status));
     state.checkoutlist=[state.status,state.convertedDateTime];
    emit(state.copyWith(checkoutlist: state.checkoutlist?..add([state.status,state.convertedDateTime])));

  List<dynamic> list=[state.status,state.convertedDateTime];
    emit(state.copyWith(checkoutlist: state.checkoutlist?..add(list)));

}

}