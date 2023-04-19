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
import 'package:tagteam/DBhelper.dart';
const mainColor=Colors.indigo;
int editID = 0;
DBhelper dbhelp = DBhelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //doesnt work on web vvvvvvvvvvvv
  //final dir = await getApplicationSupportDirectory();
  //final isar = await Isar.open(schemas: [TitleSchema, TagSchema]);
  await dbhelp.openDB();
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
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: mainColor, onPrimary: Colors.white,
            secondary: mainColor, onSecondary: Colors.white,
            error: Colors.red, onError: Colors.black,
            background: Colors.grey, onBackground: Colors.black,
            surface: mainColor, onSurface: Colors.white
          )
        ),
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
  Future<List<MediaCollection>> _futureMedia() async {
    List<MediaCollection> medias = await dbhelp.getMediaCollection();
    //List<Tag> tags = await getTags();
    return Future.value(medias);
  }

  @override
  Widget build(BuildContext context) {
    dbhelp.t = false;
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: mainColor, onPrimary: Colors.white,
            secondary: mainColor, onSecondary: Colors.white,
            error: Colors.red, onError: Colors.black,
            background: Colors.grey, onBackground: Colors.black,
            surface: mainColor, onSurface: Colors.white
          )
        ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Media List'),
          actions: [
            ButtonBar(
              children: [
                IconButton(
                  onPressed: () => {runApp(Filter())},
                  icon: Icon(Icons.filter_alt),
                ),
                IconButton(
                  onPressed: () => {runApp(AddMedia())},
                  icon: Icon(Icons.add_circle),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: FutureBuilder<List<MediaCollection>>(
              future: _futureMedia(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<MediaCollection>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    snapshot.data != null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print("error");
                  return Text('Error ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final mediaColls = snapshot.data!;

                  final rows = mediaColls.map((mediaColl) {
                    return TableRow(children: [
                      TableCell(child: Text(mediaColl.titleText.toString())),
                      TableCell(child: Text(mediaColl.type.toString())),
                      TableCell(child: Text(mediaColl.length.toString())),
                      TableCell(child: Text(mediaColl.parts.toString())),
                      TableCell(child: Text(mediaColl.notes.toString())),
                      TableCell(
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
                          onPressed: () => {
                            //editID = mediaColl.id,
                            dbhelp.curId = mediaColl.id,
                            print("mediaID:"),
                            print(mediaColl.id),
                            runApp(EditMedia()),
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ]);
                  }).toList();
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
                      ...rows,
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
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

  Future<List<Tag>> _futureTags() async {
    List<Tag> tags = await dbhelp.getTags();
    //List<Tag> tags = await getTags();
    return Future.value(tags);
  }

  @override
  Widget build(BuildContext context) {
    dbhelp.t = true;
    /*
    Future<List<Tag>>? futureTags;
    if (dbhelp.tagBool.contains(true)) {
      dbhelp.t = true;
    }
    final tagsbool =
        ModalRoute.of(context)?.settings.arguments as List<bool>? ?? [false];
    futureTags = dbhelp.getTags();
    if (tagsbool.length == 1 && tagsbool[0] == false) {
      debugPrint("only False");
    } else {
      debugPrint("Greater 1 or true");
      futureTags = getTags(tagsbool);
    }
    */
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: mainColor, onPrimary: Colors.white,
            secondary: mainColor, onSecondary: Colors.white,
            error: Colors.red, onError: Colors.black,
            background: Colors.grey, onBackground: Colors.black,
            surface: mainColor, onSurface: Colors.white
          )
        ),
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
                        future: _futureTags(),
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
                          onPressed: () async => {
                                dbhelp.curTitle = controllerTitle.text,
                                dbhelp.curType = controllerType.text,
                                dbhelp.curLeng = controllerLength.text,
                                dbhelp.curParts = controllerParts.text,
                                dbhelp.curNotes = controllerNotes.text,
                                await dbhelp.addMedia(),
                                dbhelp.tagBool =
                                    List.filled(dbhelp.tagBool.length, false),

                                /*
                                addMedia(
                                    controllerTitle.text,
                                    controllerType.text,
                                    controllerLength.text,
                                    controllerParts.text,
                                    controllerNotes.text,
                                    tagsbool),
                                    */
                                runApp(MainApp())
                              },
                          child: Text('Accept')),
                      ElevatedButton(
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

/*
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
*/
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
  void initState() {
    super.initState();
    _futureMedia().then((media) {
      setState(() {
        controllerTitle.text = media.titleText ?? "";
        controllerType.text = media.type ?? "";
        controllerLength.text = media.length ?? "";
        controllerParts.text = media.parts.toString();
        controllerNotes.text = media.notes ?? "";
      });
    });
  }

  Future<MediaCollection> _futureMedia() async {
    final media = await dbhelp.getSingleMediaCollection();
    //List<Tag> tags = await getTags();
    return Future.value(media);
  }

  Future<List<Tag>> _futureTags() async {
    final tags = await dbhelp.getTags();
    //List<Tag> tags = await getTags();
    return Future.value(tags);
  }

  @override
  Widget build(BuildContext context) {
    dbhelp.t = true;
    //print("Edit ID");
    //print(editID);
    //Future<List<MediaCollection>>? futureMedia;
    //Future<List<Tag>>? futureTags;
    //final tagsbool =
    //    ModalRoute.of(context)?.settings.arguments as List<bool>? ?? [false];
    //futureTags = getTags(tagsbool);
    /*
    if (tagsbool.length == 1 && tagsbool[0] == false) {
      debugPrint("only False");
    } else {
      debugPrint("Greater 1 or true");
      futureTags = getTags(tagsbool);
    }
    */
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: mainColor, onPrimary: Colors.white,
            secondary: mainColor, onSecondary: Colors.white,
            error: Colors.red, onError: Colors.black,
            background: Colors.grey, onBackground: Colors.black,
            surface: mainColor, onSurface: Colors.white
          )
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Edit Media')),
            body: Center(
                child: Container(
                    child: Form(
              child: Column(
                children: [
                  /*
                  Expanded(
                      child: FutureBuilder<MediaCollection>(
                    future: _futureMedia(),
                    builder: (BuildContext context1,
                        AsyncSnapshot<MediaCollection> snapshot1) {
                      if (snapshot1.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot1.hasData) {
                        MediaCollection med = snapshot1.data!;
                        print("titlet");
                        print(med.notes);
                        return Container(
                          child: Row(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Title'),
                                //initialValue: med.titleText,
                                controller: controllerTitle,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Type'),
                                //initialValue: med.type,
                                controller: controllerType,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Length'),
                                //initialValue: med.length,
                                controller: controllerLength,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Parts'),
                                //initialValue: med.parts.toString(),
                                controller: controllerParts,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Notes'),
                                //initialValue: med.notes,
                                controller: controllerNotes,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  )),
                  */

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    //initialValue: dbhelp.curTitle,
                    controller: controllerTitle,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Type'),
                    // initialValue: dbhelp.curType,
                    controller: controllerType,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Length'),
                    //initialValue: dbhelp.curLeng,
                    controller: controllerLength,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Parts'),
                    //initialValue: dbhelp.curParts,
                    controller: controllerParts,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Notes'),
                    //initialValue: dbhelp.curNotes,
                    controller: controllerNotes,
                  ),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () => {runApp(EditTags())},
                        child: Text('Edit Tags')),
                  ]),
                  Expanded(
                    child: FutureBuilder<List<Tag>>(
                        future: _futureTags(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Tag>> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              snapshot.hasData == false) {
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
                      ElevatedButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () async => {
                                await dbhelp.deleteColl(),
                                dbhelp.tagBool =
                                    List.filled(dbhelp.tagBool.length, false),
                                runApp(MainApp())
                              },
                          child: Text('Delete')),
                      TextButton(
                          onPressed: () async => {
                                dbhelp.curTitle = controllerTitle.text,
                                dbhelp.curType = controllerType.text,
                                dbhelp.curLeng = controllerLength.text,
                                dbhelp.curParts = controllerParts.text,
                                dbhelp.curNotes = controllerNotes.text,
                                await dbhelp.upDateMediaCollection(),
                                dbhelp.tagBool =
                                    List.filled(dbhelp.tagBool.length, false),
                                /*
                                upDateMedia(
                                    controllerTitle.text,
                                    controllerType.text,
                                    controllerLength.text,
                                    controllerParts.text,
                                    controllerNotes.text,
                                    editID,
                                    tagsbool),
                                    */
                                runApp(MainApp())
                              },
                          child: Text('Submit')),
                    ],
                  ),
                ],
              ),
            )))));
  }

  void upDateMedia(String title, String Type, String Length, String Parts,
      String Notes, int ID, List<bool> tags) async {
    print("tag list");
    for (int i = 0; i < tags.length; i++) {
      print(tags[i]);
    }
    print("updateMedia!");
    final isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    List<Tag> alltags = await isar.tags.where().findAll();
    final upDateMedia = await isar.mediaCollections.get(ID);
    await upDateMedia!.tag.load();
    debugPrint("Tag! before clear");
    for (Tag ta in upDateMedia.tag) {
      print("TAGB!!");
      print(ta.tagText);
    }
    upDateMedia.tag.clear();
    await isar.writeTxn((isar) async {
      await upDateMedia.tag.save();
    });
    //upDateMedia[].tag = [];
    //for (final t in upDateMedia.tag) {
    //  await upDateMedia.tag.remove(t);
    //}
    debugPrint("Tag! after clear");
    for (Tag ta in upDateMedia.tag) {
      print("TAGA!!");
      print(ta.tagText);
    }
    /*
    debugPrint("Tag! before clear");
    for (Tag ta in upDateMedia.tag) {
      print(ta.tagText);
    }
    */
    upDateMedia.id = ID;
    upDateMedia.titleText = title;
    upDateMedia.type = Type;
    upDateMedia.length = Length;
    upDateMedia.parts = int.parse(Parts);
    upDateMedia.notes = Notes;

    await isar.writeTxn((isar) => isar.mediaCollections.put(upDateMedia));
    //await isar.writeTxn((isar) async {
    //  await upDateMedia.tag.save();
    //});
    /*
    debugPrint("Tag! after clear");
    for (Tag ta in upDateMedia.tag) {
      print("TAG!!");
      print(ta.tagText);
    }
    */

    if (tags.contains(true)) {
      for (int i = 0; i < tags.length; i++) {
        if (tags[i]) {
          //debugPrint("inside if i");
          upDateMedia.tag.add(alltags[i]);
          //debugPrint("tag");
          //debugPrint(alltags[i].tagText);
          await isar.writeTxn((isar) async {
            await upDateMedia.tag.save();
          });
        }
      }
    }

    //debugPrint("Tag!");
    //for (Tag ta in upDateMedia.tag) {
    //  print(ta.tagText);
    //}
    //print(newMedia.tag.last.tagText);
    debugPrint("Tag! at end");
    for (Tag ta in upDateMedia.tag) {
      print("TAGC!!");
      print(ta.tagText);
    }
    editID = 0;
    await isar.close();
    //print("end of update editID:");
    //print(editID);
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

class Filter extends StatefulWidget {
  const Filter({super.key});
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Future<List<Tag>> _futureTags() async {
    List<Tag> tags = await dbhelp.getTags();
    //List<Tag> tags = await getTags();
    return Future.value(tags);
  }

  final controllerTitle = TextEditingController();
  @override
  void dispose() {
    controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dbhelp.m = true;
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: mainColor, onPrimary: Colors.white,
            secondary: mainColor, onSecondary: Colors.white,
            error: Colors.red, onError: Colors.black,
            background: Colors.grey, onBackground: Colors.black,
            surface: mainColor, onSurface: Colors.white
          )
        ),
      home: Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Container(
          child: Form(
            child: StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: controllerTitle,
                  ),
                  Expanded(
                    child: FutureBuilder<List<Tag>>(
                      future: _futureTags(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Tag>> snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          print("error");
                          return Text('Error ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          List<Tag> tags = snapshot.data!;
                          if (dbhelp.tagBool.length < tags.length) {
                            dbhelp.tagBool = List.filled(tags.length, false);
                          }
                          return ListView.builder(
                            itemCount: tags.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Text(tags[index].tagText ?? ""),
                                value: dbhelp.tagBool[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (dbhelp.tagBool[index] == false) {
                                      dbhelp.tagBool[index] = true;

                                      debugPrint(
                                          dbhelp.tagBool[index].toString());
                                    } else {
                                      dbhelp.tagBool[index] = false;
                                      debugPrint(
                                          dbhelp.tagBool[index].toString());
                                    }
                                  });
                                },
                              );
                            },
                          );
                        } else {
                          return Text('Other issue');
                        }
                      },
                    ),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                          onPressed: () =>
                              {dbhelp.m = false, runApp(MainApp())},
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () => {
                                print("D"),
                                print(dbhelp.m),
                                dbhelp.curTitle = controllerTitle.text,
                                print(dbhelp.curTitle),
                                runApp(MainApp())
                              },
                          child: Text('Submit')),
                    ],
                  )
                ],
              );
            }),
          ),
        ),
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
  Future<List<Tag>> _futureTags() async {
    List<Tag> tags = await dbhelp.getTags();
    //List<Tag> tags = await getTags();
    return Future.value(tags);
  }

  @override
  Widget build(BuildContext context) {
    dbhelp.t = false;
    final controllerTag = TextEditingController();
    List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
    //Future<List<Tag>> tagsFuture = getTags();
    List<bool> _checked = [];
    int numTag = 0;
    //Future<List<Tag>> tagsFuture = dbhelp.getTags();

    print("second tag len");
    print(dbhelp.tagCol.length);
    if (dbhelp.tagCol.isNotEmpty) {
      numTag = dbhelp.tagCol.length;
    }
    @override
    void dispose() {
      controllerTag.dispose();
      super.dispose();
    }

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: mainColor, onPrimary: Colors.white,
            secondary: mainColor, onSecondary: Colors.white,
            error: Colors.red, onError: Colors.black,
            background: Colors.grey, onBackground: Colors.black,
            surface: mainColor, onSurface: Colors.white
          )
        ),
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
                      onPressed: () => {
                        //addTag(controllerTag.text), \
                        if (controllerTag.text.isNotEmpty)
                          {
                            dbhelp.curTag = controllerTag.text,
                            dbhelp.addTag(),
                            //addTag(controllerTag.text),
                          },
                        runApp(EditTags())
                      },
                      child: Text('Submit Tag'),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Tag>>(
                        future: _futureTags(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Tag>> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              snapshot.data != null) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            print("error");
                            return Text('Error ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<Tag> tags = snapshot.data!;
                            debugPrint("here2!");
                            debugPrint("Tags List2!");
                            debugPrint(tags.length.toString());
                            debugPrint("Checked Length2!");
                            debugPrint(_checked.length.toString());
                            //if (_checked.length < tags.length) {
                            //  _checked = List.filled(tags.length, false);
                            //  debugPrint("here!");
                            //  debugPrint("Tags List!");
                            //  debugPrint(tags.length.toString());
                            //  debugPrint("Checked Length!");
                            //  debugPrint(_checked.length.toString());
                            // }
                            if (dbhelp.tagBool.length < tags.length) {
                              dbhelp.tagBool = List.filled(tags.length, false);
                            }
                            return ListView.builder(
                              itemCount: tags.length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  title: Text(tags[index].tagText ?? ""),
                                  //value: _checked[index],
                                  value: dbhelp.tagBool[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      /*
                                      if (_checked[index] == false) {
                                        _checked[index] = true;

                                        debugPrint(_checked[index].toString());
                                      } else {
                                        _checked[index] = false;
                                        debugPrint(_checked[index].toString());
                                      }
                                      */
                                      if (dbhelp.tagBool[index] == false) {
                                        dbhelp.tagBool[index] = true;

                                        debugPrint(
                                            dbhelp.tagBool[index].toString());
                                      } else {
                                        dbhelp.tagBool[index] = false;
                                        debugPrint(
                                            dbhelp.tagBool[index].toString());
                                      }
                                    });
                                  },
                                );
                              },
                            );
                          } else {
                            return Text('Other issue');
                          }
                        },
                      ),
                    ),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () => {runApp(MainApp())},
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            if (dbhelp.curId == -1)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const AddMedia(),
                                        settings:
                                            RouteSettings(arguments: _checked)))
                              }
                            else
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const EditMedia(),
                                        settings:
                                            RouteSettings(arguments: _checked)))
                              }
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
