import 'package:flutter/material.dart';
//import 'DatabaseHelper.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tagteam/Tag.dart';
import 'package:tagteam/MediaCollection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //doesnt work on web vvvvvvvvvvvv
  //final dir = await getApplicationSupportDirectory();
  //final isar = await Isar.open(schemas: [TitleSchema, TagSchema]);
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
    Future<List<MediaCollection>> mediaFuture = getMediaCollections();
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
              child: FutureBuilder<List<MediaCollection>>(
                  future: mediaFuture,
                  builder:
                      (context, AsyncSnapshot<List<MediaCollection>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      List<MediaCollection> mediaCollections = snapshot.data!;
                      debugPrint("Inside Main!");
                      for (final mc in mediaCollections) {
                        print("printing MC!");
                        //print(mc.tag.last.tagText);
                        for (Tag tt in mc.tag) {
                          print("printing!");
                          print(tt.tagText);
                        }
                      }
                      //debugPrint(tags.length.toString());
                      return Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            TableCell(child: const Text('Title')),
                            TableCell(child: const Text('Type')),
                            TableCell(child: const Text('Length')),
                            TableCell(child: const Text('Parts')),
                            TableCell(child: const Text('Notes')),
                            TableCell(child: const Text('Tags')),
                            TableCell(child: const Text('Edit')),
                          ]),
                          for (final mediaColl in mediaCollections)
                            TableRow(children: [
                              TableCell(
                                  child: Text(mediaColl.titleText.toString())),
                              TableCell(child: Text(mediaColl.type.toString())),
                              TableCell(
                                  child: Text(mediaColl.length.toString())),
                              TableCell(
                                  child: Text(mediaColl.parts.toString())),
                              TableCell(
                                  child: Text(mediaColl.notes.toString())),
                              TableCell(
                                //child:
                                //Text(mediaColl.tag.last.tagText.toString()),
                                child: Wrap(
                                  children: [
                                    for (Tag t in mediaColl.tag)
                                      Chip(
                                        label: Text(t.tagText.toString()),
                                      ),
                                  ],
                                ),
                              ),
                              TableCell(
                                  child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ))
                            ]),
                        ],
                      );
                    }
                  }),
            ),
          )
          //),
          ),
    );
  }

  Future<List<MediaCollection>> getMediaCollections() async {
    final isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    List<MediaCollection> media = await isar.mediaCollections.where().findAll();
    print("len");
    print(media.length);
    for (int i = 0; i < media.length; i++) {
      await media[i].tag.load();
    }
    //media[2].tag.load();
    isar.close();
    return media;
  }
}

class AddMedia extends StatefulWidget {
  const AddMedia({super.key});
  @override
  State<AddMedia> createState() => _AddMediaState();
}

class _AddMediaState extends State<AddMedia> {
  final controllerTitle = TextEditingController();
  final controllerType = TextEditingController();
  final controllerLength = TextEditingController();
  final controllerParts = TextEditingController();
  final controllerNotes = TextEditingController();

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerType.dispose();
    controllerLength.dispose();
    controllerParts.dispose();
    controllerNotes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Tag>>? futureTags;

