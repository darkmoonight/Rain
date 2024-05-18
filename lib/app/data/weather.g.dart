// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsCollection on Isar {
  IsarCollection<Settings> get settings => this.collection();
}

const SettingsSchema = CollectionSchema(
  name: r'Settings',
  id: -8656046621518759136,
  properties: {
    r'amoledTheme': PropertySchema(
      id: 0,
      name: r'amoledTheme',
      type: IsarType.bool,
    ),
    r'degrees': PropertySchema(
      id: 1,
      name: r'degrees',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 2,
      name: r'language',
      type: IsarType.string,
    ),
    r'location': PropertySchema(
      id: 3,
      name: r'location',
      type: IsarType.bool,
    ),
    r'materialColor': PropertySchema(
      id: 4,
      name: r'materialColor',
      type: IsarType.bool,
    ),
    r'measurements': PropertySchema(
      id: 5,
      name: r'measurements',
      type: IsarType.string,
    ),
    r'notifications': PropertySchema(
      id: 6,
      name: r'notifications',
      type: IsarType.bool,
    ),
    r'onboard': PropertySchema(
      id: 7,
      name: r'onboard',
      type: IsarType.bool,
    ),
    r'roundDegree': PropertySchema(
      id: 8,
      name: r'roundDegree',
      type: IsarType.bool,
    ),
    r'theme': PropertySchema(
      id: 9,
      name: r'theme',
      type: IsarType.string,
    ),
    r'timeEnd': PropertySchema(
      id: 10,
      name: r'timeEnd',
      type: IsarType.string,
    ),
    r'timeRange': PropertySchema(
      id: 11,
      name: r'timeRange',
      type: IsarType.long,
    ),
    r'timeStart': PropertySchema(
      id: 12,
      name: r'timeStart',
      type: IsarType.string,
    ),
    r'timeformat': PropertySchema(
      id: 13,
      name: r'timeformat',
      type: IsarType.string,
    ),
    r'widgetBackgroundColor': PropertySchema(
      id: 14,
      name: r'widgetBackgroundColor',
      type: IsarType.string,
    ),
    r'widgetTextColor': PropertySchema(
      id: 15,
      name: r'widgetTextColor',
      type: IsarType.string,
    )
  },
  estimateSize: _settingsEstimateSize,
  serialize: _settingsSerialize,
  deserialize: _settingsDeserialize,
  deserializeProp: _settingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsGetId,
  getLinks: _settingsGetLinks,
  attach: _settingsAttach,
  version: '3.1.7',
);

int _settingsEstimateSize(
  Settings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.degrees.length * 3;
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.measurements.length * 3;
  {
    final value = object.theme;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timeEnd;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timeStart;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.timeformat.length * 3;
  {
    final value = object.widgetBackgroundColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.widgetTextColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _settingsSerialize(
  Settings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.amoledTheme);
  writer.writeString(offsets[1], object.degrees);
  writer.writeString(offsets[2], object.language);
  writer.writeBool(offsets[3], object.location);
  writer.writeBool(offsets[4], object.materialColor);
  writer.writeString(offsets[5], object.measurements);
  writer.writeBool(offsets[6], object.notifications);
  writer.writeBool(offsets[7], object.onboard);
  writer.writeBool(offsets[8], object.roundDegree);
  writer.writeString(offsets[9], object.theme);
  writer.writeString(offsets[10], object.timeEnd);
  writer.writeLong(offsets[11], object.timeRange);
  writer.writeString(offsets[12], object.timeStart);
  writer.writeString(offsets[13], object.timeformat);
  writer.writeString(offsets[14], object.widgetBackgroundColor);
  writer.writeString(offsets[15], object.widgetTextColor);
}

Settings _settingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Settings();
  object.amoledTheme = reader.readBool(offsets[0]);
  object.degrees = reader.readString(offsets[1]);
  object.id = id;
  object.language = reader.readStringOrNull(offsets[2]);
  object.location = reader.readBool(offsets[3]);
  object.materialColor = reader.readBool(offsets[4]);
  object.measurements = reader.readString(offsets[5]);
  object.notifications = reader.readBool(offsets[6]);
  object.onboard = reader.readBool(offsets[7]);
  object.roundDegree = reader.readBool(offsets[8]);
  object.theme = reader.readStringOrNull(offsets[9]);
  object.timeEnd = reader.readStringOrNull(offsets[10]);
  object.timeRange = reader.readLongOrNull(offsets[11]);
  object.timeStart = reader.readStringOrNull(offsets[12]);
  object.timeformat = reader.readString(offsets[13]);
  object.widgetBackgroundColor = reader.readStringOrNull(offsets[14]);
  object.widgetTextColor = reader.readStringOrNull(offsets[15]);
  return object;
}

P _settingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsGetId(Settings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsGetLinks(Settings object) {
  return [];
}

void _settingsAttach(IsarCollection<dynamic> col, Id id, Settings object) {
  object.id = id;
}

extension SettingsQueryWhereSort on QueryBuilder<Settings, Settings, QWhere> {
  QueryBuilder<Settings, Settings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsQueryWhere on QueryBuilder<Settings, Settings, QWhereClause> {
  QueryBuilder<Settings, Settings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> amoledThemeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amoledTheme',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'degrees',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'degrees',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'degrees',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'degrees',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'degrees',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'degrees',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'degrees',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'degrees',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'degrees',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'degrees',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> locationEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> materialColorEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measurements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      measurementsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measurements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measurements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measurements',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      measurementsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'measurements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'measurements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'measurements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'measurements',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      measurementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measurements',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      measurementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'measurements',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> notificationsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifications',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> onboardEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onboard',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> roundDegreeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundDegree',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'theme',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'theme',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'theme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'theme',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'theme',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeEnd',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeEnd',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeEnd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeEnd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeEnd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeEnd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeEnd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeEnd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeEnd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeEnd',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeEnd',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeRange',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeRange',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeRange',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeStart',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeStart',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeStart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeStart',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeStart',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      timeStartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeStart',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeformat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeformat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeformat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeformat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeformat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeformat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeformat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeformat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeformat',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      timeformatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeformat',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'widgetBackgroundColor',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'widgetBackgroundColor',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'widgetBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'widgetBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'widgetBackgroundColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'widgetBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'widgetBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'widgetBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'widgetBackgroundColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetBackgroundColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetBackgroundColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'widgetBackgroundColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'widgetTextColor',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'widgetTextColor',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetTextColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'widgetTextColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'widgetTextColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'widgetTextColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'widgetTextColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'widgetTextColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'widgetTextColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'widgetTextColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetTextColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      widgetTextColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'widgetTextColor',
        value: '',
      ));
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQueryLinks
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> sortByAmoledTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amoledTheme', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByAmoledThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amoledTheme', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByDegrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degrees', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByDegreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degrees', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMaterialColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialColor', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMaterialColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialColor', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMeasurements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurements', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMeasurementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurements', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByOnboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboard', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByOnboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboard', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByRoundDegree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundDegree', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByRoundDegreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundDegree', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeEnd', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeEnd', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeRange', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeRange', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStart', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStart', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeformat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeformat', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByTimeformatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeformat', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWidgetBackgroundColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColor', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      sortByWidgetBackgroundColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColor', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWidgetTextColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColor', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWidgetTextColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColor', Sort.desc);
    });
  }
}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenByAmoledTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amoledTheme', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByAmoledThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amoledTheme', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByDegrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degrees', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByDegreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degrees', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMaterialColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialColor', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMaterialColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialColor', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMeasurements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurements', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMeasurementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurements', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByOnboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboard', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByOnboardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onboard', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByRoundDegree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundDegree', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByRoundDegreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundDegree', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeEnd', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeEnd', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeRange', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeRange', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStart', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeStart', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeformat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeformat', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByTimeformatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeformat', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWidgetBackgroundColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColor', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
      thenByWidgetBackgroundColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColor', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWidgetTextColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColor', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWidgetTextColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColor', Sort.desc);
    });
  }
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {
  QueryBuilder<Settings, Settings, QDistinct> distinctByAmoledTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amoledTheme');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByDegrees(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'degrees', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByMaterialColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialColor');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByMeasurements(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measurements', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifications');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByOnboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onboard');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByRoundDegree() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundDegree');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTheme(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeEnd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeEnd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeRange');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeStart(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeStart', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeformat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeformat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWidgetBackgroundColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetBackgroundColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWidgetTextColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetTextColor',
          caseSensitive: caseSensitive);
    });
  }
}

