import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: const MediaTable(),
          )
        ),
      ),
    );
  }
}
class MediaTable extends StatelessWidget{
  const MediaTable({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Media List'),
          actions: const [
            ButtonBar(
              children: [
                IconButton(onPressed: null, icon: Icon( Icons.filter_alt)),
                IconButton(onPressed: null, icon: Icon( Icons.add_circle)),
              ],
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              child:Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCell(child: Text('Title'),),
                      TableCell(child: Text('Type'),),
                      TableCell(child: Text('Time'),),
                      TableCell(child: Text('Parts'),),
                      TableCell(child: Text('Tags'),),
                      TableCell(child: Text('Edit'),),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('Title'),),
                      TableCell(child: Text('Type'),),
                      TableCell(child: Text('Time'),),
                      TableCell(child: Text('Parts'),),
                      TableCell(child: Text('Tags'),),
                      TableCell(child: IconButton(onPressed: null, icon: Icon(Icons.edit),),),
                    ]
                  )
                ],
              )
            )
          )
        ),
      ),
    );
  }
}
