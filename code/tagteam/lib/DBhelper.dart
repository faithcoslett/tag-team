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
import 'package:tagteam/main.dart';

class DBhelper {
  late Isar isar;
  List<MediaCollection> mediaCol = [];
  List<Tag> tagCol = [];
  int curId = -1;
  List<int> filterIds = [];
  List<bool> tagBool = [];
  bool t = false;
  bool m = false;
  String curTitle = "",
      curType = "",
      curLeng = "",
      curParts = "",
      curNotes = "",
      curTag = "";
  DBhelper() {
    //openDB();
  }
  Future<void> deleteColl() async {
    if (isar.isOpen == false) {
      isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    }
    mediaCol.clear();
    await isar.writeTxn((isar) async {
      await isar.mediaCollections.delete(curId);
    });
  }

  Future<void> openDB() async {
    //final isart = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    //if (isar.isOpen == false) {
    isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    //}
    //print("a");
    //if (isar.isOpen) {
    //  print("open!");
    //}
  }

  Future<List<Tag>> getTags() async {
    if (isar.isOpen == false) {
      isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    }
    if (tagCol.isNotEmpty) {
      tagCol.clear();
    }
    //List<Tag> tags123 = await isar.tags.where().findAll();
    //tagCol = tags123;
    tagCol = await isar.tags.where().findAll();
    if (tagBool.isNotEmpty && t) {
      List<Tag> selectedTags = [];
      for (int i = 0; i < tagBool.length; i++) {
        if (tagBool[i]) {
          selectedTags.add(tagCol[i]);
        }
      }
      //tagBool.clear();
      return selectedTags;
    } else {
      //tagBool.clear();
      return tagCol;
    }
    //tagCol = await isar.tags.where().findAll();
    //print("tag cool len");
    //print(tagCol.length);
    //await isar.close();
  }

  Future<List<MediaCollection>> getMediaCollection() async {
    if (isar.isOpen == false) {
      isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    }
    mediaCol.clear();
    tagCol.clear();
    //isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    mediaCol = await isar.mediaCollections.where().findAll();

    print("len");
    print(m);
    print(curTitle);
    print(mediaCol.length);
    if (tagBool.isNotEmpty && m && curTitle.isEmpty) {
      for (int i = 0; i < mediaCol.length; i++) {
        await mediaCol[i].tag.load();
      }
      print("A");
      List<MediaCollection> selectedMedia = [];
      tagCol = await isar.tags.where().findAll();
      List<Tag> tags = [];
      for (int i = 0; i < tagBool.length; i++) {
        if (tagBool[i]) {
          tags.add(tagCol[i]);
        }
      }
      for (int i = 0; i < mediaCol.length; i++) {
        for (int j = 0; j < tags.length; j++) {
          for (int k = 0; k < mediaCol[i].tag.length; k++) {
            print(tags[j].tagText);
            if (mediaCol[i].tag.elementAt(k).tagText == tags[j].tagText) {
              selectedMedia.add(mediaCol[i]);
            }
          }
        }
      }
      //final selectedMedia = await isar.mediaCollections.filter();
      //final selectedMedia = isar.mediaCollections.filter().tag((q) {
      //  return q.tagTextEqualTo(tags[0].tagText);
      //}).findAll();

      /*
      for (int i = 0; i < selectedMedia.length; i++) {
        await selectedMedia[i].tag.load();
      }
      for (int i = 0; i < mediaCol.length; i++) {
        for (int j = 0; j < tagBool.length; j++) {
          if(mediaCol[i].tag.)
        }
      }
      
      for (int i = 0; i < tagBool.length; i++) {
        if (tagBool[i]) {
          selectedMedia.add(mediaCol[i]);
        }
      }
      */
      m = false;
      return selectedMedia;
    } else if (curTitle.isNotEmpty) {
      print("B");
      final medi = await isar.mediaCollections
          .filter()
          .titleTextEqualTo(curTitle)
          .findAll();
      for (int i = 0; i < medi.length; i++) {
        await medi[i].tag.load();
      }
      curTitle = "";
      return medi;
    } else {
      print("C");
      print(m);
      print(curTitle);
      for (int i = 0; i < mediaCol.length; i++) {
        await mediaCol[i].tag.load();
      }
      //await isar.close();
      return mediaCol;
    }
  }