extension SettingsQueryProperty
    on QueryBuilder<Settings, Settings, QQueryProperty> {
  QueryBuilder<Settings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> amoledThemeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amoledTheme');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> degreesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'degrees');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> materialColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialColor');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> measurementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measurements');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> notificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifications');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> onboardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onboard');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> roundDegreeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundDegree');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> timeEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeEnd');
    });
  }

  QueryBuilder<Settings, int?, QQueryOperations> timeRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeRange');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> timeStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeStart');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> timeformatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeformat');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
      widgetBackgroundColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetBackgroundColor');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> widgetTextColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetTextColor');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMainWeatherCacheCollection on Isar {
  IsarCollection<MainWeatherCache> get mainWeatherCaches => this.collection();
}

const MainWeatherCacheSchema = CollectionSchema(
  name: r'MainWeatherCache',
  id: -2519779909738611736,
  properties: {
    r'apparentTemperature': PropertySchema(
      id: 0,
      name: r'apparentTemperature',
      type: IsarType.doubleList,
    ),
    r'apparentTemperatureMax': PropertySchema(
      id: 1,
      name: r'apparentTemperatureMax',
      type: IsarType.doubleList,
    ),
    r'apparentTemperatureMin': PropertySchema(
      id: 2,
      name: r'apparentTemperatureMin',
      type: IsarType.doubleList,
    ),
    r'cloudcover': PropertySchema(
      id: 3,
      name: r'cloudcover',
      type: IsarType.longList,
    ),
    r'dewpoint2M': PropertySchema(
      id: 4,
      name: r'dewpoint2M',
      type: IsarType.doubleList,
    ),
    r'evapotranspiration': PropertySchema(
      id: 5,
      name: r'evapotranspiration',
      type: IsarType.doubleList,
    ),
    r'precipitation': PropertySchema(
      id: 6,
      name: r'precipitation',
      type: IsarType.doubleList,
    ),
    r'precipitationProbability': PropertySchema(
      id: 7,
      name: r'precipitationProbability',
      type: IsarType.longList,
    ),
    r'precipitationProbabilityMax': PropertySchema(
      id: 8,
      name: r'precipitationProbabilityMax',
      type: IsarType.longList,
    ),
    r'precipitationSum': PropertySchema(
      id: 9,
      name: r'precipitationSum',
      type: IsarType.doubleList,
    ),
    r'rain': PropertySchema(
      id: 10,
      name: r'rain',
      type: IsarType.doubleList,
    ),
    r'rainSum': PropertySchema(
      id: 11,
      name: r'rainSum',
      type: IsarType.doubleList,
    ),
    r'relativehumidity2M': PropertySchema(
      id: 12,
      name: r'relativehumidity2M',
      type: IsarType.longList,
    ),
    r'shortwaveRadiation': PropertySchema(
      id: 13,
      name: r'shortwaveRadiation',
      type: IsarType.doubleList,
    ),
    r'sunrise': PropertySchema(
      id: 14,
      name: r'sunrise',
      type: IsarType.stringList,
    ),
    r'sunset': PropertySchema(
      id: 15,
      name: r'sunset',
      type: IsarType.stringList,
    ),
    r'surfacePressure': PropertySchema(
      id: 16,
      name: r'surfacePressure',
      type: IsarType.doubleList,
    ),
    r'temperature2M': PropertySchema(
      id: 17,
      name: r'temperature2M',
      type: IsarType.doubleList,
    ),
    r'temperature2MMax': PropertySchema(
      id: 18,
      name: r'temperature2MMax',
      type: IsarType.doubleList,
    ),
    r'temperature2MMin': PropertySchema(
      id: 19,
      name: r'temperature2MMin',
      type: IsarType.doubleList,
    ),
    r'time': PropertySchema(
      id: 20,
      name: r'time',
      type: IsarType.stringList,
    ),
    r'timeDaily': PropertySchema(
      id: 21,
      name: r'timeDaily',
      type: IsarType.dateTimeList,
    ),
    r'timestamp': PropertySchema(
      id: 22,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'timezone': PropertySchema(
      id: 23,
      name: r'timezone',
      type: IsarType.string,
    ),
    r'uvIndex': PropertySchema(
      id: 24,
      name: r'uvIndex',
      type: IsarType.doubleList,
    ),
    r'uvIndexMax': PropertySchema(
      id: 25,
      name: r'uvIndexMax',
      type: IsarType.doubleList,
    ),
    r'visibility': PropertySchema(
      id: 26,
      name: r'visibility',
      type: IsarType.doubleList,
    ),
    r'weathercode': PropertySchema(
      id: 27,
      name: r'weathercode',
      type: IsarType.longList,
    ),
    r'weathercodeDaily': PropertySchema(
      id: 28,
      name: r'weathercodeDaily',
      type: IsarType.longList,
    ),
    r'winddirection10M': PropertySchema(
      id: 29,
      name: r'winddirection10M',
      type: IsarType.longList,
    ),
    r'winddirection10MDominant': PropertySchema(
      id: 30,
      name: r'winddirection10MDominant',
      type: IsarType.longList,
    ),
    r'windgusts10M': PropertySchema(
      id: 31,
      name: r'windgusts10M',
      type: IsarType.doubleList,
    ),
    r'windgusts10MMax': PropertySchema(
      id: 32,
      name: r'windgusts10MMax',
      type: IsarType.doubleList,
    ),
    r'windspeed10M': PropertySchema(
      id: 33,
      name: r'windspeed10M',
      type: IsarType.doubleList,
    ),
    r'windspeed10MMax': PropertySchema(
      id: 34,
      name: r'windspeed10MMax',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _mainWeatherCacheEstimateSize,
  serialize: _mainWeatherCacheSerialize,
  deserialize: _mainWeatherCacheDeserialize,
  deserializeProp: _mainWeatherCacheDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mainWeatherCacheGetId,
  getLinks: _mainWeatherCacheGetLinks,
  attach: _mainWeatherCacheAttach,
  version: '3.1.7',
);

int _mainWeatherCacheEstimateSize(
  MainWeatherCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.apparentTemperature;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.apparentTemperatureMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.apparentTemperatureMin;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.cloudcover;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.dewpoint2M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.evapotranspiration;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitation;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitationProbability;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitationProbabilityMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitationSum;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.rain;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.rainSum;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.relativehumidity2M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.shortwaveRadiation;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.sunrise;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.sunset;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.surfacePressure;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.temperature2M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.temperature2MMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.temperature2MMin;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.time;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.timeDaily;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.timezone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uvIndex;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.uvIndexMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.visibility;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.weathercode;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.weathercodeDaily;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.winddirection10M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.winddirection10MDominant;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windgusts10M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windgusts10MMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windspeed10M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windspeed10MMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _mainWeatherCacheSerialize(
  MainWeatherCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.apparentTemperature);
  writer.writeDoubleList(offsets[1], object.apparentTemperatureMax);
  writer.writeDoubleList(offsets[2], object.apparentTemperatureMin);
  writer.writeLongList(offsets[3], object.cloudcover);
  writer.writeDoubleList(offsets[4], object.dewpoint2M);
  writer.writeDoubleList(offsets[5], object.evapotranspiration);
  writer.writeDoubleList(offsets[6], object.precipitation);
  writer.writeLongList(offsets[7], object.precipitationProbability);
  writer.writeLongList(offsets[8], object.precipitationProbabilityMax);
  writer.writeDoubleList(offsets[9], object.precipitationSum);
  writer.writeDoubleList(offsets[10], object.rain);
  writer.writeDoubleList(offsets[11], object.rainSum);
  writer.writeLongList(offsets[12], object.relativehumidity2M);
  writer.writeDoubleList(offsets[13], object.shortwaveRadiation);
  writer.writeStringList(offsets[14], object.sunrise);
  writer.writeStringList(offsets[15], object.sunset);
  writer.writeDoubleList(offsets[16], object.surfacePressure);
  writer.writeDoubleList(offsets[17], object.temperature2M);
  writer.writeDoubleList(offsets[18], object.temperature2MMax);
  writer.writeDoubleList(offsets[19], object.temperature2MMin);
  writer.writeStringList(offsets[20], object.time);
  writer.writeDateTimeList(offsets[21], object.timeDaily);
  writer.writeDateTime(offsets[22], object.timestamp);
  writer.writeString(offsets[23], object.timezone);
  writer.writeDoubleList(offsets[24], object.uvIndex);
  writer.writeDoubleList(offsets[25], object.uvIndexMax);
  writer.writeDoubleList(offsets[26], object.visibility);
  writer.writeLongList(offsets[27], object.weathercode);
  writer.writeLongList(offsets[28], object.weathercodeDaily);
  writer.writeLongList(offsets[29], object.winddirection10M);
  writer.writeLongList(offsets[30], object.winddirection10MDominant);
  writer.writeDoubleList(offsets[31], object.windgusts10M);
  writer.writeDoubleList(offsets[32], object.windgusts10MMax);
  writer.writeDoubleList(offsets[33], object.windspeed10M);
  writer.writeDoubleList(offsets[34], object.windspeed10MMax);
}

MainWeatherCache _mainWeatherCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MainWeatherCache(
    apparentTemperature: reader.readDoubleOrNullList(offsets[0]),
    apparentTemperatureMax: reader.readDoubleOrNullList(offsets[1]),
    apparentTemperatureMin: reader.readDoubleOrNullList(offsets[2]),
    cloudcover: reader.readLongOrNullList(offsets[3]),
    dewpoint2M: reader.readDoubleOrNullList(offsets[4]),
    evapotranspiration: reader.readDoubleOrNullList(offsets[5]),
    precipitation: reader.readDoubleOrNullList(offsets[6]),
    precipitationProbability: reader.readLongOrNullList(offsets[7]),
    precipitationProbabilityMax: reader.readLongOrNullList(offsets[8]),
    precipitationSum: reader.readDoubleOrNullList(offsets[9]),
    rain: reader.readDoubleOrNullList(offsets[10]),
    rainSum: reader.readDoubleOrNullList(offsets[11]),
    relativehumidity2M: reader.readLongOrNullList(offsets[12]),
    shortwaveRadiation: reader.readDoubleOrNullList(offsets[13]),
    sunrise: reader.readStringList(offsets[14]),
    sunset: reader.readStringList(offsets[15]),
    surfacePressure: reader.readDoubleOrNullList(offsets[16]),
    temperature2M: reader.readDoubleList(offsets[17]),
    temperature2MMax: reader.readDoubleOrNullList(offsets[18]),
    temperature2MMin: reader.readDoubleOrNullList(offsets[19]),
    time: reader.readStringList(offsets[20]),
    timeDaily: reader.readDateTimeList(offsets[21]),
    timestamp: reader.readDateTimeOrNull(offsets[22]),
    timezone: reader.readStringOrNull(offsets[23]),
    uvIndex: reader.readDoubleOrNullList(offsets[24]),
    uvIndexMax: reader.readDoubleOrNullList(offsets[25]),
    visibility: reader.readDoubleOrNullList(offsets[26]),
    weathercode: reader.readLongList(offsets[27]),
    weathercodeDaily: reader.readLongOrNullList(offsets[28]),
    winddirection10M: reader.readLongOrNullList(offsets[29]),
    winddirection10MDominant: reader.readLongOrNullList(offsets[30]),
    windgusts10M: reader.readDoubleOrNullList(offsets[31]),
    windgusts10MMax: reader.readDoubleOrNullList(offsets[32]),
    windspeed10M: reader.readDoubleOrNullList(offsets[33]),
    windspeed10MMax: reader.readDoubleOrNullList(offsets[34]),
  );
  object.id = id;
  return object;
}

P _mainWeatherCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 1:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 2:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 3:
      return (reader.readLongOrNullList(offset)) as P;
    case 4:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 5:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 6:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 7:
      return (reader.readLongOrNullList(offset)) as P;
    case 8:
      return (reader.readLongOrNullList(offset)) as P;
    case 9:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 10:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 11:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 12:
      return (reader.readLongOrNullList(offset)) as P;
    case 13:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 14:
      return (reader.readStringList(offset)) as P;
    case 15:
      return (reader.readStringList(offset)) as P;
    case 16:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 17:
      return (reader.readDoubleList(offset)) as P;
    case 18:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 19:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 20:
      return (reader.readStringList(offset)) as P;
    case 21:
      return (reader.readDateTimeList(offset)) as P;
    case 22:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 25:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 26:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 27:
      return (reader.readLongList(offset)) as P;
    case 28:
      return (reader.readLongOrNullList(offset)) as P;
    case 29:
      return (reader.readLongOrNullList(offset)) as P;
    case 30:
      return (reader.readLongOrNullList(offset)) as P;
    case 31:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 32:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 33:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 34:
      return (reader.readDoubleOrNullList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mainWeatherCacheGetId(MainWeatherCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mainWeatherCacheGetLinks(MainWeatherCache object) {
  return [];
}

void _mainWeatherCacheAttach(
    IsarCollection<dynamic> col, Id id, MainWeatherCache object) {
  object.id = id;
}

extension MainWeatherCacheQueryWhereSort
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QWhere> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MainWeatherCacheQueryWhere
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QWhereClause> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MainWeatherCacheQueryFilter
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QFilterCondition> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentTemperatureMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentTemperatureMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentTemperatureMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentTemperatureMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentTemperatureMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentTemperatureMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentTemperatureMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentTemperatureMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      apparentTemperatureMinLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cloudcover',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cloudcover',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cloudcover',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cloudcover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      cloudcoverLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dewpoint2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dewpoint2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dewpoint2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dewpoint2M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      dewpoint2MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evapotranspiration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'evapotranspiration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'evapotranspiration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'evapotranspiration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      evapotranspirationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationProbability',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationProbability',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationProbability',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationProbability',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationProbabilityMax',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationProbabilityMax',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationProbabilityMax',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationProbabilityMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationProbabilityMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationSum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      precipitationSumLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rainSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rainSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rainSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rainSum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      rainSumLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relativehumidity2M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      relativehumidity2MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortwaveRadiation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortwaveRadiation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortwaveRadiation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortwaveRadiation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      shortwaveRadiationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sunrise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sunrise',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunriseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sunset',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sunset',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      sunsetLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surfacePressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surfacePressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surfacePressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surfacePressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      surfacePressureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature2M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature2M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature2MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature2MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature2MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature2MMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature2MMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature2MMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature2MMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature2MMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      temperature2MMinLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeDaily',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeDaily',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeDaily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timeDailyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timezone',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timezone',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timezone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timezone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezone',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      timezoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timezone',
        value: '',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvIndex',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvIndex',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvIndex',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvIndexMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvIndexMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvIndexMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvIndexMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      uvIndexMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visibility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      visibilityLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weathercode',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weathercode',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weathercode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercodeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weathercodeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weathercodeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weathercodeDaily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      weathercodeDailyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winddirection10M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winddirection10MDominant',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winddirection10MDominant',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winddirection10MDominant',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winddirection10MDominant',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      winddirection10MDominantLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windgusts10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windgusts10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windgusts10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windgusts10M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windgusts10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windgusts10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windgusts10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windgusts10MMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windgusts10MMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windspeed10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windspeed10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windspeed10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windspeed10M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windspeed10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windspeed10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windspeed10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windspeed10MMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
      windspeed10MMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MainWeatherCacheQueryObject
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QFilterCondition> {}

extension MainWeatherCacheQueryLinks
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QFilterCondition> {}

extension MainWeatherCacheQuerySortBy
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QSortBy> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      sortByTimezone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      sortByTimezoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.desc);
    });
  }
}

