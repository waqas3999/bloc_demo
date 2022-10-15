class ChangeBoolState {
  final bool one;
  final bool two;
  ChangeBoolState({this.one = false, this.two = true});
  ChangeBoolState copyWith({
    bool? one,
    bool? two,
  }){
    return RegisterState(
        one: one != null ? one : this.one,
        two: two != null ? two : this.two
    );
  }
}