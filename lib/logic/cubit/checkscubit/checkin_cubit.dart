import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkin_state.dart';

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit()
      : super(CheckInState(  checklist: []));

  void Check({required bool isCheck}) {

    DateTime now = DateTime.now();
    var date =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    var status = isCheck ? "CheckOut to Q-sol" : "CheckIn to Q-sol";
    var maplist = {'status': status, 'date': date};
    emit(state.copyWith(checklist: state.checklist!..add(maplist)));
    print(date);
    print(state.checklist);
  }

  void delete(int index) {
    emit(state.copyWith(checklist: state.checklist?..removeAt(index)));
  }
}