extension MainWeatherCacheQuerySortThenBy
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QSortThenBy> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      thenByTimezone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
      thenByTimezoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.desc);
    });
  }
}

extension MainWeatherCacheQueryWhereDistinct
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByApparentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperature');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByApparentTemperatureMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperatureMax');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByApparentTemperatureMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperatureMin');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByCloudcover() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudcover');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByDewpoint2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dewpoint2M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByEvapotranspiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evapotranspiration');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByPrecipitation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitation');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByPrecipitationProbability() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationProbability');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByPrecipitationProbabilityMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationProbabilityMax');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByPrecipitationSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationSum');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctByRain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rain');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByRainSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rainSum');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByRelativehumidity2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relativehumidity2M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByShortwaveRadiation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortwaveRadiation');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunrise');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctBySunset() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunset');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctBySurfacePressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surfacePressure');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByTemperature2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByTemperature2MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2MMax');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByTemperature2MMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2MMin');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByTimeDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeDaily');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByTimezone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timezone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByUvIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uvIndex');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByUvIndexMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uvIndexMax');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visibility');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weathercode');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWeathercodeDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weathercodeDaily');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWinddirection10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winddirection10M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWinddirection10MDominant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winddirection10MDominant');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWindgusts10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windgusts10M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWindgusts10MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windgusts10MMax');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWindspeed10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windspeed10M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
      distinctByWindspeed10MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windspeed10MMax');
    });
  }
}

