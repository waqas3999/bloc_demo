import 'package:bloc_qchecks/logic/cubit/checkscubit/checkin_cubit.dart';
import 'package:bloc_qchecks/logic/cubit/counter_cubit.dart';
import 'package:bloc_qchecks/widgets/app_button.dart';
import 'package:bloc_qchecks/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var l = false;
  var status;
  var date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Qsolution Checks'))),
      body: BlocBuilder<CheckInCubit, CheckInState>(
          builder: (context, state) => Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  clipBehavior: Clip.hardEdge,
                  itemCount: state.checklist!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        elevation: 10,
                        clipBehavior: Clip.hardEdge,
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(
                            "${state.checklist?[index]}+$index",
                            style: TextStyle(),
                          ),
                          trailing: IconButton(
                            onPressed: () =>
                                context.read<CheckInCubit>().delete(index),
                            icon: Icon(Icons.delete),
                          ),
                        ));
                  },
                ),
              )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppButton(
            label: l?"CheckIn":"CheckOut",
            onPress: () {
              l
                  ? context.read<CheckInCubit>().Check(isCheck: true)
                  : context.read<CheckInCubit>().Check(isCheck: false);
              setState(() {
                l = !l;
              });
            },
            buttoncolor: 0xFF345677,
            textColor: 0xFF000000,
            check: true,
          ),
          const SizedBox(width: 10),
          // AppButton(label:"CheckOut", onPress:() => context.read<CheckInCubit>().Check(isCheck:false), buttoncolor:0xFF345677, textColor:0xFF000000, check: false,),
        ],
      ),
    );
  }
}
