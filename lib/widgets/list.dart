import 'package:bloc_qchecks/screens/counter_page.dart';
import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  List<dynamic>? litems;
  Checklist({Key? key,required this.litems}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*return Container(
        width: MediaQuery.of(context).size.width*0.95,
    height: MediaQuery.of(context).size.height*0.7,
    child: ListView.builder(
        padding: EdgeInsets.only(top: 5),
        itemCount: litems?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) =>CounterPage()));
            },
            child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        litems.toString(),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 0.5,
                      )
                    ])),
          );
        }));*/
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.95,
      height: MediaQuery.of(context).size.height*0.2,
      child: ListView.separated(
        clipBehavior:Clip.hardEdge,
        itemCount:litems!.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 5,);
        }, itemBuilder: (BuildContext context, int index) {
        return ListTile(
          dense: true,
          tileColor: Colors.blue,
          // title: Text(state.checkinlist?[index]),
          //title: Text("${state.ischecked?state.checkinlist.toString():state.checkoutlist.toString()}",style: TextStyle(
          title: Text("${litems?[index] == litems?[index] || litems?[index]==litems?[index] ? litems![index].toString():litems?[index].toString()}"),
          //title: Text("${state.checkoutlist?[index].toString()}"),
          // print("${state.checkinlist != null ? state.checkinlist?.toString():state.checkoutlist?.toString()}"),
          trailing: IconButton( onPressed: () {
            litems?.removeAt(index);
          }, icon:Icon(Icons.delete),),
        );
      },
      ),
    );
  }
}