extension MainWeatherCacheQueryProperty
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QQueryProperty> {
  QueryBuilder<MainWeatherCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      apparentTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperature');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      apparentTemperatureMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperatureMax');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      apparentTemperatureMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperatureMin');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      cloudcoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudcover');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      dewpoint2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dewpoint2M');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      evapotranspirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evapotranspiration');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      precipitationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitation');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      precipitationProbabilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationProbability');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      precipitationProbabilityMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationProbabilityMax');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      precipitationSumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationSum');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      rainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rain');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      rainSumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rainSum');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      relativehumidity2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relativehumidity2M');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      shortwaveRadiationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortwaveRadiation');
    });
  }

  QueryBuilder<MainWeatherCache, List<String>?, QQueryOperations>
      sunriseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunrise');
    });
  }

  QueryBuilder<MainWeatherCache, List<String>?, QQueryOperations>
      sunsetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunset');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      surfacePressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surfacePressure');
    });
  }

  QueryBuilder<MainWeatherCache, List<double>?, QQueryOperations>
      temperature2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2M');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      temperature2MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMax');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      temperature2MMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMin');
    });
  }

  QueryBuilder<MainWeatherCache, List<String>?, QQueryOperations>
      timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<MainWeatherCache, List<DateTime>?, QQueryOperations>
      timeDailyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeDaily');
    });
  }

  QueryBuilder<MainWeatherCache, DateTime?, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<MainWeatherCache, String?, QQueryOperations> timezoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timezone');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      uvIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uvIndex');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      uvIndexMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uvIndexMax');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }

  QueryBuilder<MainWeatherCache, List<int>?, QQueryOperations>
      weathercodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercode');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      weathercodeDailyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercodeDaily');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      winddirection10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winddirection10M');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
      winddirection10MDominantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winddirection10MDominant');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      windgusts10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windgusts10M');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      windgusts10MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windgusts10MMax');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      windspeed10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windspeed10M');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
      windspeed10MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windspeed10MMax');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationCacheCollection on Isar {
  IsarCollection<LocationCache> get locationCaches => this.collection();
}

