// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

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
    r'appFont': PropertySchema(id: 1, name: r'appFont', type: IsarType.string),
    r'aqiStandard': PropertySchema(
      id: 2,
      name: r'aqiStandard',
      type: IsarType.string,
    ),
    r'clockSkewSeconds': PropertySchema(
      id: 3,
      name: r'clockSkewSeconds',
      type: IsarType.long,
    ),
    r'colorPalette': PropertySchema(
      id: 4,
      name: r'colorPalette',
      type: IsarType.string,
    ),
    r'degrees': PropertySchema(id: 5, name: r'degrees', type: IsarType.string),
    r'hideMap': PropertySchema(id: 6, name: r'hideMap', type: IsarType.bool),
    r'language': PropertySchema(
      id: 7,
      name: r'language',
      type: IsarType.string,
    ),
    r'largeElement': PropertySchema(
      id: 8,
      name: r'largeElement',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(id: 9, name: r'location', type: IsarType.bool),
    r'materialColor': PropertySchema(
      id: 10,
      name: r'materialColor',
      type: IsarType.bool,
    ),
    r'measurements': PropertySchema(
      id: 11,
      name: r'measurements',
      type: IsarType.string,
    ),
    r'notificationChannelVersion': PropertySchema(
      id: 12,
      name: r'notificationChannelVersion',
      type: IsarType.long,
    ),
    r'notificationSound': PropertySchema(
      id: 13,
      name: r'notificationSound',
      type: IsarType.bool,
    ),
    r'notificationWeekdaysMask': PropertySchema(
      id: 14,
      name: r'notificationWeekdaysMask',
      type: IsarType.long,
    ),
    r'notifications': PropertySchema(
      id: 15,
      name: r'notifications',
      type: IsarType.bool,
    ),
    r'onboard': PropertySchema(id: 16, name: r'onboard', type: IsarType.bool),
    r'persistentNotification': PropertySchema(
      id: 17,
      name: r'persistentNotification',
      type: IsarType.bool,
    ),
    r'pressure': PropertySchema(
      id: 18,
      name: r'pressure',
      type: IsarType.string,
    ),
    r'roundDegree': PropertySchema(
      id: 19,
      name: r'roundDegree',
      type: IsarType.bool,
    ),
    r'theme': PropertySchema(id: 20, name: r'theme', type: IsarType.string),
    r'timeEnd': PropertySchema(id: 21, name: r'timeEnd', type: IsarType.string),
    r'timeRange': PropertySchema(
      id: 22,
      name: r'timeRange',
      type: IsarType.long,
    ),
    r'timeStart': PropertySchema(
      id: 23,
      name: r'timeStart',
      type: IsarType.string,
    ),
    r'timeformat': PropertySchema(
      id: 24,
      name: r'timeformat',
      type: IsarType.string,
    ),
    r'weatherCacheVersion': PropertySchema(
      id: 25,
      name: r'weatherCacheVersion',
      type: IsarType.long,
    ),
    r'weatherIconTheme': PropertySchema(
      id: 26,
      name: r'weatherIconTheme',
      type: IsarType.string,
    ),
    r'widgetBackgroundColor': PropertySchema(
      id: 27,
      name: r'widgetBackgroundColor',
      type: IsarType.string,
    ),
    r'widgetBackgroundColorDark': PropertySchema(
      id: 28,
      name: r'widgetBackgroundColorDark',
      type: IsarType.string,
    ),
    r'widgetBackgroundColorLight': PropertySchema(
      id: 29,
      name: r'widgetBackgroundColorLight',
      type: IsarType.string,
    ),
    r'widgetTextColor': PropertySchema(
      id: 30,
      name: r'widgetTextColor',
      type: IsarType.string,
    ),
    r'widgetTextColorDark': PropertySchema(
      id: 31,
      name: r'widgetTextColorDark',
      type: IsarType.string,
    ),
    r'widgetTextColorLight': PropertySchema(
      id: 32,
      name: r'widgetTextColorLight',
      type: IsarType.string,
    ),
    r'wind': PropertySchema(id: 33, name: r'wind', type: IsarType.string),
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
  version: '3.3.2',
);