  Future<MediaCollection> getSingleMediaCollection() async {
    if (isar.isOpen == false) {
      isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    }
    mediaCol.clear();
    final sinCol = await isar.mediaCollections.get(curId);
    print("dayta!");
    print(sinCol!.titleText);
    /*
    if (sinCol.tag == null) {
    } else {
      await sinCol.tag.load();
      /*
      curType = sinCol.type!;
      curLeng = sinCol.length!;
      curParts = sinCol.parts.toString();
      curNotes = sinCol.notes!;
      curTitle = sinCol.titleText!;
      */
    }
    */
    return sinCol;
  }

  Future<void> upDateMediaCollection() async {
    List<Tag> alltags = await isar.tags.where().findAll();

    print(curId);
    final upDateMedia = await isar.mediaCollections.get(curId);
    await upDateMedia!.tag.load();
    List<Tag> removeTags = [];
    for (Tag t in upDateMedia.tag) {
      removeTags.add(t);
    }
    for (final tt in removeTags) {
      await upDateMedia.tag.remove(tt);
    }
    await isar.writeTxn((isar) async {
      await upDateMedia.tag.save();
    });
    await upDateMedia.tag.load();
    print("tag 0");
    print(upDateMedia.tag);
    if (tagBool.contains(true)) {
      for (int i = 0; i < tagBool.length; i++) {
        if (tagBool[i]) {
          //debugPrint("inside if i");
          upDateMedia.tag.add(alltags[i]);
          debugPrint("tag");
          debugPrint(alltags[i].tagText);
          await isar.writeTxn((isar) async {
            await upDateMedia.tag.save();
          });
        }
      }
    }
    await upDateMedia.tag.load();
    print(upDateMedia.tag);
    upDateMedia.id = curId;
    upDateMedia.titleText = curTitle;
    upDateMedia.type = curType;
    upDateMedia.length = curLeng;
    upDateMedia.parts = int.parse(curParts);
    upDateMedia.notes = curNotes;
    await isar.writeTxn((isar) => isar.mediaCollections.put(upDateMedia));
    await upDateMedia.tag.load();
    print("second tags");
    print(upDateMedia.tag);
    curId = -1;
  }

  Future<void> addMedia() async {
    if (isar.isOpen == false) {
      isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    }
    //isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    tagCol.clear();
    tagCol = await isar.tags.where().findAll();
    final newMedia = MediaCollection()
      ..titleText = curTitle
      ..type = curType
      ..length = curLeng
      ..parts = int.parse(curParts)
      ..notes = curNotes;
    await isar.writeTxn((isar) => isar.mediaCollections.put(newMedia));
    if (tagBool.contains(true)) {
      for (int i = 0; i < tagCol.length; i++) {
        if (tagBool[i]) {
          //debugPrint("inside if i");
          newMedia.tag.add(tagCol[i]);
          //debugPrint("tag");
          //debugPrint(alltags[i].tagText);
          await isar.writeTxn((isar) async {
            await newMedia.tag.save();
          });
        }
      }
    }
    curTitle = "";
    //await isar.close();
  }

  void addTag() async {
    if (isar.isOpen == false) {
      isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    }
    //isar = await Isar.open(schemas: [MediaCollectionSchema, TagSchema]);
    final newTag = Tag()..tagText = curTag;
    await isar.writeTxn((isar) => isar.tags.put(newTag));
    //print("wrote tag!");
    //print(newTag.tagText);
    //await isar.close();
  }
}
