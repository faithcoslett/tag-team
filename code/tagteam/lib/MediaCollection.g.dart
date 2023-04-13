// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MediaCollection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMediaCollectionCollection on Isar {
  IsarCollection<MediaCollection> get mediaCollections => getCollection();
}

const MediaCollectionSchema = CollectionSchema(
  name: 'MediaCollection',
  schema:
      '{"name":"MediaCollection","idName":"id","properties":[{"name":"length","type":"String"},{"name":"notes","type":"String"},{"name":"parts","type":"Long"},{"name":"titleText","type":"String"},{"name":"type","type":"String"}],"indexes":[],"links":[{"name":"tag","target":"Tag"}]}',
  idName: 'id',
  propertyIds: {'length': 0, 'notes': 1, 'parts': 2, 'titleText': 3, 'type': 4},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'tag': 0},
  backlinkLinkNames: {},
  getId: _mediaCollectionGetId,
  setId: _mediaCollectionSetId,
  getLinks: _mediaCollectionGetLinks,
  attachLinks: _mediaCollectionAttachLinks,
  serializeNative: _mediaCollectionSerializeNative,
  deserializeNative: _mediaCollectionDeserializeNative,
  deserializePropNative: _mediaCollectionDeserializePropNative,
  serializeWeb: _mediaCollectionSerializeWeb,
  deserializeWeb: _mediaCollectionDeserializeWeb,
  deserializePropWeb: _mediaCollectionDeserializePropWeb,
  version: 3,
);

