import 'package:bloc_qchecks/screens/counter_page.dart';
import 'package:flutter/material.dart';

class Checklist extends StatelessWidget {
  var litems;
  Checklist({Key? key,required this.litems}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        padding: EdgeInsets.only(top: 5),
        itemCount: litems.length,
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
                        litems[index],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 0.5,
                      )
                    ])),
          );
        });
  }
}
