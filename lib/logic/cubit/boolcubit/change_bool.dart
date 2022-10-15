class ChangeBoolCubit extends Cubit<ChangeBoolState> {
  void changeOne() {
    emit(state.copyWith(
      one: !state.one,
    ));
  }
}