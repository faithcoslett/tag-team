// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Title.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTitleCollection on Isar {
  IsarCollection<Title> get titles => getCollection();
}

const TitleSchema = CollectionSchema(
  name: 'Title',
  schema:
      '{"name":"Title","idName":"id","properties":[{"name":"notes","type":"String"},{"name":"time","type":"Long"},{"name":"titleText","type":"String"}],"indexes":[],"links":[{"name":"tag","target":"Tag"}]}',
  idName: 'id',
  propertyIds: {'notes': 0, 'time': 1, 'titleText': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'tag': 0},
  backlinkLinkNames: {},
  getId: _titleGetId,
  setId: _titleSetId,
  getLinks: _titleGetLinks,
  attachLinks: _titleAttachLinks,
  serializeNative: _titleSerializeNative,
  deserializeNative: _titleDeserializeNative,
  deserializePropNative: _titleDeserializePropNative,
  serializeWeb: _titleSerializeWeb,
  deserializeWeb: _titleDeserializeWeb,
  deserializePropWeb: _titleDeserializePropWeb,
  version: 3,
);

int? _titleGetId(Title object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _titleSetId(Title object, int id) {
  object.id = id;
}

List<IsarLinkBase> _titleGetLinks(Title object) {
  return [object.tag];
}

void _titleSerializeNative(
    IsarCollection<Title> collection,
    IsarRawObject rawObj,
    Title object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.notes;
  IsarUint8List? _notes;
  if (value0 != null) {
    _notes = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_notes?.length ?? 0) as int;
  final value1 = object.time;
  final _time = value1;
  final value2 = object.titleText;
  IsarUint8List? _titleText;
  if (value2 != null) {
    _titleText = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_titleText?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _notes);
  writer.writeDateTime(offsets[1], _time);
  writer.writeBytes(offsets[2], _titleText);
}

Title _titleDeserializeNative(IsarCollection<Title> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Title();
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[0]);
  object.time = reader.readDateTimeOrNull(offsets[1]);
  object.titleText = reader.readStringOrNull(offsets[2]);
  _titleAttachLinks(collection, id, object);
  return object;
}

P _titleDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _titleSerializeWeb(IsarCollection<Title> collection, Title object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'notes', object.notes);
  IsarNative.jsObjectSet(
      jsObj, 'time', object.time?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'titleText', object.titleText);
  return jsObj;
}

Title _titleDeserializeWeb(IsarCollection<Title> collection, dynamic jsObj) {
  final object = Title();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.notes = IsarNative.jsObjectGet(jsObj, 'notes');
  object.time = IsarNative.jsObjectGet(jsObj, 'time') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'time'),
              isUtc: true)
          .toLocal()
      : null;
  object.titleText = IsarNative.jsObjectGet(jsObj, 'titleText');
  _titleAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _titleDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'notes':
      return (IsarNative.jsObjectGet(jsObj, 'notes')) as P;
    case 'time':
      return (IsarNative.jsObjectGet(jsObj, 'time') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'time'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'titleText':
      return (IsarNative.jsObjectGet(jsObj, 'titleText')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _titleAttachLinks(IsarCollection col, int id, Title object) {
  object.tag.attach(col, col.isar.tags, 'tag', id);
}

extension TitleQueryWhereSort on QueryBuilder<Title, Title, QWhere> {
  QueryBuilder<Title, Title, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TitleQueryWhere on QueryBuilder<Title, Title, QWhereClause> {
  QueryBuilder<Title, Title, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Title, Title, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Title, Title, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Title, Title, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Title, Title, QAfterWhereClause> idBetween(
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

extension TitleQueryFilter on QueryBuilder<Title, Title, QFilterCondition> {
  QueryBuilder<Title, Title, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'notes',
      value: null,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> notesContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'notes',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> notesMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'notes',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> timeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'time',
      value: null,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> timeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> timeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> timeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> timeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'time',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'titleText',
      value: null,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextEqualTo(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextGreaterThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextLessThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextBetween(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextStartsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextEndsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'titleText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> titleTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'titleText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TitleQueryLinks on QueryBuilder<Title, Title, QFilterCondition> {
  QueryBuilder<Title, Title, QAfterFilterCondition> tag(FilterQuery<Tag> q) {
    return linkInternal(
      isar.tags,
      q,
      'tag',
    );
  }
}

extension TitleQueryWhereSortBy on QueryBuilder<Title, Title, QSortBy> {
  QueryBuilder<Title, Title, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTitleText() {
    return addSortByInternal('titleText', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTitleTextDesc() {
    return addSortByInternal('titleText', Sort.desc);
  }
}

extension TitleQueryWhereSortThenBy on QueryBuilder<Title, Title, QSortThenBy> {
  QueryBuilder<Title, Title, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTitleText() {
    return addSortByInternal('titleText', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTitleTextDesc() {
    return addSortByInternal('titleText', Sort.desc);
  }
}

extension TitleQueryWhereDistinct on QueryBuilder<Title, Title, QDistinct> {
  QueryBuilder<Title, Title, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Title, Title, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('notes', caseSensitive: caseSensitive);
  }

  QueryBuilder<Title, Title, QDistinct> distinctByTime() {
    return addDistinctByInternal('time');
  }

  QueryBuilder<Title, Title, QDistinct> distinctByTitleText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('titleText', caseSensitive: caseSensitive);
  }
}

extension TitleQueryProperty on QueryBuilder<Title, Title, QQueryProperty> {
  QueryBuilder<Title, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Title, String?, QQueryOperations> notesProperty() {
    return addPropertyNameInternal('notes');
  }

  QueryBuilder<Title, DateTime?, QQueryOperations> timeProperty() {
    return addPropertyNameInternal('time');
  }

  QueryBuilder<Title, String?, QQueryOperations> titleTextProperty() {
    return addPropertyNameInternal('titleText');
  }
}