int? _mediaCollectionGetId(MediaCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _mediaCollectionSetId(MediaCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase> _mediaCollectionGetLinks(MediaCollection object) {
  return [object.tag];
}

void _mediaCollectionSerializeNative(
    IsarCollection<MediaCollection> collection,
    IsarRawObject rawObj,
    MediaCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.length;
  IsarUint8List? _length;
  if (value0 != null) {
    _length = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_length?.length ?? 0) as int;
  final value1 = object.notes;
  IsarUint8List? _notes;
  if (value1 != null) {
    _notes = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_notes?.length ?? 0) as int;
  final value2 = object.parts;
  final _parts = value2;
  final value3 = object.titleText;
  IsarUint8List? _titleText;
  if (value3 != null) {
    _titleText = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_titleText?.length ?? 0) as int;
  final value4 = object.type;
  IsarUint8List? _type;
  if (value4 != null) {
    _type = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_type?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _length);
  writer.writeBytes(offsets[1], _notes);
  writer.writeLong(offsets[2], _parts);
  writer.writeBytes(offsets[3], _titleText);
  writer.writeBytes(offsets[4], _type);
}

MediaCollection _mediaCollectionDeserializeNative(
    IsarCollection<MediaCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = MediaCollection();
  object.id = id;
  object.length = reader.readStringOrNull(offsets[0]);
  object.notes = reader.readStringOrNull(offsets[1]);
  object.parts = reader.readLongOrNull(offsets[2]);
  object.titleText = reader.readStringOrNull(offsets[3]);
  object.type = reader.readStringOrNull(offsets[4]);
  _mediaCollectionAttachLinks(collection, id, object);
  return object;
}

P _mediaCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _mediaCollectionSerializeWeb(
    IsarCollection<MediaCollection> collection, MediaCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'length', object.length);
  IsarNative.jsObjectSet(jsObj, 'notes', object.notes);
  IsarNative.jsObjectSet(jsObj, 'parts', object.parts);
  IsarNative.jsObjectSet(jsObj, 'titleText', object.titleText);
  IsarNative.jsObjectSet(jsObj, 'type', object.type);
  return jsObj;
}

MediaCollection _mediaCollectionDeserializeWeb(
    IsarCollection<MediaCollection> collection, dynamic jsObj) {
  final object = MediaCollection();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.length = IsarNative.jsObjectGet(jsObj, 'length');
  object.notes = IsarNative.jsObjectGet(jsObj, 'notes');
  object.parts = IsarNative.jsObjectGet(jsObj, 'parts');
  object.titleText = IsarNative.jsObjectGet(jsObj, 'titleText');
  object.type = IsarNative.jsObjectGet(jsObj, 'type');
  _mediaCollectionAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _mediaCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'length':
      return (IsarNative.jsObjectGet(jsObj, 'length')) as P;
    case 'notes':
      return (IsarNative.jsObjectGet(jsObj, 'notes')) as P;
    case 'parts':
      return (IsarNative.jsObjectGet(jsObj, 'parts')) as P;
    case 'titleText':
      return (IsarNative.jsObjectGet(jsObj, 'titleText')) as P;
    case 'type':
      return (IsarNative.jsObjectGet(jsObj, 'type')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _mediaCollectionAttachLinks(
    IsarCollection col, int id, MediaCollection object) {
  object.tag.attach(col, col.isar.tags, 'tag', id);
}

extension MediaCollectionQueryWhereSort
    on QueryBuilder<MediaCollection, MediaCollection, QWhere> {
  QueryBuilder<MediaCollection, MediaCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension MediaCollectionQueryWhere
    on QueryBuilder<MediaCollection, MediaCollection, QWhereClause> {
  QueryBuilder<MediaCollection, MediaCollection, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension MediaCollectionQueryFilter
    on QueryBuilder<MediaCollection, MediaCollection, QFilterCondition> {
  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'length',
      value: null,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'length',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      lengthMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'length',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'notes',
      value: null,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'notes',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'notes',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      partsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'parts',
      value: null,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      partsEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parts',
      value: value,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      partsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'parts',
      value: value,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      partsLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'parts',
      value: value,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      partsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'parts',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'titleText',
      value: null,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'titleText',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      titleTextMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'titleText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'type',
      value: null,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'type',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension MediaCollectionQueryLinks
    on QueryBuilder<MediaCollection, MediaCollection, QFilterCondition> {
  QueryBuilder<MediaCollection, MediaCollection, QAfterFilterCondition> tag(
      FilterQuery<Tag> q) {
    return linkInternal(
      isar.tags,
      q,
      'tag',
    );
  }
}

extension MediaCollectionQueryWhereSortBy
    on QueryBuilder<MediaCollection, MediaCollection, QSortBy> {
  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> sortByLength() {
    return addSortByInternal('length', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      sortByLengthDesc() {
    return addSortByInternal('length', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> sortByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      sortByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> sortByParts() {
    return addSortByInternal('parts', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      sortByPartsDesc() {
    return addSortByInternal('parts', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      sortByTitleText() {
    return addSortByInternal('titleText', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      sortByTitleTextDesc() {
    return addSortByInternal('titleText', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension MediaCollectionQueryWhereSortThenBy
    on QueryBuilder<MediaCollection, MediaCollection, QSortThenBy> {
  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> thenByLength() {
    return addSortByInternal('length', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      thenByLengthDesc() {
    return addSortByInternal('length', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> thenByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      thenByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> thenByParts() {
    return addSortByInternal('parts', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      thenByPartsDesc() {
    return addSortByInternal('parts', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      thenByTitleText() {
    return addSortByInternal('titleText', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      thenByTitleTextDesc() {
    return addSortByInternal('titleText', Sort.desc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<MediaCollection, MediaCollection, QAfterSortBy>
      thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension MediaCollectionQueryWhereDistinct
    on QueryBuilder<MediaCollection, MediaCollection, QDistinct> {
  QueryBuilder<MediaCollection, MediaCollection, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<MediaCollection, MediaCollection, QDistinct> distinctByLength(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('length', caseSensitive: caseSensitive);
  }

  QueryBuilder<MediaCollection, MediaCollection, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('notes', caseSensitive: caseSensitive);
  }

  QueryBuilder<MediaCollection, MediaCollection, QDistinct> distinctByParts() {
    return addDistinctByInternal('parts');
  }

  QueryBuilder<MediaCollection, MediaCollection, QDistinct> distinctByTitleText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('titleText', caseSensitive: caseSensitive);
  }

  QueryBuilder<MediaCollection, MediaCollection, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('type', caseSensitive: caseSensitive);
  }
}

extension MediaCollectionQueryProperty
    on QueryBuilder<MediaCollection, MediaCollection, QQueryProperty> {
  QueryBuilder<MediaCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<MediaCollection, String?, QQueryOperations> lengthProperty() {
    return addPropertyNameInternal('length');
  }

  QueryBuilder<MediaCollection, String?, QQueryOperations> notesProperty() {
    return addPropertyNameInternal('notes');
  }

  QueryBuilder<MediaCollection, int?, QQueryOperations> partsProperty() {
    return addPropertyNameInternal('parts');
  }

  QueryBuilder<MediaCollection, String?, QQueryOperations> titleTextProperty() {
    return addPropertyNameInternal('titleText');
  }

  QueryBuilder<MediaCollection, String?, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }
}
