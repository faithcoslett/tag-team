import 'package:flutter/material.dart';
//import 'DatabaseHelper.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tagteam/Tag.dart';
import 'package:tagteam/Title.dart';

void main() async {
  final dir = await getApplicationSupportDirectory();
  final isar =
      await Isar.open(schemas: [TitleSchema, TagSchema], directory: dir.path);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
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
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(20),
          child: const MediaTable(),
        )),
      ),
    );
  }
}

class MediaTable extends StatelessWidget {
  const MediaTable({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Media List'),
            actions: [
              ButtonBar(
                children: [
                  IconButton(
                      onPressed: () => {runApp(Filter())},
                      icon: Icon(Icons.filter_alt)),
                  IconButton(
                      onPressed: () => {runApp(AddMedia())},
                      icon: Icon(Icons.add_circle)),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
              child: Container(
                  alignment: Alignment.topCenter,
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Text('Title'),
                        ),
                        TableCell(
                          child: Text('Type'),
                        ),
                        TableCell(
                          child: Text('Time'),
                        ),
                        TableCell(
                          child: Text('Parts'),
                        ),
                        TableCell(
                          child: Text('Tags'),
                        ),
                        TableCell(
                          child: Text('Edit'),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Text('Title'),
                        ),
                        TableCell(
                          child: Text('Type'),
                        ),
                        TableCell(
                          child: Text('Time'),
                        ),
                        TableCell(
                          child: Text('Parts'),
                        ),
                        TableCell(
                          child: Text('Tags'),
                        ),
                        TableCell(
                          child: IconButton(
                            onPressed: () => {runApp(EditMedia())},
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ])
                    ],
                  )))
          //),
          ),
    );
  }
}

class AddMedia extends StatefulWidget {
  const AddMedia({super.key});
  @override
  State<AddMedia> createState() => _AddMediaState();
}

class _AddMediaState extends State<AddMedia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Add Media')),
            body: Center(
                child: Container(
                    child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Type'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Time'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Parts'),
                  ),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () => {runApp(EditTags())},
                        child: Text('Edit Tags')),
                    Text('tags'),
                  ]),
                  ButtonBar(
                    children: [
                      TextButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Submit')),
                    ],
                  )
                ],
              ),
            )))));
  }
}

class EditMedia extends StatefulWidget {
  const EditMedia({super.key});
  @override
  State<EditMedia> createState() => _EditMediaState();
}

class _EditMediaState extends State<EditMedia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Edit Media')),
            body: Center(
                child: Container(
                    child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Type'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Time'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Parts'),
                  ),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () => {runApp(EditTags())},
                        child: Text('Edit Tags')),
                    Text('tags'),
                  ]),
                  ButtonBar(
                    children: [
                      TextButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Delete')),
                      TextButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Submit')),
                    ],
                  )
                ],
              ),
            )))));
  }
}

class Filter extends StatefulWidget {
  const Filter({super.key});
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Container(
            child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
              ),
              Row(children: [
                Text('Type:'),
                SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: null),
                        Text('TV Show')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Movie')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Podcast')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Book')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Game')
                      ],
                    ),
                  ]),
                )
              ]),
              Row(children: [
                Text('Tags:'),
                SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: null),
                        Text('Tag')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Tag')
                      ],
                    ),
                  ]),
                )
              ]),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () => {runApp(MainApp())},
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: () => {runApp(MainApp())},
                      child: Text('Submit')),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

//To be implemented in the add and edit media widgets:
class EditTags extends StatefulWidget {
  const EditTags({super.key});
  @override
  State<EditTags> createState() => _EditTagsState();
}

class _EditTagsState extends State<EditTags> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Edit Tags')),
        body: Container(
            child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'New Tags'),
              ),
              Row(children: [
                Text('Tags:'),
                SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: null),
                        Text('Tag')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Tag')
                      ],
                    ),
                  ]),
                )
              ]),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () => {runApp(MainApp())},
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: () => {runApp(MainApp())},
                      child: Text('Submit')),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