    final tagsbool =
        ModalRoute.of(context)?.settings.arguments as List<bool>? ?? [false];
    futureTags = getTags(tagsbool);
    if (tagsbool.length == 1 && tagsbool[0] == false) {
      debugPrint("only False");
    } else {
      debugPrint("Greater 1 or true");
      futureTags = getTags(tagsbool);
    }
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
                    controller: controllerTitle,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Type'),
                    controller: controllerType,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Length'),
                    controller: controllerLength,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Parts'),
                    controller: controllerParts,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Notes'),
                    controller: controllerNotes,
                  ),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () => {runApp(EditTags())},
                        child: Text('Edit Tags')),
                  ]),
                  Expanded(
                    child: FutureBuilder<List<Tag>>(
                        future: futureTags,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Tag>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<Tag> tags = snapshot.data!;
                            return ListView.builder(
                                itemCount: tags.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(tags[index].tagText ?? ""),
                                  );
                                });
                          }
                        }),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                          onPressed: () => {
                                addMedia(
                                    controllerTitle.text,
                                    controllerType.text,
                                    controllerLength.text,
                                    controllerParts.text,
                                    controllerNotes.text,
                                    tagsbool),
                                runApp(MainApp())
                              },
                          child: Text('Accept')),
                      TextButton(
                        onPressed: () => {
                          debugPrint(controllerTitle.text),
                          debugPrint(controllerType.text),
                          debugPrint(controllerLength.text),
                          debugPrint(controllerParts.text),
                          debugPrint(controllerNotes.text),
                          runApp(MainApp()),
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  )
                ],
              ),
            )))));
  }

  void addMedia(String title, String Type, String Length, String Parts,
      String Notes, List<bool> tags) async {
    final isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    List<Tag> alltags = await isar.tags.where().findAll();
    List<MediaCollection> newcoll;
    final newMedia = MediaCollection()
      ..titleText = title
      ..type = Type
      ..length = Length
      ..parts = int.parse(Parts)
      ..notes = Notes;
    await isar.writeTxn((isar) => isar.mediaCollections.put(newMedia));
    if (tags.contains(true)) {
      for (int i = 0; i < tags.length; i++) {
        if (tags[i]) {
          //debugPrint("inside if i");
          newMedia.tag.add(alltags[i]);
          //debugPrint("tag");
          //debugPrint(alltags[i].tagText);
          await isar.writeTxn((isar) async {
            await newMedia.tag.save();
          });
        }
      }
    }
    //debugPrint("Tag!");
    //for (Tag ta in newMedia.tag) {
    //  print(ta.tagText);
    //}
    //print(newMedia.tag.last.tagText);
    await isar.close();
    return;
  }

  Future<List<Tag>> getTags(List<bool> _checked) async {
    final isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    List<Tag> tags = await isar.tags.where().findAll();

    isar.close();
    if (_checked.contains(true)) {
      List<Tag> selectedTags = [];
      for (int i = 0; i < _checked.length; i++) {
        if (_checked[i]) {
          selectedTags.add(tags[i]);
        }
      }
      return selectedTags;
    } else {
      return [];
    }
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
                    decoration: InputDecoration(labelText: 'Length'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Parts'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Notes'),
                  ),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () => {}, child: Text('Edit Tags')),
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
    final controllerTag = TextEditingController();
    List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
    Future<List<Tag>> tagsFuture = getTags();
    List<bool> _checked = [];
    @override
    void dispose() {
      controllerTag.dispose();
      super.dispose();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Edit Tags')),
        body: Container(
          child: Form(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'New Tags'),
                      controller: controllerTag,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {addTag(controllerTag.text), runApp(EditTags())},
                      child: Text('Submit Tag'),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Tag>>(
                        future: tagsFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Tag>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<Tag> tags = snapshot.data!;
                            debugPrint("here2!");
                            debugPrint("Tags List2!");
                            debugPrint(tags.length.toString());
                            debugPrint("Checked Length2!");
                            debugPrint(_checked.length.toString());
                            if (_checked.length < tags.length) {
                              _checked = List.filled(tags.length, false);
                              debugPrint("here!");
                              debugPrint("Tags List!");
                              debugPrint(tags.length.toString());
                              debugPrint("Checked Length!");
                              debugPrint(_checked.length.toString());
                            }
                            return ListView.builder(
                              itemCount: tags.length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  title: Text(tags[index].tagText ?? ""),
                                  value: _checked[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (_checked[index] == false) {
                                        _checked[index] = true;
                                        debugPrint(_checked[index].toString());
                                      } else {
                                        _checked[index] = false;
                                        debugPrint(_checked[index].toString());
                                      }
                                    });
                                  },
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddMedia(),
                                    settings:
                                        RouteSettings(arguments: _checked)))
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void addTag(String tag) async {
    final isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    final newTag = Tag()..tagText = tag;
    await isar.writeTxn((isar) => isar.tags.put(newTag));
    isar.close();
  }

  Future<List<Tag>> getTags() async {
    final isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    List<Tag> tags = await isar.tags.where().findAll();
    isar.close();
    return tags;
  }
}
