import 'package:bloc_qchecks/logic/cubit/checkscubit/checkin_cubit.dart';
import 'package:bloc_qchecks/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var isbool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: const Text('Qsolution Checks')),
          actions: <Widget>[
            //DigitalClock(),
          ]),
      body: BlocBuilder<CheckInCubit, CheckInState>(
          builder: (context, state) => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.86,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      tileColor: Colors.black,
                      leading: Text(
                        "Status:",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 100, bottom: 5),
                        child: Text(
                          "Date:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, bottom: 5, right: 0),
                        child: Text(
                          "Action:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
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
                          // Find the index of the book whose id is 'b4'
                          return Card(
                              elevation: 10,
                              clipBehavior: Clip.hardEdge,
                              color: Colors.blue,
                              child: ListTile(
                                title: Text(
                                    "${state.checklist![index]['status']}\t\t\t\t\t\t${state.checklist![index]['date']}",
                                    style: TextStyle()),
                                trailing: IconButton(
                                  constraints: BoxConstraints(maxWidth: 25),
                                  onPressed: () => context
                                      .read<CheckInCubit>()
                                      .delete(index),
                                  icon: Icon(Icons.delete),
                                ),
                              ));
                        },
                      ),
                    ),
                    DigitalClock(
                      is24HourTimeFormat: true,
                      digitAnimationStyle: Curves.bounceInOut,
                      areaDecoration: BoxDecoration(color: Colors.transparent),
                      areaAligment: AlignmentDirectional.center,
                      hourMinuteDigitDecoration:
                          BoxDecoration(color: Colors.transparent),
                      hourMinuteDigitTextStyle: TextStyle(fontSize: 25),
                      secondDigitTextStyle: TextStyle(fontSize: 25),
                    ),
                    AppButton(
                      label: isbool ? "CheckOut" : "CheckIn",
                      onPress: () {
                        isbool
                            ? context.read<CheckInCubit>().Check(isCheck: true)
                            : context
                                .read<CheckInCubit>()
                                .Check(isCheck: false);
                        setState(() {
                          isbool = !isbool;
                        });
                      },
                      buttoncolor: isbool ? 0xFF000000 : 0xFF42A5F5,
                      textColor: 0xFFFFFFFF,
                    ),
                  ],
                ),
              )),
    );
  }
}
