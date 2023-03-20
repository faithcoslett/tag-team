import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget{
  const MainApp({super.key});
  
  @override
  State<MainApp> createState() => _MainAppState();
  
}

class _MainAppState extends State<MainApp> {
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
          actions:  [
            ButtonBar(
              children: [
                IconButton(onPressed: ()=>{runApp(Filter())}, icon: Icon( Icons.filter_alt)),
                IconButton(onPressed: ()=>{runApp(AddMedia())}, icon: Icon( Icons.add_circle)),
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
                children: [
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
                      TableCell(child: IconButton(
                        onPressed: ()=>{runApp(EditMedia())},
                        icon: Icon(Icons.edit),
                      ),),
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
class EditMedia extends StatefulWidget{
  const EditMedia({super.key});
  @override
  State<EditMedia> createState() => _EditMediaState();
}

class _EditMediaState extends State<EditMedia> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Container(
        color: Colors.cyan,
        child: Placeholder(),
      ),
    );
  }
}

class AddMedia extends StatefulWidget{
  const AddMedia({super.key});
  @override
  State<AddMedia> createState() => _AddMediaState();
}

class _AddMediaState extends State<AddMedia> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Container(
        color: Colors.yellow,
        child: Placeholder(),
      ),
    );
  }
}

class Filter extends StatefulWidget{
  const Filter({super.key});
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Container(
        color: Colors.pink,
        child: Placeholder(),
      ),
    );
  }
}
//To be implemented in the add and edit media widgets:
class EditTags extends StatefulWidget{
  const EditTags({super.key});
  @override
  State<EditTags> createState() => _EditTagsState();
}

class _EditTagsState extends State<EditTags> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Container(
        color: Colors.green,
        child: Placeholder(),
      ),
    );
  }
}