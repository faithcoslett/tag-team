import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:isar/isar.dart';
import 'Tag.dart';

part 'Title.g.dart';

@Collection()
class Title {
  int id = Isar.autoIncrement;
  String? titleText;
  //because of this we will have to do linkproperty.load and linkproperty.save later on because they are lazy >:(
  final tag = IsarLinks<Tag>();
  DateTime? time;
  String? notes;
}