int _settingsEstimateSize(
  Settings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.appFont.length * 3;
  bytesCount += 3 + object.aqiStandard.length * 3;
  bytesCount += 3 + object.colorPalette.length * 3;
  bytesCount += 3 + object.degrees.length * 3;
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.measurements.length * 3;
  bytesCount += 3 + object.pressure.length * 3;
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
  bytesCount += 3 + object.weatherIconTheme.length * 3;
  {
    final value = object.widgetBackgroundColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.widgetBackgroundColorDark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.widgetBackgroundColorLight;
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
  {
    final value = object.widgetTextColorDark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.widgetTextColorLight;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.wind.length * 3;
  return bytesCount;
}

void _settingsSerialize(
  Settings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.amoledTheme);
  writer.writeString(offsets[1], object.appFont);
  writer.writeString(offsets[2], object.aqiStandard);
  writer.writeLong(offsets[3], object.clockSkewSeconds);
  writer.writeString(offsets[4], object.colorPalette);
  writer.writeString(offsets[5], object.degrees);
  writer.writeBool(offsets[6], object.hideMap);
  writer.writeString(offsets[7], object.language);
  writer.writeBool(offsets[8], object.largeElement);
  writer.writeBool(offsets[9], object.location);
  writer.writeBool(offsets[10], object.materialColor);
  writer.writeString(offsets[11], object.measurements);
  writer.writeLong(offsets[12], object.notificationChannelVersion);
  writer.writeBool(offsets[13], object.notificationSound);
  writer.writeLong(offsets[14], object.notificationWeekdaysMask);
  writer.writeBool(offsets[15], object.notifications);
  writer.writeBool(offsets[16], object.onboard);
  writer.writeBool(offsets[17], object.persistentNotification);
  writer.writeString(offsets[18], object.pressure);
  writer.writeBool(offsets[19], object.roundDegree);
  writer.writeString(offsets[20], object.theme);
  writer.writeString(offsets[21], object.timeEnd);
  writer.writeLong(offsets[22], object.timeRange);
  writer.writeString(offsets[23], object.timeStart);
  writer.writeString(offsets[24], object.timeformat);
  writer.writeLong(offsets[25], object.weatherCacheVersion);
  writer.writeString(offsets[26], object.weatherIconTheme);
  writer.writeString(offsets[27], object.widgetBackgroundColor);
  writer.writeString(offsets[28], object.widgetBackgroundColorDark);
  writer.writeString(offsets[29], object.widgetBackgroundColorLight);
  writer.writeString(offsets[30], object.widgetTextColor);
  writer.writeString(offsets[31], object.widgetTextColorDark);
  writer.writeString(offsets[32], object.widgetTextColorLight);
  writer.writeString(offsets[33], object.wind);
}

Settings _settingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Settings();
  object.amoledTheme = reader.readBool(offsets[0]);
  object.appFont = reader.readString(offsets[1]);
  object.aqiStandard = reader.readString(offsets[2]);
  object.clockSkewSeconds = reader.readLong(offsets[3]);
  object.colorPalette = reader.readString(offsets[4]);
  object.degrees = reader.readString(offsets[5]);
  object.hideMap = reader.readBool(offsets[6]);
  object.id = id;
  object.language = reader.readStringOrNull(offsets[7]);
  object.largeElement = reader.readBool(offsets[8]);
  object.location = reader.readBool(offsets[9]);
  object.materialColor = reader.readBool(offsets[10]);
  object.measurements = reader.readString(offsets[11]);
  object.notificationChannelVersion = reader.readLong(offsets[12]);
  object.notificationSound = reader.readBool(offsets[13]);
  object.notificationWeekdaysMask = reader.readLongOrNull(offsets[14]);
  object.notifications = reader.readBool(offsets[15]);
  object.onboard = reader.readBool(offsets[16]);
  object.persistentNotification = reader.readBool(offsets[17]);
  object.pressure = reader.readString(offsets[18]);
  object.roundDegree = reader.readBool(offsets[19]);
  object.theme = reader.readStringOrNull(offsets[20]);
  object.timeEnd = reader.readStringOrNull(offsets[21]);
  object.timeRange = reader.readLongOrNull(offsets[22]);
  object.timeStart = reader.readStringOrNull(offsets[23]);
  object.timeformat = reader.readString(offsets[24]);
  object.weatherCacheVersion = reader.readLong(offsets[25]);
  object.weatherIconTheme = reader.readString(offsets[26]);
  object.widgetBackgroundColor = reader.readStringOrNull(offsets[27]);
  object.widgetBackgroundColorDark = reader.readStringOrNull(offsets[28]);
  object.widgetBackgroundColorLight = reader.readStringOrNull(offsets[29]);
  object.widgetTextColor = reader.readStringOrNull(offsets[30]);
  object.widgetTextColorDark = reader.readStringOrNull(offsets[31]);
  object.widgetTextColorLight = reader.readStringOrNull(offsets[32]);
  object.wind = reader.readString(offsets[33]);
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readLong(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readString(offset)) as P;
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
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
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

  QueryBuilder<Settings, Settings, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
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
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> amoledThemeEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'amoledTheme', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'appFont',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'appFont',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'appFont',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'appFont',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'appFont',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'appFont',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'appFont',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'appFont',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'appFont', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> appFontIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'appFont', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'aqiStandard',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  aqiStandardGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aqiStandard',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aqiStandard',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aqiStandard',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'aqiStandard',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'aqiStandard',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'aqiStandard',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'aqiStandard',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> aqiStandardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aqiStandard', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  aqiStandardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'aqiStandard', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  clockSkewSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockSkewSeconds', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  clockSkewSecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockSkewSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  clockSkewSecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockSkewSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  clockSkewSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockSkewSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> colorPaletteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'colorPalette',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  colorPaletteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'colorPalette',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> colorPaletteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'colorPalette',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> colorPaletteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'colorPalette',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  colorPaletteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'colorPalette',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> colorPaletteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'colorPalette',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> colorPaletteContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'colorPalette',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> colorPaletteMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'colorPalette',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  colorPaletteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'colorPalette', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  colorPaletteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'colorPalette', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'degrees',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'degrees',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'degrees',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'degrees',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'degrees',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'degrees',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'degrees',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'degrees',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'degrees', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> degreesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'degrees', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> hideMapEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hideMap', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'language'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'language'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'language',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'language',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'language', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'language', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> largeElementEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'largeElement', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> locationEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'location', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> materialColorEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'materialColor', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'measurements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  measurementsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'measurements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'measurements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'measurements',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  measurementsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'measurements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'measurements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'measurements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> measurementsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'measurements',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  measurementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'measurements', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  measurementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'measurements', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationChannelVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notificationChannelVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationChannelVersionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notificationChannelVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationChannelVersionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notificationChannelVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationChannelVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notificationChannelVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationSoundEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notificationSound', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationWeekdaysMaskIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notificationWeekdaysMask'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationWeekdaysMaskIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notificationWeekdaysMask'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationWeekdaysMaskEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notificationWeekdaysMask',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationWeekdaysMaskGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notificationWeekdaysMask',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationWeekdaysMaskLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notificationWeekdaysMask',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  notificationWeekdaysMaskBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notificationWeekdaysMask',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> notificationsEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notifications', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> onboardEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onboard', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  persistentNotificationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'persistentNotification',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pressure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pressure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pressure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pressure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pressure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pressure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pressure',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pressure', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> pressureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pressure', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> roundDegreeEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'roundDegree', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'theme'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'theme'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'theme',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'theme',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'theme', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'theme', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeEnd'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeEnd'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeEnd',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeEnd',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeEnd',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeEnd',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timeEnd',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timeEnd',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timeEnd',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timeEnd',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeEnd', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeEndIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timeEnd', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeRange'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeRange'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeRange', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeRange',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeRange',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeRangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeRange',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeStart'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeStart'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeStart',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeStart',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeStart',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeStart',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timeStart',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timeStart',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timeStart',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timeStart',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeStartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeStart', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  timeStartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timeStart', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeformat',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeformat',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeformat',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeformat',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timeformat',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timeformat',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timeformat',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timeformat',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> timeformatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeformat', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  timeformatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timeformat', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherCacheVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weatherCacheVersion', value: value),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherCacheVersionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weatherCacheVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherCacheVersionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weatherCacheVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherCacheVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weatherCacheVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'weatherIconTheme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weatherIconTheme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weatherIconTheme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weatherIconTheme',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'weatherIconTheme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'weatherIconTheme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'weatherIconTheme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'weatherIconTheme',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weatherIconTheme', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  weatherIconThemeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'weatherIconTheme', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widgetBackgroundColor'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'widgetBackgroundColor'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetBackgroundColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widgetBackgroundColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widgetBackgroundColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widgetBackgroundColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'widgetBackgroundColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'widgetBackgroundColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'widgetBackgroundColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'widgetBackgroundColor',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'widgetBackgroundColor', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'widgetBackgroundColor',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widgetBackgroundColorDark'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'widgetBackgroundColorDark'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetBackgroundColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widgetBackgroundColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widgetBackgroundColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widgetBackgroundColorDark',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'widgetBackgroundColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'widgetBackgroundColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'widgetBackgroundColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'widgetBackgroundColorDark',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetBackgroundColorDark',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorDarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'widgetBackgroundColorDark',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widgetBackgroundColorLight'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'widgetBackgroundColorLight',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetBackgroundColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widgetBackgroundColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widgetBackgroundColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widgetBackgroundColorLight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'widgetBackgroundColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'widgetBackgroundColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'widgetBackgroundColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'widgetBackgroundColorLight',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetBackgroundColorLight',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetBackgroundColorLightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'widgetBackgroundColorLight',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widgetTextColor'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'widgetTextColor'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetTextColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widgetTextColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widgetTextColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widgetTextColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'widgetTextColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'widgetTextColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'widgetTextColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'widgetTextColor',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'widgetTextColor', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'widgetTextColor', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widgetTextColorDark'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'widgetTextColorDark'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetTextColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widgetTextColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widgetTextColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widgetTextColorDark',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'widgetTextColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'widgetTextColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'widgetTextColorDark',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'widgetTextColorDark',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'widgetTextColorDark', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorDarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'widgetTextColorDark',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widgetTextColorLight'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'widgetTextColorLight'),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'widgetTextColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widgetTextColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widgetTextColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widgetTextColorLight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'widgetTextColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'widgetTextColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'widgetTextColorLight',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'widgetTextColorLight',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'widgetTextColorLight', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
  widgetTextColorLightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'widgetTextColorLight',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'wind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'wind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'wind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'wind',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'wind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'wind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'wind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'wind',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'wind', value: ''),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> windIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'wind', value: ''),
      );
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

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByAppFont() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFont', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByAppFontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFont', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByAqiStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aqiStandard', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByAqiStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aqiStandard', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByClockSkewSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByColorPalette() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPalette', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByColorPaletteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPalette', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByHideMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideMap', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByHideMapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideMap', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLargeElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeElement', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByLargeElementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeElement', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByNotificationChannelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationChannelVersion', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByNotificationChannelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationChannelVersion', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByNotificationSound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByNotificationSoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByNotificationWeekdaysMask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationWeekdaysMask', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByNotificationWeekdaysMaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationWeekdaysMask', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByPersistentNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persistentNotification', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByPersistentNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persistentNotification', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWeatherCacheVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCacheVersion', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWeatherCacheVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCacheVersion', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWeatherIconTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherIconTheme', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWeatherIconThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherIconTheme', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWidgetBackgroundColorDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorDark', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWidgetBackgroundColorDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorDark', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWidgetBackgroundColorLight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorLight', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWidgetBackgroundColorLightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorLight', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWidgetTextColorDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorDark', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWidgetTextColorDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorDark', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWidgetTextColorLight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorLight', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  sortByWidgetTextColorLightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorLight', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wind', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByWindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wind', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByAppFont() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFont', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByAppFontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFont', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByAqiStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aqiStandard', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByAqiStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aqiStandard', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByClockSkewSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByColorPalette() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPalette', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByColorPaletteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPalette', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByHideMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideMap', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByHideMapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideMap', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLargeElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeElement', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByLargeElementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeElement', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByNotificationChannelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationChannelVersion', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByNotificationChannelVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationChannelVersion', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByNotificationSound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByNotificationSoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByNotificationWeekdaysMask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationWeekdaysMask', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByNotificationWeekdaysMaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationWeekdaysMask', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByPersistentNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persistentNotification', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByPersistentNotificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'persistentNotification', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWeatherCacheVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCacheVersion', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWeatherCacheVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCacheVersion', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWeatherIconTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherIconTheme', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWeatherIconThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherIconTheme', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWidgetBackgroundColorDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorDark', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWidgetBackgroundColorDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorDark', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWidgetBackgroundColorLight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorLight', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWidgetBackgroundColorLightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetBackgroundColorLight', Sort.desc);
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

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWidgetTextColorDark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorDark', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWidgetTextColorDarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorDark', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWidgetTextColorLight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorLight', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy>
  thenByWidgetTextColorLightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTextColorLight', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wind', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByWindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wind', Sort.desc);
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

  QueryBuilder<Settings, Settings, QDistinct> distinctByAppFont({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appFont', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByAqiStandard({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aqiStandard', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockSkewSeconds');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByColorPalette({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorPalette', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByDegrees({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'degrees', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByHideMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hideMap');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByLanguage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByLargeElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'largeElement');
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

  QueryBuilder<Settings, Settings, QDistinct> distinctByMeasurements({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measurements', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct>
  distinctByNotificationChannelVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationChannelVersion');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByNotificationSound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationSound');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct>
  distinctByNotificationWeekdaysMask() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationWeekdaysMask');
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

  QueryBuilder<Settings, Settings, QDistinct>
  distinctByPersistentNotification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'persistentNotification');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByPressure({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pressure', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByRoundDegree() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundDegree');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTheme({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeEnd({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeEnd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeRange');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeStart({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeStart', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTimeformat({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeformat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWeatherCacheVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherCacheVersion');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWeatherIconTheme({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'weatherIconTheme',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWidgetBackgroundColor({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'widgetBackgroundColor',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct>
  distinctByWidgetBackgroundColorDark({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'widgetBackgroundColorDark',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct>
  distinctByWidgetBackgroundColorLight({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'widgetBackgroundColorLight',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWidgetTextColor({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'widgetTextColor',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWidgetTextColorDark({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'widgetTextColorDark',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWidgetTextColorLight({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'widgetTextColorLight',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByWind({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wind', caseSensitive: caseSensitive);
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

  QueryBuilder<Settings, String, QQueryOperations> appFontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appFont');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> aqiStandardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aqiStandard');
    });
  }

  QueryBuilder<Settings, int, QQueryOperations> clockSkewSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockSkewSeconds');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> colorPaletteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorPalette');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> degreesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'degrees');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> hideMapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hideMap');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> largeElementProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'largeElement');
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

  QueryBuilder<Settings, int, QQueryOperations>
  notificationChannelVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationChannelVersion');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> notificationSoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationSound');
    });
  }

  QueryBuilder<Settings, int?, QQueryOperations>
  notificationWeekdaysMaskProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationWeekdaysMask');
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

  QueryBuilder<Settings, bool, QQueryOperations>
  persistentNotificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'persistentNotification');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> pressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pressure');
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

  QueryBuilder<Settings, int, QQueryOperations> weatherCacheVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherCacheVersion');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> weatherIconThemeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherIconTheme');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
  widgetBackgroundColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetBackgroundColor');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
  widgetBackgroundColorDarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetBackgroundColorDark');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
  widgetBackgroundColorLightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetBackgroundColorLight');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations> widgetTextColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetTextColor');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
  widgetTextColorDarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetTextColorDark');
    });
  }

  QueryBuilder<Settings, String?, QQueryOperations>
  widgetTextColorLightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetTextColorLight');
    });
  }

  QueryBuilder<Settings, String, QQueryOperations> windProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wind');
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
    r'clockSkewSeconds': PropertySchema(
      id: 3,
      name: r'clockSkewSeconds',
      type: IsarType.long,
    ),
    r'cloudcover': PropertySchema(
      id: 4,
      name: r'cloudcover',
      type: IsarType.longList,
    ),
    r'co': PropertySchema(id: 5, name: r'co', type: IsarType.doubleList),
    r'dewpoint2M': PropertySchema(
      id: 6,
      name: r'dewpoint2M',
      type: IsarType.doubleList,
    ),
    r'europeanAqi': PropertySchema(
      id: 7,
      name: r'europeanAqi',
      type: IsarType.doubleList,
    ),
    r'evapotranspiration': PropertySchema(
      id: 8,
      name: r'evapotranspiration',
      type: IsarType.doubleList,
    ),
    r'no2': PropertySchema(id: 9, name: r'no2', type: IsarType.doubleList),
    r'ozone': PropertySchema(id: 10, name: r'ozone', type: IsarType.doubleList),
    r'pm10': PropertySchema(id: 11, name: r'pm10', type: IsarType.doubleList),
    r'pm25': PropertySchema(id: 12, name: r'pm25', type: IsarType.doubleList),
    r'precipitation': PropertySchema(
      id: 13,
      name: r'precipitation',
      type: IsarType.doubleList,
    ),
    r'precipitationProbability': PropertySchema(
      id: 14,
      name: r'precipitationProbability',
      type: IsarType.longList,
    ),
    r'precipitationProbabilityMax': PropertySchema(
      id: 15,
      name: r'precipitationProbabilityMax',
      type: IsarType.longList,
    ),
    r'precipitationSum': PropertySchema(
      id: 16,
      name: r'precipitationSum',
      type: IsarType.doubleList,
    ),
    r'rain': PropertySchema(id: 17, name: r'rain', type: IsarType.doubleList),
    r'rainSum': PropertySchema(
      id: 18,
      name: r'rainSum',
      type: IsarType.doubleList,
    ),
    r'relativehumidity2M': PropertySchema(
      id: 19,
      name: r'relativehumidity2M',
      type: IsarType.longList,
    ),
    r'shortwaveRadiation': PropertySchema(
      id: 20,
      name: r'shortwaveRadiation',
      type: IsarType.doubleList,
    ),
    r'so2': PropertySchema(id: 21, name: r'so2', type: IsarType.doubleList),
    r'sunrise': PropertySchema(
      id: 22,
      name: r'sunrise',
      type: IsarType.stringList,
    ),
    r'sunset': PropertySchema(
      id: 23,
      name: r'sunset',
      type: IsarType.stringList,
    ),
    r'surfacePressure': PropertySchema(
      id: 24,
      name: r'surfacePressure',
      type: IsarType.doubleList,
    ),
    r'temperature2M': PropertySchema(
      id: 25,
      name: r'temperature2M',
      type: IsarType.doubleList,
    ),
    r'temperature2MMax': PropertySchema(
      id: 26,
      name: r'temperature2MMax',
      type: IsarType.doubleList,
    ),
    r'temperature2MMin': PropertySchema(
      id: 27,
      name: r'temperature2MMin',
      type: IsarType.doubleList,
    ),
    r'time': PropertySchema(id: 28, name: r'time', type: IsarType.stringList),
    r'timeDaily': PropertySchema(
      id: 29,
      name: r'timeDaily',
      type: IsarType.dateTimeList,
    ),
    r'timestamp': PropertySchema(
      id: 30,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'timezone': PropertySchema(
      id: 31,
      name: r'timezone',
      type: IsarType.string,
    ),
    r'usAqi': PropertySchema(id: 32, name: r'usAqi', type: IsarType.doubleList),
    r'utcOffsetSeconds': PropertySchema(
      id: 33,
      name: r'utcOffsetSeconds',
      type: IsarType.long,
    ),
    r'uvIndex': PropertySchema(
      id: 34,
      name: r'uvIndex',
      type: IsarType.doubleList,
    ),
    r'uvIndexMax': PropertySchema(
      id: 35,
      name: r'uvIndexMax',
      type: IsarType.doubleList,
    ),
    r'visibility': PropertySchema(
      id: 36,
      name: r'visibility',
      type: IsarType.doubleList,
    ),
    r'weathercode': PropertySchema(
      id: 37,
      name: r'weathercode',
      type: IsarType.longList,
    ),
    r'weathercodeDaily': PropertySchema(
      id: 38,
      name: r'weathercodeDaily',
      type: IsarType.longList,
    ),
    r'winddirection10M': PropertySchema(
      id: 39,
      name: r'winddirection10M',
      type: IsarType.longList,
    ),
    r'winddirection10MDominant': PropertySchema(
      id: 40,
      name: r'winddirection10MDominant',
      type: IsarType.longList,
    ),
    r'windgusts10M': PropertySchema(
      id: 41,
      name: r'windgusts10M',
      type: IsarType.doubleList,
    ),
    r'windgusts10MMax': PropertySchema(
      id: 42,
      name: r'windgusts10MMax',
      type: IsarType.doubleList,
    ),
    r'windspeed10M': PropertySchema(
      id: 43,
      name: r'windspeed10M',
      type: IsarType.doubleList,
    ),
    r'windspeed10MMax': PropertySchema(
      id: 44,
      name: r'windspeed10MMax',
      type: IsarType.doubleList,
    ),
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
  version: '3.3.2',
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
    final value = object.co;
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
    final value = object.europeanAqi;
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
    final value = object.no2;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.ozone;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.pm10;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.pm25;
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
    final value = object.so2;
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
    final value = object.usAqi;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
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
  writer.writeLong(offsets[3], object.clockSkewSeconds);
  writer.writeLongList(offsets[4], object.cloudcover);
  writer.writeDoubleList(offsets[5], object.co);
  writer.writeDoubleList(offsets[6], object.dewpoint2M);
  writer.writeDoubleList(offsets[7], object.europeanAqi);
  writer.writeDoubleList(offsets[8], object.evapotranspiration);
  writer.writeDoubleList(offsets[9], object.no2);
  writer.writeDoubleList(offsets[10], object.ozone);
  writer.writeDoubleList(offsets[11], object.pm10);
  writer.writeDoubleList(offsets[12], object.pm25);
  writer.writeDoubleList(offsets[13], object.precipitation);
  writer.writeLongList(offsets[14], object.precipitationProbability);
  writer.writeLongList(offsets[15], object.precipitationProbabilityMax);
  writer.writeDoubleList(offsets[16], object.precipitationSum);
  writer.writeDoubleList(offsets[17], object.rain);
  writer.writeDoubleList(offsets[18], object.rainSum);
  writer.writeLongList(offsets[19], object.relativehumidity2M);
  writer.writeDoubleList(offsets[20], object.shortwaveRadiation);
  writer.writeDoubleList(offsets[21], object.so2);
  writer.writeStringList(offsets[22], object.sunrise);
  writer.writeStringList(offsets[23], object.sunset);
  writer.writeDoubleList(offsets[24], object.surfacePressure);
  writer.writeDoubleList(offsets[25], object.temperature2M);
  writer.writeDoubleList(offsets[26], object.temperature2MMax);
  writer.writeDoubleList(offsets[27], object.temperature2MMin);
  writer.writeStringList(offsets[28], object.time);
  writer.writeDateTimeList(offsets[29], object.timeDaily);
  writer.writeDateTime(offsets[30], object.timestamp);
  writer.writeString(offsets[31], object.timezone);
  writer.writeDoubleList(offsets[32], object.usAqi);
  writer.writeLong(offsets[33], object.utcOffsetSeconds);
  writer.writeDoubleList(offsets[34], object.uvIndex);
  writer.writeDoubleList(offsets[35], object.uvIndexMax);
  writer.writeDoubleList(offsets[36], object.visibility);
  writer.writeLongList(offsets[37], object.weathercode);
  writer.writeLongList(offsets[38], object.weathercodeDaily);
  writer.writeLongList(offsets[39], object.winddirection10M);
  writer.writeLongList(offsets[40], object.winddirection10MDominant);
  writer.writeDoubleList(offsets[41], object.windgusts10M);
  writer.writeDoubleList(offsets[42], object.windgusts10MMax);
  writer.writeDoubleList(offsets[43], object.windspeed10M);
  writer.writeDoubleList(offsets[44], object.windspeed10MMax);
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
    clockSkewSeconds: reader.readLongOrNull(offsets[3]),
    cloudcover: reader.readLongOrNullList(offsets[4]),
    co: reader.readDoubleOrNullList(offsets[5]),
    dewpoint2M: reader.readDoubleOrNullList(offsets[6]),
    europeanAqi: reader.readDoubleOrNullList(offsets[7]),
    evapotranspiration: reader.readDoubleOrNullList(offsets[8]),
    no2: reader.readDoubleOrNullList(offsets[9]),
    ozone: reader.readDoubleOrNullList(offsets[10]),
    pm10: reader.readDoubleOrNullList(offsets[11]),
    pm25: reader.readDoubleOrNullList(offsets[12]),
    precipitation: reader.readDoubleOrNullList(offsets[13]),
    precipitationProbability: reader.readLongOrNullList(offsets[14]),
    precipitationProbabilityMax: reader.readLongOrNullList(offsets[15]),
    precipitationSum: reader.readDoubleOrNullList(offsets[16]),
    rain: reader.readDoubleOrNullList(offsets[17]),
    rainSum: reader.readDoubleOrNullList(offsets[18]),
    relativehumidity2M: reader.readLongOrNullList(offsets[19]),
    shortwaveRadiation: reader.readDoubleOrNullList(offsets[20]),
    so2: reader.readDoubleOrNullList(offsets[21]),
    sunrise: reader.readStringList(offsets[22]),
    sunset: reader.readStringList(offsets[23]),
    surfacePressure: reader.readDoubleOrNullList(offsets[24]),
    temperature2M: reader.readDoubleList(offsets[25]),
    temperature2MMax: reader.readDoubleOrNullList(offsets[26]),
    temperature2MMin: reader.readDoubleOrNullList(offsets[27]),
    time: reader.readStringList(offsets[28]),
    timeDaily: reader.readDateTimeList(offsets[29]),
    timestamp: reader.readDateTimeOrNull(offsets[30]),
    timezone: reader.readStringOrNull(offsets[31]),
    usAqi: reader.readDoubleOrNullList(offsets[32]),
    utcOffsetSeconds: reader.readLongOrNull(offsets[33]),
    uvIndex: reader.readDoubleOrNullList(offsets[34]),
    uvIndexMax: reader.readDoubleOrNullList(offsets[35]),
    visibility: reader.readDoubleOrNullList(offsets[36]),
    weathercode: reader.readLongList(offsets[37]),
    weathercodeDaily: reader.readLongOrNullList(offsets[38]),
    winddirection10M: reader.readLongOrNullList(offsets[39]),
    winddirection10MDominant: reader.readLongOrNullList(offsets[40]),
    windgusts10M: reader.readDoubleOrNullList(offsets[41]),
    windgusts10MMax: reader.readDoubleOrNullList(offsets[42]),
    windspeed10M: reader.readDoubleOrNullList(offsets[43]),
    windspeed10MMax: reader.readDoubleOrNullList(offsets[44]),
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNullList(offset)) as P;
    case 5:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 6:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 7:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 8:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 9:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 10:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 11:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 12:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 13:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 14:
      return (reader.readLongOrNullList(offset)) as P;
    case 15:
      return (reader.readLongOrNullList(offset)) as P;
    case 16:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 17:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 18:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 19:
      return (reader.readLongOrNullList(offset)) as P;
    case 20:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 21:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 22:
      return (reader.readStringList(offset)) as P;
    case 23:
      return (reader.readStringList(offset)) as P;
    case 24:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 25:
      return (reader.readDoubleList(offset)) as P;
    case 26:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 27:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 28:
      return (reader.readStringList(offset)) as P;
    case 29:
      return (reader.readDateTimeList(offset)) as P;
    case 30:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 33:
      return (reader.readLongOrNull(offset)) as P;
    case 34:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 35:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 36:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 37:
      return (reader.readLongList(offset)) as P;
    case 38:
      return (reader.readLongOrNullList(offset)) as P;
    case 39:
      return (reader.readLongOrNullList(offset)) as P;
    case 40:
      return (reader.readLongOrNullList(offset)) as P;
    case 41:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 42:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 43:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 44:
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
  IsarCollection<dynamic> col,
  Id id,
  MainWeatherCache object,
) {
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
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
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
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MainWeatherCacheQueryFilter
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QFilterCondition> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'apparentTemperature'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'apparentTemperature'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'apparentTemperature'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'apparentTemperature',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'apparentTemperature',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'apparentTemperature',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'apparentTemperature',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'apparentTemperature',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'apparentTemperature', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'apparentTemperature', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'apparentTemperature', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'apparentTemperatureMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'apparentTemperatureMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'apparentTemperatureMax',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'apparentTemperatureMax',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'apparentTemperatureMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'apparentTemperatureMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'apparentTemperatureMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'apparentTemperatureMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'apparentTemperatureMax', 0, true, 0, true);
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
  apparentTemperatureMaxLengthLessThan(int length, {bool include = false}) {
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
  apparentTemperatureMaxLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'apparentTemperatureMin'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'apparentTemperatureMin'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'apparentTemperatureMin',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'apparentTemperatureMin',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'apparentTemperatureMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'apparentTemperatureMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  apparentTemperatureMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'apparentTemperatureMin',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'apparentTemperatureMin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'apparentTemperatureMin', 0, true, 0, true);
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
  apparentTemperatureMinLengthLessThan(int length, {bool include = false}) {
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
  apparentTemperatureMinLengthGreaterThan(int length, {bool include = false}) {
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
  clockSkewSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockSkewSeconds'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  clockSkewSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockSkewSeconds'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  clockSkewSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockSkewSeconds', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  clockSkewSecondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockSkewSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  clockSkewSecondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockSkewSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  clockSkewSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockSkewSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudcover', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cloudcover',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cloudcover',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cloudcover',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  cloudcoverLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', length, include, 999999, true);
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
  coIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'co'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'co'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'co'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'co'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'co',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'co',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'co',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'co',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  coLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dewpoint2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dewpoint2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dewpoint2M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dewpoint2M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  dewpoint2MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', length, include, 999999, true);
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
  europeanAqiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'europeanAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'europeanAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'europeanAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'europeanAqi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  europeanAqiLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'europeanAqi',
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'evapotranspiration',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'evapotranspiration',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'evapotranspiration',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'evapotranspiration',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'evapotranspiration', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'evapotranspiration', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'evapotranspiration', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  evapotranspirationLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'no2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'no2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'no2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'no2',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  no2LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ozone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ozone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ozone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ozone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  ozoneLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ozone',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pm10',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pm10',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pm10',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pm10',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm10LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pm10',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pm25',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pm25',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pm25',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pm25',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  pm25LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pm25',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitation',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitationProbability'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'precipitationProbability'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'precipitationProbability',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'precipitationProbability',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitationProbability',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitationProbability',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitationProbability',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitationProbability',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'precipitationProbability', 0, true, 0, true);
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
  precipitationProbabilityLengthLessThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitationProbabilityMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'precipitationProbabilityMax',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'precipitationProbabilityMax',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'precipitationProbabilityMax',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityMaxElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitationProbabilityMax',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityMaxElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitationProbabilityMax',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationProbabilityMaxElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitationProbabilityMax',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitationProbabilityMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'precipitationProbabilityMax', 0, true, 0, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitationSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitationSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitationSum',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitationSum',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  precipitationSumLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rain',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rain',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rain',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rain',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rainSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rainSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rainSum',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rainSum',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  rainSumLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'relativehumidity2M', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'relativehumidity2M',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'relativehumidity2M',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'relativehumidity2M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'relativehumidity2M', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'relativehumidity2M', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'relativehumidity2M', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  relativehumidity2MLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'shortwaveRadiation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'shortwaveRadiation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'shortwaveRadiation',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'shortwaveRadiation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'shortwaveRadiation', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'shortwaveRadiation', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'shortwaveRadiation', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  shortwaveRadiationLengthGreaterThan(int length, {bool include = false}) {
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
  so2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'so2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'so2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'so2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'so2',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  so2LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sunrise'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sunrise'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sunrise',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sunrise',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sunrise', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sunrise', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunriseLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sunset'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sunset'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sunset',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sunset',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sunset', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sunset', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  sunsetLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'surfacePressure',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'surfacePressure',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'surfacePressure',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'surfacePressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  surfacePressureLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperature2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperature2M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MElementEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperature2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperature2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperature2M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperature2M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperature2MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperature2MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperature2MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperature2MMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMaxLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperature2MMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperature2MMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperature2MMin',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperature2MMin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  temperature2MMinLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'time'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'time'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'time',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'time',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'time', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'time', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeDaily'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeDaily'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeDaily', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyElementGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeDaily',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyElementLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeDaily',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeDaily',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timeDailyLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timestamp'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timestamp'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timestampGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timestampLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timezone'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timezone'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timezone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timezone',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timezone', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  timezoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timezone', value: ''),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'usAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'usAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'usAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'usAqi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', length, include, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  usAqiLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usAqi',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  utcOffsetSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'utcOffsetSeconds'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  utcOffsetSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'utcOffsetSeconds'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  utcOffsetSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'utcOffsetSeconds', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  utcOffsetSecondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'utcOffsetSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  utcOffsetSecondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'utcOffsetSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  utcOffsetSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'utcOffsetSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uvIndex',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uvIndex',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uvIndex',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uvIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uvIndexMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uvIndexMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uvIndexMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uvIndexMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  uvIndexMaxLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'visibility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visibility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visibility',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visibility',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  visibilityLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'weathercode'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'weathercode'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weathercode', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weathercode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weathercode',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weathercode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weathercodeDaily', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weathercodeDaily',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weathercodeDaily',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weathercodeDaily',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  weathercodeDailyLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'winddirection10M', value: value),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'winddirection10M',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'winddirection10M',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'winddirection10M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'winddirection10MDominant'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MDominantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'winddirection10MDominant'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MDominantElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'winddirection10MDominant',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MDominantElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'winddirection10MDominant',
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MDominantElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'winddirection10MDominant',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MDominantElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'winddirection10MDominant',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  winddirection10MDominantElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'winddirection10MDominant',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'winddirection10MDominant',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'winddirection10MDominant', 0, true, 0, true);
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
  winddirection10MDominantLengthLessThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windgusts10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windgusts10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windgusts10M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windgusts10M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windgusts10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windgusts10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windgusts10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windgusts10MMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windgusts10MMaxLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windspeed10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windspeed10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windspeed10M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windspeed10M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windspeed10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windspeed10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windspeed10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windspeed10MMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', length, true, length, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', 0, true, 0, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', 0, true, length, include);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterFilterCondition>
  windspeed10MMaxLengthGreaterThan(int length, {bool include = false}) {
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
  sortByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  sortByClockSkewSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.desc);
    });
  }

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

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  sortByUtcOffsetSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  sortByUtcOffsetSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.desc);
    });
  }
}

