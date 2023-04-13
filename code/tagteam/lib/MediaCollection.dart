import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:isar/isar.dart';
import 'Tag.dart';

part 'MediaCollection.g.dart';

@Collection()
class MediaCollection {
  int id = Isar.autoIncrement;
  String? titleText;
  String? type; // media type, book/show/podcast/movie/etc
  String?
      length; // length of media, String leaves it open for user to either use "long/medium/short" values or
  // specify hours and minutes
  int? parts; // the number of parts, if it's a series
  String? notes; // open space for user to leave any note on the entry
  // vvvvv because of this we will have to do linkproperty.load and linkproperty.save later on because they are lazy >:(
  final tag = IsarLinks<Tag>();
}
