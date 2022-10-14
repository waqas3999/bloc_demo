import 'package:bloc_qchecks/logic/cubit/Checkin_cubit.dart';
import 'package:bloc_qchecks/logic/cubit/counter_cubit.dart';
import 'package:bloc_qchecks/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Qsolution Checks'))),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Column(
          children: [
            BlocBuilder<CheckInCubit, CheckInState>(
  builder: (context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50,),
             /* Text("${state.convertedDateTime.toString()}"),
              SizedBox(width: 60,),
              Text("${state.status}"),*/
        Container(
          width: MediaQuery.of(context).size.width*0.95,
          height: MediaQuery.of(context).size.height*0.7,
          child:/* ListView(
            children:[
              Card(
              //color: Colors.blue,
             child: Row(
                 children:[ Text("${state.convertedDateTime.toString()}"),
                SizedBox(width: 5,),
                Text("${state.status}")])
            ),
          ])*/
          ListView.builder(
            clipBehavior:Clip.hardEdge,
            shrinkWrap: true,

            itemCount: state.checkinlist?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                tileColor: Colors.blue,
               // title: Text(state.checkinlist?[index]),
                title: Text("${state.checkinlist.toString()}",style: TextStyle(
                ),),
                trailing: IconButton( onPressed: () {
                  state.checkinlist?.removeAt(index);
                }, icon:Icon(Icons.delete),),
              );
            },
          ),
        )

            ],);
  },
), Spacer(),
            Text('$count'),
            SizedBox(height: 20,),
          AppButton(label: "CheckIn", onPress:()=> context.read<CheckInCubit>().CheckIn(),
              buttoncolor:0xFF127895, textColor: 0xFF000000),
            SizedBox(height: 20,),
            AppButton(label: "CheckOut", onPress:()=> context.read<CheckInCubit>().CheckOut(),
                buttoncolor:0xFF127895, textColor: 0xFF000000)
           ]),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}