extension MainWeatherCacheQuerySortThenBy
    on QueryBuilder<MainWeatherCache, MainWeatherCache, QSortThenBy> {
  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  thenByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  thenByClockSkewSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.desc);
    });
  }

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

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  thenByUtcOffsetSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.asc);
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QAfterSortBy>
  thenByUtcOffsetSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.desc);
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
  distinctByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockSkewSeconds');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
  distinctByCloudcover() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudcover');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctByCo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'co');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
  distinctByDewpoint2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dewpoint2M');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
  distinctByEuropeanAqi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'europeanAqi');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
  distinctByEvapotranspiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evapotranspiration');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctByNo2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'no2');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
  distinctByOzone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ozone');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctByPm10() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pm10');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctByPm25() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pm25');
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

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct> distinctBySo2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'so2');
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
  distinctByUsAqi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usAqi');
    });
  }

  QueryBuilder<MainWeatherCache, MainWeatherCache, QDistinct>
  distinctByUtcOffsetSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'utcOffsetSeconds');
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

  QueryBuilder<MainWeatherCache, int?, QQueryOperations>
  clockSkewSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockSkewSeconds');
    });
  }

  QueryBuilder<MainWeatherCache, List<int?>?, QQueryOperations>
  cloudcoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudcover');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  coProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'co');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  dewpoint2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dewpoint2M');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  europeanAqiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'europeanAqi');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  evapotranspirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evapotranspiration');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  no2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'no2');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  ozoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ozone');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  pm10Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pm10');
    });
  }

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  pm25Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pm25');
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

  QueryBuilder<MainWeatherCache, List<double?>?, QQueryOperations>
  so2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'so2');
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
  usAqiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usAqi');
    });
  }

  QueryBuilder<MainWeatherCache, int?, QQueryOperations>
  utcOffsetSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'utcOffsetSeconds');
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
    r'city': PropertySchema(id: 0, name: r'city', type: IsarType.string),
    r'displayLabel': PropertySchema(
      id: 1,
      name: r'displayLabel',
      type: IsarType.string,
    ),
    r'district': PropertySchema(
      id: 2,
      name: r'district',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(id: 3, name: r'lat', type: IsarType.double),
    r'lon': PropertySchema(id: 4, name: r'lon', type: IsarType.double),
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
  version: '3.3.2',
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
  bytesCount += 3 + object.displayLabel.length * 3;
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
  writer.writeString(offsets[1], object.displayLabel);
  writer.writeString(offsets[2], object.district);
  writer.writeDouble(offsets[3], object.lat);
  writer.writeDouble(offsets[4], object.lon);
}

