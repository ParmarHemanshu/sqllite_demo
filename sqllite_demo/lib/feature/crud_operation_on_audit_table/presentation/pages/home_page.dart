import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqllite_demo/feature/crud_operation_on_audit_table/data/data_sources/drift/audit_table.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: StreamBuilder(
        stream: MyDatabase().watchAllOrder(),
        builder: (context, AsyncSnapshot<List<Order>> snapshot) {
          MyDatabase().insertNewOrder(Order(
              price: "200",
              productName: "car", id: 999,
          ));

          var datas=snapshot.data;
          if(datas==null){
            return ListView.builder(
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.orangeAccent,
                  child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        radius: 20,
                      ),
                      title: Text("ok"),
                      subtitle: Text("R}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          setState(() {

                          });
                        },
                        color: Colors.red,
                      )),
                );
              },
              itemCount: 3,
            );
          }
          else{
            return Container();
          }

        },
      ),
    );
  }
}