const LocationCacheSchema = CollectionSchema(
  name: r'LocationCache',
  id: 6756051892239209721,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.string,
    ),
    r'district': PropertySchema(
      id: 1,
      name: r'district',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(
      id: 2,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lon': PropertySchema(
      id: 3,
      name: r'lon',
      type: IsarType.double,
    )
  },
  estimateSize: _locationCacheEstimateSize,
  serialize: _locationCacheSerialize,
  deserialize: _locationCacheDeserialize,
  deserializeProp: _locationCacheDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _locationCacheGetId,
  getLinks: _locationCacheGetLinks,
  attach: _locationCacheAttach,
  version: '3.1.7',
);

int _locationCacheEstimateSize(
  LocationCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.district;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _locationCacheSerialize(
  LocationCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.city);
  writer.writeString(offsets[1], object.district);
  writer.writeDouble(offsets[2], object.lat);
  writer.writeDouble(offsets[3], object.lon);
}

LocationCache _locationCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationCache(
    city: reader.readStringOrNull(offsets[0]),
    district: reader.readStringOrNull(offsets[1]),
    lat: reader.readDoubleOrNull(offsets[2]),
    lon: reader.readDoubleOrNull(offsets[3]),
  );
  object.id = id;
  return object;
}

P _locationCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _locationCacheGetId(LocationCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationCacheGetLinks(LocationCache object) {
  return [];
}

void _locationCacheAttach(
    IsarCollection<dynamic> col, Id id, LocationCache object) {
  object.id = id;
}

extension LocationCacheQueryWhereSort
    on QueryBuilder<LocationCache, LocationCache, QWhere> {
  QueryBuilder<LocationCache, LocationCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocationCacheQueryWhere
    on QueryBuilder<LocationCache, LocationCache, QWhereClause> {
  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocationCacheQueryFilter
    on QueryBuilder<LocationCache, LocationCache, QFilterCondition> {
  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      lonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lon',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      lonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lon',
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> lonEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
      lonGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> lonLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> lonBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension LocationCacheQueryObject
    on QueryBuilder<LocationCache, LocationCache, QFilterCondition> {}

extension LocationCacheQueryLinks
    on QueryBuilder<LocationCache, LocationCache, QFilterCondition> {}

extension LocationCacheQuerySortBy
    on QueryBuilder<LocationCache, LocationCache, QSortBy> {
  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy>
      sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> sortByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }
}

extension LocationCacheQuerySortThenBy
    on QueryBuilder<LocationCache, LocationCache, QSortThenBy> {
  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy>
      thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy> thenByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }
}

extension LocationCacheQueryWhereDistinct
    on QueryBuilder<LocationCache, LocationCache, QDistinct> {
  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByDistrict(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lon');
    });
  }
}

extension LocationCacheQueryProperty
    on QueryBuilder<LocationCache, LocationCache, QQueryProperty> {
  QueryBuilder<LocationCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocationCache, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<LocationCache, String?, QQueryOperations> districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<LocationCache, double?, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<LocationCache, double?, QQueryOperations> lonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lon');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeatherCardCollection on Isar {
  IsarCollection<WeatherCard> get weatherCards => this.collection();
}

