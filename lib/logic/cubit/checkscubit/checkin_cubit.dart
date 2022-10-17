import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkin_state.dart';
class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(CheckInState(
      convertedDateTime: '', status: '', checklist: []));

  /*void checkin()=>emit(date = new DateTime.now();
      print(date);
  );*/

  void Check({required bool isCheck}) {
    /*
  state.date = new DateTime.now();
  print(state.date)*/
    DateTime now = DateTime.now();
//state.status="CheckIn to Q-solution";
    var a = "${now.year.toString()}-${now.month.toString().padLeft(
        2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString()
        .padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    emit(state.copyWith(convertedDateTime: a));
    var status = isCheck ? "CheckIn to Q-solution" : "CheckOut to Q-solution";
    emit(state.copyWith(status: status));
    var maplist = {'status': status, 'date': a};

    emit(state.copyWith(checklist: state.checklist!
      ..add(maplist)));
    print(state.convertedDateTime);
    print(state.checklist);
  }

  void delete(int index) {
    emit(state.copyWith(checklist: state.checklist?..removeAt(index)));
  }
}
