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
   /*     Container(
          width: MediaQuery.of(context).size.width*0.95,
          height: MediaQuery.of(context).size.height*0.7,
          child: ListView.builder(
          itemCount:state.checkinlist?.length?? 0,
          itemBuilder: (BuildContext context, int index){
          return Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.94,
                 child: Column(
                   children: [
                     Card(
                        color: Colors.blue,
             child: Text("${state.checkinlist.toString()}")),
                     Card(
                         child: Text("${state.checkoutlist.toString()}",style: TextStyle(
                             fontSize: 16
                         ),))

                   ],
                 ));
          })*/

          SizedBox(
            width: MediaQuery.of(context).size.width*0.95,
            height: MediaQuery.of(context).size.height*0.2,
            child: ListView.separated(
              clipBehavior:Clip.hardEdge,
              itemCount:state.status != null? state.checkinlist?.length ?? 0 : state.checkoutlist?.length ?? 0,
              separatorBuilder: (context, index) {
                return SizedBox(height: 5,);
              }, itemBuilder: (BuildContext context, int index) {
             return ListTile(
                dense: true,
                tileColor: Colors.blue,
                // title: Text(state.checkinlist?[index]),
                title: Text("${state.ischecked?state.checkinlist.toString():state.checkoutlist.toString()}",style: TextStyle(
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