const WeatherCardSchema = CollectionSchema(
  name: r'WeatherCard',
  id: -6696987654183999616,
  properties: {
    r'apparentTemperature': PropertySchema(
      id: 0,
      name: r'apparentTemperature',
      type: IsarType.doubleList,
    ),
    r'apparentTemperatureMax': PropertySchema(
      id: 1,
      name: r'apparentTemperatureMax',
      type: IsarType.doubleList,
    ),
    r'apparentTemperatureMin': PropertySchema(
      id: 2,
      name: r'apparentTemperatureMin',
      type: IsarType.doubleList,
    ),
    r'city': PropertySchema(
      id: 3,
      name: r'city',
      type: IsarType.string,
    ),
    r'cloudcover': PropertySchema(
      id: 4,
      name: r'cloudcover',
      type: IsarType.longList,
    ),
    r'dewpoint2M': PropertySchema(
      id: 5,
      name: r'dewpoint2M',
      type: IsarType.doubleList,
    ),
    r'district': PropertySchema(
      id: 6,
      name: r'district',
      type: IsarType.string,
    ),
    r'evapotranspiration': PropertySchema(
      id: 7,
      name: r'evapotranspiration',
      type: IsarType.doubleList,
    ),
    r'index': PropertySchema(
      id: 8,
      name: r'index',
      type: IsarType.long,
    ),
    r'lat': PropertySchema(
      id: 9,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lon': PropertySchema(
      id: 10,
      name: r'lon',
      type: IsarType.double,
    ),
    r'precipitation': PropertySchema(
      id: 11,
      name: r'precipitation',
      type: IsarType.doubleList,
    ),
    r'precipitationProbability': PropertySchema(
      id: 12,
      name: r'precipitationProbability',
      type: IsarType.longList,
    ),
    r'precipitationProbabilityMax': PropertySchema(
      id: 13,
      name: r'precipitationProbabilityMax',
      type: IsarType.longList,
    ),
    r'precipitationSum': PropertySchema(
      id: 14,
      name: r'precipitationSum',
      type: IsarType.doubleList,
    ),
    r'rain': PropertySchema(
      id: 15,
      name: r'rain',
      type: IsarType.doubleList,
    ),
    r'rainSum': PropertySchema(
      id: 16,
      name: r'rainSum',
      type: IsarType.doubleList,
    ),
    r'relativehumidity2M': PropertySchema(
      id: 17,
      name: r'relativehumidity2M',
      type: IsarType.longList,
    ),
    r'shortwaveRadiation': PropertySchema(
      id: 18,
      name: r'shortwaveRadiation',
      type: IsarType.doubleList,
    ),
    r'sunrise': PropertySchema(
      id: 19,
      name: r'sunrise',
      type: IsarType.stringList,
    ),
    r'sunset': PropertySchema(
      id: 20,
      name: r'sunset',
      type: IsarType.stringList,
    ),
    r'surfacePressure': PropertySchema(
      id: 21,
      name: r'surfacePressure',
      type: IsarType.doubleList,
    ),
    r'temperature2M': PropertySchema(
      id: 22,
      name: r'temperature2M',
      type: IsarType.doubleList,
    ),
    r'temperature2MMax': PropertySchema(
      id: 23,
      name: r'temperature2MMax',
      type: IsarType.doubleList,
    ),
    r'temperature2MMin': PropertySchema(
      id: 24,
      name: r'temperature2MMin',
      type: IsarType.doubleList,
    ),
    r'time': PropertySchema(
      id: 25,
      name: r'time',
      type: IsarType.stringList,
    ),
    r'timeDaily': PropertySchema(
      id: 26,
      name: r'timeDaily',
      type: IsarType.dateTimeList,
    ),
    r'timestamp': PropertySchema(
      id: 27,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'timezone': PropertySchema(
      id: 28,
      name: r'timezone',
      type: IsarType.string,
    ),
    r'uvIndex': PropertySchema(
      id: 29,
      name: r'uvIndex',
      type: IsarType.doubleList,
    ),
    r'uvIndexMax': PropertySchema(
      id: 30,
      name: r'uvIndexMax',
      type: IsarType.doubleList,
    ),
    r'visibility': PropertySchema(
      id: 31,
      name: r'visibility',
      type: IsarType.doubleList,
    ),
    r'weathercode': PropertySchema(
      id: 32,
      name: r'weathercode',
      type: IsarType.longList,
    ),
    r'weathercodeDaily': PropertySchema(
      id: 33,
      name: r'weathercodeDaily',
      type: IsarType.longList,
    ),
    r'winddirection10M': PropertySchema(
      id: 34,
      name: r'winddirection10M',
      type: IsarType.longList,
    ),
    r'winddirection10MDominant': PropertySchema(
      id: 35,
      name: r'winddirection10MDominant',
      type: IsarType.longList,
    ),
    r'windgusts10M': PropertySchema(
      id: 36,
      name: r'windgusts10M',
      type: IsarType.doubleList,
    ),
    r'windgusts10MMax': PropertySchema(
      id: 37,
      name: r'windgusts10MMax',
      type: IsarType.doubleList,
    ),
    r'windspeed10M': PropertySchema(
      id: 38,
      name: r'windspeed10M',
      type: IsarType.doubleList,
    ),
    r'windspeed10MMax': PropertySchema(
      id: 39,
      name: r'windspeed10MMax',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _weatherCardEstimateSize,
  serialize: _weatherCardSerialize,
  deserialize: _weatherCardDeserialize,
  deserializeProp: _weatherCardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _weatherCardGetId,
  getLinks: _weatherCardGetLinks,
  attach: _weatherCardAttach,
  version: '3.1.7',
);

int _weatherCardEstimateSize(
  WeatherCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.apparentTemperature;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.apparentTemperatureMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.apparentTemperatureMin;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cloudcover;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.dewpoint2M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.district;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.evapotranspiration;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitation;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitationProbability;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitationProbabilityMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.precipitationSum;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.rain;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.rainSum;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.relativehumidity2M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.shortwaveRadiation;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.sunrise;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.sunset;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.surfacePressure;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.temperature2M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.temperature2MMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.temperature2MMin;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.time;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.timeDaily;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.timezone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uvIndex;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.uvIndexMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.visibility;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.weathercode;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.weathercodeDaily;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.winddirection10M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.winddirection10MDominant;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windgusts10M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windgusts10MMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windspeed10M;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.windspeed10MMax;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _weatherCardSerialize(
  WeatherCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.apparentTemperature);
  writer.writeDoubleList(offsets[1], object.apparentTemperatureMax);
  writer.writeDoubleList(offsets[2], object.apparentTemperatureMin);
  writer.writeString(offsets[3], object.city);
  writer.writeLongList(offsets[4], object.cloudcover);
  writer.writeDoubleList(offsets[5], object.dewpoint2M);
  writer.writeString(offsets[6], object.district);
  writer.writeDoubleList(offsets[7], object.evapotranspiration);
  writer.writeLong(offsets[8], object.index);
  writer.writeDouble(offsets[9], object.lat);
  writer.writeDouble(offsets[10], object.lon);
  writer.writeDoubleList(offsets[11], object.precipitation);
  writer.writeLongList(offsets[12], object.precipitationProbability);
  writer.writeLongList(offsets[13], object.precipitationProbabilityMax);
  writer.writeDoubleList(offsets[14], object.precipitationSum);
  writer.writeDoubleList(offsets[15], object.rain);
  writer.writeDoubleList(offsets[16], object.rainSum);
  writer.writeLongList(offsets[17], object.relativehumidity2M);
  writer.writeDoubleList(offsets[18], object.shortwaveRadiation);
  writer.writeStringList(offsets[19], object.sunrise);
  writer.writeStringList(offsets[20], object.sunset);
  writer.writeDoubleList(offsets[21], object.surfacePressure);
  writer.writeDoubleList(offsets[22], object.temperature2M);
  writer.writeDoubleList(offsets[23], object.temperature2MMax);
  writer.writeDoubleList(offsets[24], object.temperature2MMin);
  writer.writeStringList(offsets[25], object.time);
  writer.writeDateTimeList(offsets[26], object.timeDaily);
  writer.writeDateTime(offsets[27], object.timestamp);
  writer.writeString(offsets[28], object.timezone);
  writer.writeDoubleList(offsets[29], object.uvIndex);
  writer.writeDoubleList(offsets[30], object.uvIndexMax);
  writer.writeDoubleList(offsets[31], object.visibility);
  writer.writeLongList(offsets[32], object.weathercode);
  writer.writeLongList(offsets[33], object.weathercodeDaily);
  writer.writeLongList(offsets[34], object.winddirection10M);
  writer.writeLongList(offsets[35], object.winddirection10MDominant);
  writer.writeDoubleList(offsets[36], object.windgusts10M);
  writer.writeDoubleList(offsets[37], object.windgusts10MMax);
  writer.writeDoubleList(offsets[38], object.windspeed10M);
  writer.writeDoubleList(offsets[39], object.windspeed10MMax);
}

WeatherCard _weatherCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherCard(
    apparentTemperature: reader.readDoubleOrNullList(offsets[0]),
    apparentTemperatureMax: reader.readDoubleOrNullList(offsets[1]),
    apparentTemperatureMin: reader.readDoubleOrNullList(offsets[2]),
    city: reader.readStringOrNull(offsets[3]),
    cloudcover: reader.readLongOrNullList(offsets[4]),
    dewpoint2M: reader.readDoubleOrNullList(offsets[5]),
    district: reader.readStringOrNull(offsets[6]),
    evapotranspiration: reader.readDoubleOrNullList(offsets[7]),
    index: reader.readLongOrNull(offsets[8]),
    lat: reader.readDoubleOrNull(offsets[9]),
    lon: reader.readDoubleOrNull(offsets[10]),
    precipitation: reader.readDoubleOrNullList(offsets[11]),
    precipitationProbability: reader.readLongOrNullList(offsets[12]),
    precipitationProbabilityMax: reader.readLongOrNullList(offsets[13]),
    precipitationSum: reader.readDoubleOrNullList(offsets[14]),
    rain: reader.readDoubleOrNullList(offsets[15]),
    rainSum: reader.readDoubleOrNullList(offsets[16]),
    relativehumidity2M: reader.readLongOrNullList(offsets[17]),
    shortwaveRadiation: reader.readDoubleOrNullList(offsets[18]),
    sunrise: reader.readStringList(offsets[19]),
    sunset: reader.readStringList(offsets[20]),
    surfacePressure: reader.readDoubleOrNullList(offsets[21]),
    temperature2M: reader.readDoubleList(offsets[22]),
    temperature2MMax: reader.readDoubleOrNullList(offsets[23]),
    temperature2MMin: reader.readDoubleOrNullList(offsets[24]),
    time: reader.readStringList(offsets[25]),
    timeDaily: reader.readDateTimeList(offsets[26]),
    timestamp: reader.readDateTimeOrNull(offsets[27]),
    timezone: reader.readStringOrNull(offsets[28]),
    uvIndex: reader.readDoubleOrNullList(offsets[29]),
    uvIndexMax: reader.readDoubleOrNullList(offsets[30]),
    visibility: reader.readDoubleOrNullList(offsets[31]),
    weathercode: reader.readLongList(offsets[32]),
    weathercodeDaily: reader.readLongOrNullList(offsets[33]),
    winddirection10M: reader.readLongOrNullList(offsets[34]),
    winddirection10MDominant: reader.readLongOrNullList(offsets[35]),
    windgusts10M: reader.readDoubleOrNullList(offsets[36]),
    windgusts10MMax: reader.readDoubleOrNullList(offsets[37]),
    windspeed10M: reader.readDoubleOrNullList(offsets[38]),
    windspeed10MMax: reader.readDoubleOrNullList(offsets[39]),
  );
  object.id = id;
  return object;
}

P _weatherCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 1:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 2:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNullList(offset)) as P;
    case 5:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 12:
      return (reader.readLongOrNullList(offset)) as P;
    case 13:
      return (reader.readLongOrNullList(offset)) as P;
    case 14:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 15:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 16:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 17:
      return (reader.readLongOrNullList(offset)) as P;
    case 18:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 19:
      return (reader.readStringList(offset)) as P;
    case 20:
      return (reader.readStringList(offset)) as P;
    case 21:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 22:
      return (reader.readDoubleList(offset)) as P;
    case 23:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 24:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 25:
      return (reader.readStringList(offset)) as P;
    case 26:
      return (reader.readDateTimeList(offset)) as P;
    case 27:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 30:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 31:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 32:
      return (reader.readLongList(offset)) as P;
    case 33:
      return (reader.readLongOrNullList(offset)) as P;
    case 34:
      return (reader.readLongOrNullList(offset)) as P;
    case 35:
      return (reader.readLongOrNullList(offset)) as P;
    case 36:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 37:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 38:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 39:
      return (reader.readDoubleOrNullList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weatherCardGetId(WeatherCard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weatherCardGetLinks(WeatherCard object) {
  return [];
}

void _weatherCardAttach(
    IsarCollection<dynamic> col, Id id, WeatherCard object) {
  object.id = id;
}

extension WeatherCardQueryWhereSort
    on QueryBuilder<WeatherCard, WeatherCard, QWhere> {
  QueryBuilder<WeatherCard, WeatherCard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeatherCardQueryWhere
    on QueryBuilder<WeatherCard, WeatherCard, QWhereClause> {
  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeatherCardQueryFilter
    on QueryBuilder<WeatherCard, WeatherCard, QFilterCondition> {
  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'apparentTemperature',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentTemperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentTemperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'apparentTemperatureMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentTemperatureMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentTemperatureMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentTemperatureMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentTemperatureMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'apparentTemperatureMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentTemperatureMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentTemperatureMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentTemperatureMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentTemperatureMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      apparentTemperatureMinLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'apparentTemperatureMin',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'cloudcover',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cloudcover',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cloudcover',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cloudcover',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cloudcover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      cloudcoverLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cloudcover',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'dewpoint2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dewpoint2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dewpoint2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dewpoint2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dewpoint2M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      dewpoint2MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dewpoint2M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> districtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> districtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'evapotranspiration',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evapotranspiration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'evapotranspiration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'evapotranspiration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'evapotranspiration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      evapotranspirationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evapotranspiration',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lon',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lon',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitation',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitationProbability',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationProbability',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationProbability',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationProbability',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationProbability',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbability',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitationProbabilityMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationProbabilityMax',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationProbabilityMax',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationProbabilityMax',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationProbabilityMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationProbabilityMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationProbabilityMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'precipitationSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationSum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      precipitationSumLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'precipitationSum',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> rainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> rainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rain',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'rainSum',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rainSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rainSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rainSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rainSum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      rainSumLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rainSum',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'relativehumidity2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relativehumidity2M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      relativehumidity2MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relativehumidity2M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'shortwaveRadiation',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortwaveRadiation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortwaveRadiation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortwaveRadiation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortwaveRadiation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      shortwaveRadiationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shortwaveRadiation',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sunrise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sunrise',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunriseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunrise',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> sunsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sunset',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sunset',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      sunsetLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunset',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'surfacePressure',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surfacePressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surfacePressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surfacePressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surfacePressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      surfacePressureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surfacePressure',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature2M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature2M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature2M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'temperature2MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature2MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature2MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature2MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature2MMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'temperature2MMin',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature2MMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature2MMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature2MMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature2MMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      temperature2MMinLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temperature2MMin',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'time',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeDaily',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeDaily',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeDaily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timeDailyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeDaily',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timezone',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timezone',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timezoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timezoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timezone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timezoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timezone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezone',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      timezoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timezone',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'uvIndex',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvIndex',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvIndex',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvIndex',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndex',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'uvIndexMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvIndexMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvIndexMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvIndexMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvIndexMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      uvIndexMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uvIndexMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visibility',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visibility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      visibilityLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visibility',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weathercode',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weathercode',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weathercode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercode',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'weathercodeDaily',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercodeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weathercodeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weathercodeDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weathercodeDaily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      weathercodeDailyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weathercodeDaily',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'winddirection10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winddirection10M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'winddirection10MDominant',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winddirection10MDominant',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winddirection10MDominant',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winddirection10MDominant',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantElementBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winddirection10MDominant',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      winddirection10MDominantLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'winddirection10MDominant',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windgusts10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windgusts10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windgusts10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windgusts10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windgusts10M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windgusts10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windgusts10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windgusts10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windgusts10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windgusts10MMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windgusts10MMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windgusts10MMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windspeed10M',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windspeed10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windspeed10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windspeed10M',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windspeed10M',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10M',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'windspeed10MMax',
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windspeed10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windspeed10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windspeed10MMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windspeed10MMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
      windspeed10MMaxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'windspeed10MMax',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension WeatherCardQueryObject
    on QueryBuilder<WeatherCard, WeatherCard, QFilterCondition> {}

extension WeatherCardQueryLinks
    on QueryBuilder<WeatherCard, WeatherCard, QFilterCondition> {}

extension WeatherCardQuerySortBy
    on QueryBuilder<WeatherCard, WeatherCard, QSortBy> {
  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByTimezone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> sortByTimezoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.desc);
    });
  }
}

extension WeatherCardQuerySortThenBy
    on QueryBuilder<WeatherCard, WeatherCard, QSortThenBy> {
  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByTimezone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy> thenByTimezoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timezone', Sort.desc);
    });
  }
}

