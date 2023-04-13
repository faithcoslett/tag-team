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
      '{"name":"Title","idName":"id","properties":[{"name":"length","type":"String"},{"name":"notes","type":"String"},{"name":"parts","type":"Long"},{"name":"titleText","type":"String"},{"name":"type","type":"String"}],"indexes":[],"links":[{"name":"tag","target":"Tag"}]}',
  idName: 'id',
  propertyIds: {'length': 0, 'notes': 1, 'parts': 2, 'titleText': 3, 'type': 4},
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

Title _titleDeserializeNative(IsarCollection<Title> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Title();
  object.id = id;
  object.length = reader.readStringOrNull(offsets[0]);
  object.notes = reader.readStringOrNull(offsets[1]);
  object.parts = reader.readLongOrNull(offsets[2]);
  object.titleText = reader.readStringOrNull(offsets[3]);
  object.type = reader.readStringOrNull(offsets[4]);
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

dynamic _titleSerializeWeb(IsarCollection<Title> collection, Title object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'length', object.length);
  IsarNative.jsObjectSet(jsObj, 'notes', object.notes);
  IsarNative.jsObjectSet(jsObj, 'parts', object.parts);
  IsarNative.jsObjectSet(jsObj, 'titleText', object.titleText);
  IsarNative.jsObjectSet(jsObj, 'type', object.type);
  return jsObj;
}

Title _titleDeserializeWeb(IsarCollection<Title> collection, dynamic jsObj) {
  final object = Title();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.length = IsarNative.jsObjectGet(jsObj, 'length');
  object.notes = IsarNative.jsObjectGet(jsObj, 'notes');
  object.parts = IsarNative.jsObjectGet(jsObj, 'parts');
  object.titleText = IsarNative.jsObjectGet(jsObj, 'titleText');
  object.type = IsarNative.jsObjectGet(jsObj, 'type');
  _titleAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _titleDeserializePropWeb<P>(Object jsObj, String propertyName) {
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'length',
      value: null,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthEqualTo(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthGreaterThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthLessThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthBetween(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthStartsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthEndsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'length',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> lengthMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'length',
      value: pattern,
      caseSensitive: caseSensitive,
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

  QueryBuilder<Title, Title, QAfterFilterCondition> partsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'parts',
      value: null,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> partsEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'parts',
      value: value,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> partsGreaterThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> partsLessThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> partsBetween(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'type',
      value: null,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> typeEqualTo(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeStartsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeEndsWith(
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

  QueryBuilder<Title, Title, QAfterFilterCondition> typeContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> typeMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'type',
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

  QueryBuilder<Title, Title, QAfterSortBy> sortByLength() {
    return addSortByInternal('length', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByLengthDesc() {
    return addSortByInternal('length', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByParts() {
    return addSortByInternal('parts', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByPartsDesc() {
    return addSortByInternal('parts', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTitleText() {
    return addSortByInternal('titleText', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTitleTextDesc() {
    return addSortByInternal('titleText', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension TitleQueryWhereSortThenBy on QueryBuilder<Title, Title, QSortThenBy> {
  QueryBuilder<Title, Title, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByLength() {
    return addSortByInternal('length', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByLengthDesc() {
    return addSortByInternal('length', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByNotes() {
    return addSortByInternal('notes', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByNotesDesc() {
    return addSortByInternal('notes', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByParts() {
    return addSortByInternal('parts', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByPartsDesc() {
    return addSortByInternal('parts', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTitleText() {
    return addSortByInternal('titleText', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTitleTextDesc() {
    return addSortByInternal('titleText', Sort.desc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<Title, Title, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension TitleQueryWhereDistinct on QueryBuilder<Title, Title, QDistinct> {
  QueryBuilder<Title, Title, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Title, Title, QDistinct> distinctByLength(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('length', caseSensitive: caseSensitive);
  }

  QueryBuilder<Title, Title, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('notes', caseSensitive: caseSensitive);
  }

  QueryBuilder<Title, Title, QDistinct> distinctByParts() {
    return addDistinctByInternal('parts');
  }

  QueryBuilder<Title, Title, QDistinct> distinctByTitleText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('titleText', caseSensitive: caseSensitive);
  }

  QueryBuilder<Title, Title, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('type', caseSensitive: caseSensitive);
  }
}

extension TitleQueryProperty on QueryBuilder<Title, Title, QQueryProperty> {
  QueryBuilder<Title, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Title, String?, QQueryOperations> lengthProperty() {
    return addPropertyNameInternal('length');
  }

  QueryBuilder<Title, String?, QQueryOperations> notesProperty() {
    return addPropertyNameInternal('notes');
  }

  QueryBuilder<Title, int?, QQueryOperations> partsProperty() {
    return addPropertyNameInternal('parts');
  }

  QueryBuilder<Title, String?, QQueryOperations> titleTextProperty() {
    return addPropertyNameInternal('titleText');
  }

  QueryBuilder<Title, String?, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }
}
