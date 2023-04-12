import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:isar/isar.dart';

part 'Tag.g.dart';

@Collection()
class Tag {
  int id = Isar.autoIncrement;
  String? tagText;
}