extension WeatherCardQueryWhereDistinct
    on QueryBuilder<WeatherCard, WeatherCard, QDistinct> {
  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByApparentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperature');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByApparentTemperatureMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperatureMax');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByApparentTemperatureMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperatureMin');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByCloudcover() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudcover');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByDewpoint2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dewpoint2M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByDistrict(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByEvapotranspiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evapotranspiration');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'index');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lon');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByPrecipitation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitation');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByPrecipitationProbability() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationProbability');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByPrecipitationProbabilityMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationProbabilityMax');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByPrecipitationSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationSum');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByRain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rain');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByRainSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rainSum');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByRelativehumidity2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relativehumidity2M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByShortwaveRadiation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortwaveRadiation');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunrise');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctBySunset() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunset');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctBySurfacePressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surfacePressure');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByTemperature2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByTemperature2MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2MMax');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByTemperature2MMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2MMin');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByTimeDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeDaily');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByTimezone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timezone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByUvIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uvIndex');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByUvIndexMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uvIndexMax');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visibility');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weathercode');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByWeathercodeDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weathercodeDaily');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByWinddirection10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winddirection10M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByWinddirection10MDominant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winddirection10MDominant');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByWindgusts10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windgusts10M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByWindgusts10MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windgusts10MMax');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByWindspeed10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windspeed10M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
      distinctByWindspeed10MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windspeed10MMax');
    });
  }
}

