import 'package:bloc_qchecks/logic/cubit/checkscubit/checkin_cubit.dart';
import 'package:bloc_qchecks/logic/cubit/counter_cubit.dart';
import 'package:bloc_qchecks/screens/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: /*BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),*/
        MultiBlocProvider(
        providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<CheckInCubit>(create: (context) => CheckInCubit()),
    ], child:CounterPage(),
    ));
  }
}