LocationCache _locationCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationCache(
    city: reader.readStringOrNull(offsets[0]),
    district: reader.readStringOrNull(offsets[2]),
    lat: reader.readDoubleOrNull(offsets[3]),
    lon: reader.readDoubleOrNull(offsets[4]),
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
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
  IsarCollection<dynamic> col,
  Id id,
  LocationCache object,
) {
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
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
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
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LocationCacheQueryFilter
    on QueryBuilder<LocationCache, LocationCache, QFilterCondition> {
  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'city'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'city'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'city',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> cityMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'city',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'city', value: ''),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'city', value: ''),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'displayLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'displayLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'displayLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'displayLabel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'displayLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'displayLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'displayLabel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'displayLabel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'displayLabel', value: ''),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  displayLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'displayLabel', value: ''),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'district'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'district'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'district',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'district',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'district', value: ''),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'district', value: ''),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lat'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lat'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lat',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  lonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lon'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  lonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lon'),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> lonEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lon',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition>
  lonGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lon',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterFilterCondition> lonLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lon',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lon',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy>
  sortByDisplayLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLabel', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy>
  sortByDisplayLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLabel', Sort.desc);
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

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy>
  thenByDisplayLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLabel', Sort.asc);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QAfterSortBy>
  thenByDisplayLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLabel', Sort.desc);
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
  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByCity({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByDisplayLabel({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCache, LocationCache, QDistinct> distinctByDistrict({
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<LocationCache, String, QQueryOperations> displayLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayLabel');
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
    r'city': PropertySchema(id: 3, name: r'city', type: IsarType.string),
    r'clockSkewSeconds': PropertySchema(
      id: 4,
      name: r'clockSkewSeconds',
      type: IsarType.long,
    ),
    r'cloudcover': PropertySchema(
      id: 5,
      name: r'cloudcover',
      type: IsarType.longList,
    ),
    r'co': PropertySchema(id: 6, name: r'co', type: IsarType.doubleList),
    r'dewpoint2M': PropertySchema(
      id: 7,
      name: r'dewpoint2M',
      type: IsarType.doubleList,
    ),
    r'district': PropertySchema(
      id: 8,
      name: r'district',
      type: IsarType.string,
    ),
    r'europeanAqi': PropertySchema(
      id: 9,
      name: r'europeanAqi',
      type: IsarType.doubleList,
    ),
    r'evapotranspiration': PropertySchema(
      id: 10,
      name: r'evapotranspiration',
      type: IsarType.doubleList,
    ),
    r'index': PropertySchema(id: 11, name: r'index', type: IsarType.long),
    r'lat': PropertySchema(id: 12, name: r'lat', type: IsarType.double),
    r'lon': PropertySchema(id: 13, name: r'lon', type: IsarType.double),
    r'no2': PropertySchema(id: 14, name: r'no2', type: IsarType.doubleList),
    r'ozone': PropertySchema(id: 15, name: r'ozone', type: IsarType.doubleList),
    r'pm10': PropertySchema(id: 16, name: r'pm10', type: IsarType.doubleList),
    r'pm25': PropertySchema(id: 17, name: r'pm25', type: IsarType.doubleList),
    r'precipitation': PropertySchema(
      id: 18,
      name: r'precipitation',
      type: IsarType.doubleList,
    ),
    r'precipitationProbability': PropertySchema(
      id: 19,
      name: r'precipitationProbability',
      type: IsarType.longList,
    ),
    r'precipitationProbabilityMax': PropertySchema(
      id: 20,
      name: r'precipitationProbabilityMax',
      type: IsarType.longList,
    ),
    r'precipitationSum': PropertySchema(
      id: 21,
      name: r'precipitationSum',
      type: IsarType.doubleList,
    ),
    r'rain': PropertySchema(id: 22, name: r'rain', type: IsarType.doubleList),
    r'rainSum': PropertySchema(
      id: 23,
      name: r'rainSum',
      type: IsarType.doubleList,
    ),
    r'relativehumidity2M': PropertySchema(
      id: 24,
      name: r'relativehumidity2M',
      type: IsarType.longList,
    ),
    r'shortwaveRadiation': PropertySchema(
      id: 25,
      name: r'shortwaveRadiation',
      type: IsarType.doubleList,
    ),
    r'so2': PropertySchema(id: 26, name: r'so2', type: IsarType.doubleList),
    r'sunrise': PropertySchema(
      id: 27,
      name: r'sunrise',
      type: IsarType.stringList,
    ),
    r'sunset': PropertySchema(
      id: 28,
      name: r'sunset',
      type: IsarType.stringList,
    ),
    r'surfacePressure': PropertySchema(
      id: 29,
      name: r'surfacePressure',
      type: IsarType.doubleList,
    ),
    r'temperature2M': PropertySchema(
      id: 30,
      name: r'temperature2M',
      type: IsarType.doubleList,
    ),
    r'temperature2MMax': PropertySchema(
      id: 31,
      name: r'temperature2MMax',
      type: IsarType.doubleList,
    ),
    r'temperature2MMin': PropertySchema(
      id: 32,
      name: r'temperature2MMin',
      type: IsarType.doubleList,
    ),
    r'time': PropertySchema(id: 33, name: r'time', type: IsarType.stringList),
    r'timeDaily': PropertySchema(
      id: 34,
      name: r'timeDaily',
      type: IsarType.dateTimeList,
    ),
    r'timestamp': PropertySchema(
      id: 35,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'timezone': PropertySchema(
      id: 36,
      name: r'timezone',
      type: IsarType.string,
    ),
    r'usAqi': PropertySchema(id: 37, name: r'usAqi', type: IsarType.doubleList),
    r'utcOffsetSeconds': PropertySchema(
      id: 38,
      name: r'utcOffsetSeconds',
      type: IsarType.long,
    ),
    r'uvIndex': PropertySchema(
      id: 39,
      name: r'uvIndex',
      type: IsarType.doubleList,
    ),
    r'uvIndexMax': PropertySchema(
      id: 40,
      name: r'uvIndexMax',
      type: IsarType.doubleList,
    ),
    r'visibility': PropertySchema(
      id: 41,
      name: r'visibility',
      type: IsarType.doubleList,
    ),
    r'weathercode': PropertySchema(
      id: 42,
      name: r'weathercode',
      type: IsarType.longList,
    ),
    r'weathercodeDaily': PropertySchema(
      id: 43,
      name: r'weathercodeDaily',
      type: IsarType.longList,
    ),
    r'winddirection10M': PropertySchema(
      id: 44,
      name: r'winddirection10M',
      type: IsarType.longList,
    ),
    r'winddirection10MDominant': PropertySchema(
      id: 45,
      name: r'winddirection10MDominant',
      type: IsarType.longList,
    ),
    r'windgusts10M': PropertySchema(
      id: 46,
      name: r'windgusts10M',
      type: IsarType.doubleList,
    ),
    r'windgusts10MMax': PropertySchema(
      id: 47,
      name: r'windgusts10MMax',
      type: IsarType.doubleList,
    ),
    r'windspeed10M': PropertySchema(
      id: 48,
      name: r'windspeed10M',
      type: IsarType.doubleList,
    ),
    r'windspeed10MMax': PropertySchema(
      id: 49,
      name: r'windspeed10MMax',
      type: IsarType.doubleList,
    ),
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
  version: '3.3.2',
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
    final value = object.co;
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
    final value = object.europeanAqi;
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
    final value = object.no2;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.ozone;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.pm10;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.pm25;
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
    final value = object.so2;
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
    final value = object.usAqi;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
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
  writer.writeLong(offsets[4], object.clockSkewSeconds);
  writer.writeLongList(offsets[5], object.cloudcover);
  writer.writeDoubleList(offsets[6], object.co);
  writer.writeDoubleList(offsets[7], object.dewpoint2M);
  writer.writeString(offsets[8], object.district);
  writer.writeDoubleList(offsets[9], object.europeanAqi);
  writer.writeDoubleList(offsets[10], object.evapotranspiration);
  writer.writeLong(offsets[11], object.index);
  writer.writeDouble(offsets[12], object.lat);
  writer.writeDouble(offsets[13], object.lon);
  writer.writeDoubleList(offsets[14], object.no2);
  writer.writeDoubleList(offsets[15], object.ozone);
  writer.writeDoubleList(offsets[16], object.pm10);
  writer.writeDoubleList(offsets[17], object.pm25);
  writer.writeDoubleList(offsets[18], object.precipitation);
  writer.writeLongList(offsets[19], object.precipitationProbability);
  writer.writeLongList(offsets[20], object.precipitationProbabilityMax);
  writer.writeDoubleList(offsets[21], object.precipitationSum);
  writer.writeDoubleList(offsets[22], object.rain);
  writer.writeDoubleList(offsets[23], object.rainSum);
  writer.writeLongList(offsets[24], object.relativehumidity2M);
  writer.writeDoubleList(offsets[25], object.shortwaveRadiation);
  writer.writeDoubleList(offsets[26], object.so2);
  writer.writeStringList(offsets[27], object.sunrise);
  writer.writeStringList(offsets[28], object.sunset);
  writer.writeDoubleList(offsets[29], object.surfacePressure);
  writer.writeDoubleList(offsets[30], object.temperature2M);
  writer.writeDoubleList(offsets[31], object.temperature2MMax);
  writer.writeDoubleList(offsets[32], object.temperature2MMin);
  writer.writeStringList(offsets[33], object.time);
  writer.writeDateTimeList(offsets[34], object.timeDaily);
  writer.writeDateTime(offsets[35], object.timestamp);
  writer.writeString(offsets[36], object.timezone);
  writer.writeDoubleList(offsets[37], object.usAqi);
  writer.writeLong(offsets[38], object.utcOffsetSeconds);
  writer.writeDoubleList(offsets[39], object.uvIndex);
  writer.writeDoubleList(offsets[40], object.uvIndexMax);
  writer.writeDoubleList(offsets[41], object.visibility);
  writer.writeLongList(offsets[42], object.weathercode);
  writer.writeLongList(offsets[43], object.weathercodeDaily);
  writer.writeLongList(offsets[44], object.winddirection10M);
  writer.writeLongList(offsets[45], object.winddirection10MDominant);
  writer.writeDoubleList(offsets[46], object.windgusts10M);
  writer.writeDoubleList(offsets[47], object.windgusts10MMax);
  writer.writeDoubleList(offsets[48], object.windspeed10M);
  writer.writeDoubleList(offsets[49], object.windspeed10MMax);
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
    clockSkewSeconds: reader.readLongOrNull(offsets[4]),
    cloudcover: reader.readLongOrNullList(offsets[5]),
    co: reader.readDoubleOrNullList(offsets[6]),
    dewpoint2M: reader.readDoubleOrNullList(offsets[7]),
    district: reader.readStringOrNull(offsets[8]),
    europeanAqi: reader.readDoubleOrNullList(offsets[9]),
    evapotranspiration: reader.readDoubleOrNullList(offsets[10]),
    index: reader.readLongOrNull(offsets[11]),
    lat: reader.readDoubleOrNull(offsets[12]),
    lon: reader.readDoubleOrNull(offsets[13]),
    no2: reader.readDoubleOrNullList(offsets[14]),
    ozone: reader.readDoubleOrNullList(offsets[15]),
    pm10: reader.readDoubleOrNullList(offsets[16]),
    pm25: reader.readDoubleOrNullList(offsets[17]),
    precipitation: reader.readDoubleOrNullList(offsets[18]),
    precipitationProbability: reader.readLongOrNullList(offsets[19]),
    precipitationProbabilityMax: reader.readLongOrNullList(offsets[20]),
    precipitationSum: reader.readDoubleOrNullList(offsets[21]),
    rain: reader.readDoubleOrNullList(offsets[22]),
    rainSum: reader.readDoubleOrNullList(offsets[23]),
    relativehumidity2M: reader.readLongOrNullList(offsets[24]),
    shortwaveRadiation: reader.readDoubleOrNullList(offsets[25]),
    so2: reader.readDoubleOrNullList(offsets[26]),
    sunrise: reader.readStringList(offsets[27]),
    sunset: reader.readStringList(offsets[28]),
    surfacePressure: reader.readDoubleOrNullList(offsets[29]),
    temperature2M: reader.readDoubleList(offsets[30]),
    temperature2MMax: reader.readDoubleOrNullList(offsets[31]),
    temperature2MMin: reader.readDoubleOrNullList(offsets[32]),
    time: reader.readStringList(offsets[33]),
    timeDaily: reader.readDateTimeList(offsets[34]),
    timestamp: reader.readDateTimeOrNull(offsets[35]),
    timezone: reader.readStringOrNull(offsets[36]),
    usAqi: reader.readDoubleOrNullList(offsets[37]),
    utcOffsetSeconds: reader.readLongOrNull(offsets[38]),
    uvIndex: reader.readDoubleOrNullList(offsets[39]),
    uvIndexMax: reader.readDoubleOrNullList(offsets[40]),
    visibility: reader.readDoubleOrNullList(offsets[41]),
    weathercode: reader.readLongList(offsets[42]),
    weathercodeDaily: reader.readLongOrNullList(offsets[43]),
    winddirection10M: reader.readLongOrNullList(offsets[44]),
    winddirection10MDominant: reader.readLongOrNullList(offsets[45]),
    windgusts10M: reader.readDoubleOrNullList(offsets[46]),
    windgusts10MMax: reader.readDoubleOrNullList(offsets[47]),
    windspeed10M: reader.readDoubleOrNullList(offsets[48]),
    windspeed10MMax: reader.readDoubleOrNullList(offsets[49]),
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNullList(offset)) as P;
    case 6:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 7:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 10:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 15:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 16:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 17:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 18:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 19:
      return (reader.readLongOrNullList(offset)) as P;
    case 20:
      return (reader.readLongOrNullList(offset)) as P;
    case 21:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 22:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 23:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 24:
      return (reader.readLongOrNullList(offset)) as P;
    case 25:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 26:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 27:
      return (reader.readStringList(offset)) as P;
    case 28:
      return (reader.readStringList(offset)) as P;
    case 29:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 30:
      return (reader.readDoubleList(offset)) as P;
    case 31:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 32:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 33:
      return (reader.readStringList(offset)) as P;
    case 34:
      return (reader.readDateTimeList(offset)) as P;
    case 35:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 38:
      return (reader.readLongOrNull(offset)) as P;
    case 39:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 40:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 41:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 42:
      return (reader.readLongList(offset)) as P;
    case 43:
      return (reader.readLongOrNullList(offset)) as P;
    case 44:
      return (reader.readLongOrNullList(offset)) as P;
    case 45:
      return (reader.readLongOrNullList(offset)) as P;
    case 46:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 47:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 48:
      return (reader.readDoubleOrNullList(offset)) as P;
    case 49:
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
  IsarCollection<dynamic> col,
  Id id,
  WeatherCard object,
) {
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
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
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
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WeatherCardQueryFilter
    on QueryBuilder<WeatherCard, WeatherCard, QFilterCondition> {
  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'apparentTemperature'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'apparentTemperature'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'apparentTemperature'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'apparentTemperature',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'apparentTemperature',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'apparentTemperature',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'apparentTemperature',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'apparentTemperature',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'apparentTemperature', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'apparentTemperature', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'apparentTemperature', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'apparentTemperatureMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'apparentTemperatureMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'apparentTemperatureMax',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'apparentTemperatureMax',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'apparentTemperatureMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'apparentTemperatureMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'apparentTemperatureMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'apparentTemperatureMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'apparentTemperatureMax', 0, true, 0, true);
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
  apparentTemperatureMaxLengthLessThan(int length, {bool include = false}) {
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
  apparentTemperatureMaxLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'apparentTemperatureMin'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'apparentTemperatureMin'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'apparentTemperatureMin',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'apparentTemperatureMin',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'apparentTemperatureMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'apparentTemperatureMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  apparentTemperatureMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'apparentTemperatureMin',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'apparentTemperatureMin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'apparentTemperatureMin', 0, true, 0, true);
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
  apparentTemperatureMinLengthLessThan(int length, {bool include = false}) {
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
  apparentTemperatureMinLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'city'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'city'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'city',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'city',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'city', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'city', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  clockSkewSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'clockSkewSeconds'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  clockSkewSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'clockSkewSeconds'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  clockSkewSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clockSkewSeconds', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  clockSkewSecondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clockSkewSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  clockSkewSecondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clockSkewSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  clockSkewSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clockSkewSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'cloudcover'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cloudcover', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cloudcover',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cloudcover',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cloudcover',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  cloudcoverLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cloudcover', length, include, 999999, true);
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> coIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'co'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> coIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'co'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'co'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'co'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'co',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'co',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'co',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'co',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> coLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> coIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> coIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  coLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> coLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'co', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'dewpoint2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dewpoint2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dewpoint2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dewpoint2M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dewpoint2M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  dewpoint2MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dewpoint2M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'district'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'district'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'district',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'district',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> districtMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'district',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'district', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'district', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'europeanAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'europeanAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'europeanAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'europeanAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'europeanAqi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'europeanAqi', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  europeanAqiLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'europeanAqi',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'evapotranspiration'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'evapotranspiration',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'evapotranspiration',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'evapotranspiration',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'evapotranspiration',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'evapotranspiration', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'evapotranspiration', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'evapotranspiration', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  evapotranspirationLengthGreaterThan(int length, {bool include = false}) {
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
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'index'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'index'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'index', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  indexGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'index',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'index',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'index',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lat'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lat'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lat',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lat',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lon'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lon'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lon',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lon',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> lonLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lon',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lon',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> no2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> no2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'no2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'no2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'no2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'no2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'no2',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> no2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  no2LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'no2', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> ozoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'ozone'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ozone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ozone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ozone',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ozone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> ozoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'ozone', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  ozoneLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ozone',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> pm10IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'pm10'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pm10',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pm10',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pm10',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pm10',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> pm10IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm10', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm10LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pm10',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> pm25IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'pm25'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pm25',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pm25',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pm25',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pm25',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> pm25IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'pm25', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  pm25LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pm25',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'precipitation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitation',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitation', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitationProbability'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'precipitationProbability'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'precipitationProbability',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'precipitationProbability',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitationProbability',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitationProbability',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitationProbability',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitationProbability',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'precipitationProbability', 0, true, 0, true);
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
  precipitationProbabilityLengthLessThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitationProbabilityMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(
          property: r'precipitationProbabilityMax',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'precipitationProbabilityMax',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'precipitationProbabilityMax',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityMaxElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitationProbabilityMax',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityMaxElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitationProbabilityMax',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationProbabilityMaxElementLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitationProbabilityMax',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitationProbabilityMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'precipitationProbabilityMax', 0, true, 0, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'precipitationSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'precipitationSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'precipitationSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'precipitationSum',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'precipitationSum',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'precipitationSum', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  precipitationSumLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'rain'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rain',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rain',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rain',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rain',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> rainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rain', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'rainSum'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rainSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rainSum',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rainSum',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rainSum',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  rainSumLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'rainSum', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'relativehumidity2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'relativehumidity2M', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'relativehumidity2M',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'relativehumidity2M',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'relativehumidity2M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'relativehumidity2M', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'relativehumidity2M', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'relativehumidity2M', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  relativehumidity2MLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'shortwaveRadiation'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'shortwaveRadiation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'shortwaveRadiation',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'shortwaveRadiation',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'shortwaveRadiation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
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
      return query.listLength(r'shortwaveRadiation', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'shortwaveRadiation', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'shortwaveRadiation', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  shortwaveRadiationLengthGreaterThan(int length, {bool include = false}) {
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> so2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> so2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2ElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2ElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'so2'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2ElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'so2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2ElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'so2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2ElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'so2',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2ElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'so2',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> so2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2LengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2LengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  so2LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'so2', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sunrise'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sunrise'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sunrise',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sunrise',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sunrise',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sunrise', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sunrise', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunriseLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunrise', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sunset'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sunset'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sunset',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sunset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sunset',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sunset', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sunset', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  sunsetLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sunset', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'surfacePressure'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'surfacePressure',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'surfacePressure',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'surfacePressure',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'surfacePressure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'surfacePressure', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  surfacePressureLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperature2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperature2M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MElementEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperature2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperature2M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperature2M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperature2M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'temperature2MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperature2MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperature2MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperature2MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperature2MMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMax', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMaxLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'temperature2MMin'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'temperature2MMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'temperature2MMin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'temperature2MMin',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'temperature2MMin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'temperature2MMin', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  temperature2MMinLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'time'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'time'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'time',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'time',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'time',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'time', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'time', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'time', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timeDaily'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timeDaily'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeDaily', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyElementGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeDaily',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyElementLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeDaily',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeDaily',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timeDailyLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'timeDaily', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timestamp'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timestamp'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timestampGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timestampLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'timezone'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'timezone'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timezoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timezone',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timezone',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> timezoneMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timezone',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timezone', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  timezoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timezone', value: ''),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> usAqiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'usAqi'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'usAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'usAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'usAqi',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiElementBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'usAqi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition> usAqiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'usAqi', length, include, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  usAqiLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usAqi',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  utcOffsetSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'utcOffsetSeconds'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  utcOffsetSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'utcOffsetSeconds'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  utcOffsetSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'utcOffsetSeconds', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  utcOffsetSecondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'utcOffsetSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  utcOffsetSecondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'utcOffsetSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  utcOffsetSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'utcOffsetSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'uvIndex'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uvIndex',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uvIndex',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uvIndex',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uvIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndex', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'uvIndexMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uvIndexMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uvIndexMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uvIndexMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uvIndexMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  uvIndexMaxLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'uvIndexMax', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'visibility'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'visibility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visibility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visibility',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visibility',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  visibilityLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'visibility', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'weathercode'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'weathercode'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weathercode', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weathercode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weathercode',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weathercode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercode', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'weathercodeDaily'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weathercodeDaily', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weathercodeDaily',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weathercodeDaily',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weathercodeDaily',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weathercodeDaily', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  weathercodeDailyLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'winddirection10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'winddirection10M', value: value),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MElementGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'winddirection10M',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'winddirection10M',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'winddirection10M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'winddirection10M', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'winddirection10MDominant'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MDominantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'winddirection10MDominant'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MDominantElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(
          property: r'winddirection10MDominant',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MDominantElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(
          property: r'winddirection10MDominant',
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MDominantElementEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'winddirection10MDominant',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MDominantElementGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'winddirection10MDominant',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  winddirection10MDominantElementLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'winddirection10MDominant',
          value: value,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'winddirection10MDominant',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
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
      return query.listLength(r'winddirection10MDominant', 0, true, 0, true);
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
  winddirection10MDominantLengthLessThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windgusts10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windgusts10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windgusts10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windgusts10M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windgusts10M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windgusts10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windgusts10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windgusts10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windgusts10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windgusts10MMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windgusts10MMax', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windgusts10MMaxLengthGreaterThan(int length, {bool include = false}) {
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windspeed10M'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MElementEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windspeed10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windspeed10M',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windspeed10M',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windspeed10M',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10M', length, include, 999999, true);
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
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.elementIsNotNull(property: r'windspeed10MMax'),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxElementEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windspeed10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxElementGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windspeed10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxElementLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windspeed10MMax',
          value: value,

          epsilon: epsilon,
        ),
      );
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
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windspeed10MMax',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', length, true, length, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', 0, true, 0, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'windspeed10MMax', 0, true, length, include);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterFilterCondition>
  windspeed10MMaxLengthGreaterThan(int length, {bool include = false}) {
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  sortByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  sortByClockSkewSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.desc);
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  sortByUtcOffsetSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  sortByUtcOffsetSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.desc);
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  thenByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  thenByClockSkewSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockSkewSeconds', Sort.desc);
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

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  thenByUtcOffsetSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.asc);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QAfterSortBy>
  thenByUtcOffsetSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utcOffsetSeconds', Sort.desc);
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

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByCity({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
  distinctByClockSkewSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockSkewSeconds');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByCloudcover() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudcover');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByCo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'co');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByDewpoint2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dewpoint2M');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByDistrict({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByEuropeanAqi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'europeanAqi');
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

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByNo2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'no2');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByOzone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ozone');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByPm10() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pm10');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByPm25() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pm25');
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

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctBySo2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'so2');
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

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByTimezone({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timezone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct> distinctByUsAqi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usAqi');
    });
  }

  QueryBuilder<WeatherCard, WeatherCard, QDistinct>
  distinctByUtcOffsetSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'utcOffsetSeconds');
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

  QueryBuilder<WeatherCard, int?, QQueryOperations> clockSkewSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockSkewSeconds');
    });
  }

  QueryBuilder<WeatherCard, List<int?>?, QQueryOperations>
  cloudcoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudcover');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> coProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'co');
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
  europeanAqiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'europeanAqi');
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

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> no2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'no2');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> ozoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ozone');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> pm10Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pm10');
    });
  }

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> pm25Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pm25');
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

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> so2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'so2');
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

  QueryBuilder<WeatherCard, List<double?>?, QQueryOperations> usAqiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usAqi');
    });
  }

  QueryBuilder<WeatherCard, int?, QQueryOperations> utcOffsetSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'utcOffsetSeconds');
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