extension WeatherCardQueryProperty
    on QueryBuilder<WeatherCard, WeatherCard, QQueryProperty> {
  QueryBuilder<WeatherCard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      apparentTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperature');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      apparentTemperatureMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperatureMax');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      apparentTemperatureMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperatureMin');
    });
  }

  QueryBuilder<WeatherCard, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      cloudcoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudcover');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      dewpoint2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dewpoint2M');
    });
  }

  QueryBuilder<WeatherCard, String?, QQueryOperations> districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      evapotranspirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evapotranspiration');
    });
  }

  QueryBuilder<WeatherCard, int?, QQueryOperations> indexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'index');
    });
  }

  QueryBuilder<WeatherCard, double?, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<WeatherCard, double?, QQueryOperations> lonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lon');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      precipitationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitation');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      precipitationProbabilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationProbability');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      precipitationProbabilityMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationProbabilityMax');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      precipitationSumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationSum');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> rainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rain');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      rainSumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rainSum');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      relativehumidity2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relativehumidity2M');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      shortwaveRadiationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortwaveRadiation');
    });
  }

  QueryBuilder<WeatherCard, List<String>?, QQueryOperations> sunriseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunrise');
    });
  }

  QueryBuilder<WeatherCard, List<String>?, QQueryOperations> sunsetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunset');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      surfacePressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surfacePressure');
    });
  }

  QueryBuilder<WeatherCard, List<double>?, QQueryOperations>
      temperature2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2M');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      temperature2MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMax');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      temperature2MMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMin');
    });
  }

  QueryBuilder<WeatherCard, List<String>?, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<WeatherCard, List<DateTime>?, QQueryOperations>
      timeDailyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeDaily');
    });
  }

  QueryBuilder<WeatherCard, DateTime?, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<WeatherCard, String?, QQueryOperations> timezoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timezone');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      uvIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uvIndex');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      uvIndexMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uvIndexMax');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }

  QueryBuilder<WeatherCard, List<int>?, QQueryOperations>
      weathercodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercode');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      weathercodeDailyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercodeDaily');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      winddirection10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winddirection10M');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
      winddirection10MDominantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winddirection10MDominant');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      windgusts10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windgusts10M');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      windgusts10MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windgusts10MMax');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      windspeed10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windspeed10M');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations>
      windspeed10MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windspeed10MMax');
    });
  }
}
