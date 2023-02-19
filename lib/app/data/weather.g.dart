// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSettingsCollection on Isar {
  IsarCollection<Settings> get settings => this.collection();
}

const SettingsSchema = CollectionSchema(
  name: r'Settings',
  id: -8656046621518759136,
  properties: {
    r'onboard': PropertySchema(
      id: 0,
      name: r'onboard',
      type: IsarType.bool,
    ),
    r'theme': PropertySchema(
      id: 1,
      name: r'theme',
      type: IsarType.bool,
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
  version: '3.0.5',
);

int _settingsEstimateSize(
  Settings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _settingsSerialize(
  Settings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.onboard);
  writer.writeBool(offsets[1], object.theme);
}

Settings _settingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Settings();
  object.id = id;
  object.onboard = reader.readBool(offsets[0]);
  object.theme = reader.readBoolOrNull(offsets[1]);
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
      return (reader.readBoolOrNull(offset)) as P;
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

  QueryBuilder<Settings, Settings, QAfterFilterCondition> onboardEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onboard',
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
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: value,
      ));
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQueryLinks
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {
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
}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
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
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {
  QueryBuilder<Settings, Settings, QDistinct> distinctByOnboard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onboard');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme');
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

  QueryBuilder<Settings, bool, QQueryOperations> onboardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onboard');
    });
  }

  QueryBuilder<Settings, bool?, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetWeatherDayCollection on Isar {
  IsarCollection<WeatherDay> get weatherDays => this.collection();
}

const WeatherDaySchema = CollectionSchema(
  name: r'WeatherDay',
  id: 7512505517046254429,
  properties: {
    r'apparentTemperature': PropertySchema(
      id: 0,
      name: r'apparentTemperature',
      type: IsarType.doubleList,
    ),
    r'evapotranspiration': PropertySchema(
      id: 1,
      name: r'evapotranspiration',
      type: IsarType.doubleList,
    ),
    r'precipitation': PropertySchema(
      id: 2,
      name: r'precipitation',
      type: IsarType.doubleList,
    ),
    r'rain': PropertySchema(
      id: 3,
      name: r'rain',
      type: IsarType.doubleList,
    ),
    r'relativehumidity2M': PropertySchema(
      id: 4,
      name: r'relativehumidity2M',
      type: IsarType.longList,
    ),
    r'surfacePressure': PropertySchema(
      id: 5,
      name: r'surfacePressure',
      type: IsarType.doubleList,
    ),
    r'temperature2M': PropertySchema(
      id: 6,
      name: r'temperature2M',
      type: IsarType.doubleList,
    ),
    r'time': PropertySchema(
      id: 7,
      name: r'time',
      type: IsarType.stringList,
    ),
    r'visibility': PropertySchema(
      id: 8,
      name: r'visibility',
      type: IsarType.doubleList,
    ),
    r'weathercode': PropertySchema(
      id: 9,
      name: r'weathercode',
      type: IsarType.longList,
    ),
    r'winddirection10M': PropertySchema(
      id: 10,
      name: r'winddirection10M',
      type: IsarType.longList,
    ),
    r'windspeed10M': PropertySchema(
      id: 11,
      name: r'windspeed10M',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _weatherDayEstimateSize,
  serialize: _weatherDaySerialize,
  deserialize: _weatherDayDeserialize,
  deserializeProp: _weatherDayDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _weatherDayGetId,
  getLinks: _weatherDayGetLinks,
  attach: _weatherDayAttach,
  version: '3.0.5',
);

int _weatherDayEstimateSize(
  WeatherDay object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apparentTemperature.length * 8;
  bytesCount += 3 + object.evapotranspiration.length * 8;
  bytesCount += 3 + object.precipitation.length * 8;
  bytesCount += 3 + object.rain.length * 8;
  bytesCount += 3 + object.relativehumidity2M.length * 8;
  bytesCount += 3 + object.surfacePressure.length * 8;
  bytesCount += 3 + object.temperature2M.length * 8;
  bytesCount += 3 + object.time.length * 3;
  {
    for (var i = 0; i < object.time.length; i++) {
      final value = object.time[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.visibility.length * 8;
  bytesCount += 3 + object.weathercode.length * 8;
  bytesCount += 3 + object.winddirection10M.length * 8;
  bytesCount += 3 + object.windspeed10M.length * 8;
  return bytesCount;
}

void _weatherDaySerialize(
  WeatherDay object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.apparentTemperature);
  writer.writeDoubleList(offsets[1], object.evapotranspiration);
  writer.writeDoubleList(offsets[2], object.precipitation);
  writer.writeDoubleList(offsets[3], object.rain);
  writer.writeLongList(offsets[4], object.relativehumidity2M);
  writer.writeDoubleList(offsets[5], object.surfacePressure);
  writer.writeDoubleList(offsets[6], object.temperature2M);
  writer.writeStringList(offsets[7], object.time);
  writer.writeDoubleList(offsets[8], object.visibility);
  writer.writeLongList(offsets[9], object.weathercode);
  writer.writeLongList(offsets[10], object.winddirection10M);
  writer.writeDoubleList(offsets[11], object.windspeed10M);
}

WeatherDay _weatherDayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherDay(
    apparentTemperature: reader.readDoubleList(offsets[0]) ?? [],
    evapotranspiration: reader.readDoubleList(offsets[1]) ?? [],
    precipitation: reader.readDoubleList(offsets[2]) ?? [],
    rain: reader.readDoubleList(offsets[3]) ?? [],
    relativehumidity2M: reader.readLongList(offsets[4]) ?? [],
    surfacePressure: reader.readDoubleList(offsets[5]) ?? [],
    temperature2M: reader.readDoubleList(offsets[6]) ?? [],
    time: reader.readStringList(offsets[7]) ?? [],
    visibility: reader.readDoubleList(offsets[8]) ?? [],
    weathercode: reader.readLongList(offsets[9]) ?? [],
    winddirection10M: reader.readLongList(offsets[10]) ?? [],
    windspeed10M: reader.readDoubleList(offsets[11]) ?? [],
  );
  object.id = id;
  return object;
}

P _weatherDayDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 2:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 3:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    case 5:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 6:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 9:
      return (reader.readLongList(offset) ?? []) as P;
    case 10:
      return (reader.readLongList(offset) ?? []) as P;
    case 11:
      return (reader.readDoubleList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weatherDayGetId(WeatherDay object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weatherDayGetLinks(WeatherDay object) {
  return [];
}

void _weatherDayAttach(IsarCollection<dynamic> col, Id id, WeatherDay object) {
  object.id = id;
}

extension WeatherDayQueryWhereSort
    on QueryBuilder<WeatherDay, WeatherDay, QWhere> {
  QueryBuilder<WeatherDay, WeatherDay, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeatherDayQueryWhere
    on QueryBuilder<WeatherDay, WeatherDay, QWhereClause> {
  QueryBuilder<WeatherDay, WeatherDay, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterWhereClause> idBetween(
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

extension WeatherDayQueryFilter
    on QueryBuilder<WeatherDay, WeatherDay, QFilterCondition> {
  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      apparentTemperatureElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      apparentTemperatureElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      apparentTemperatureElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      apparentTemperatureElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      evapotranspirationElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      evapotranspirationElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      evapotranspirationElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      evapotranspirationElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      precipitationElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      precipitationElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      precipitationElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      precipitationElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      rainElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      rainElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      rainElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      rainElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainLengthEqualTo(
      int length) {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainIsEmpty() {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainIsNotEmpty() {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainLengthBetween(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      relativehumidity2MElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      relativehumidity2MElementGreaterThan(
    int value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      relativehumidity2MElementLessThan(
    int value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      relativehumidity2MElementBetween(
    int lower,
    int upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      surfacePressureElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      surfacePressureElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      surfacePressureElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      surfacePressureElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      timeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      timeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      timeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      timeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeLengthEqualTo(
      int length) {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeIsEmpty() {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeIsNotEmpty() {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeLengthBetween(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      visibilityElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      visibilityElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      visibilityElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      visibilityElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      weathercodeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      winddirection10MElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      winddirection10MElementGreaterThan(
    int value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      winddirection10MElementLessThan(
    int value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      winddirection10MElementBetween(
    int lower,
    int upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      windspeed10MElementEqualTo(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      windspeed10MElementGreaterThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      windspeed10MElementLessThan(
    double value, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      windspeed10MElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
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
}

extension WeatherDayQueryObject
    on QueryBuilder<WeatherDay, WeatherDay, QFilterCondition> {}

extension WeatherDayQueryLinks
    on QueryBuilder<WeatherDay, WeatherDay, QFilterCondition> {}

extension WeatherDayQuerySortBy
    on QueryBuilder<WeatherDay, WeatherDay, QSortBy> {}

extension WeatherDayQuerySortThenBy
    on QueryBuilder<WeatherDay, WeatherDay, QSortThenBy> {
  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension WeatherDayQueryWhereDistinct
    on QueryBuilder<WeatherDay, WeatherDay, QDistinct> {
  QueryBuilder<WeatherDay, WeatherDay, QDistinct>
      distinctByApparentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentTemperature');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct>
      distinctByEvapotranspiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evapotranspiration');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByPrecipitation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitation');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByRain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rain');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct>
      distinctByRelativehumidity2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relativehumidity2M');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctBySurfacePressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surfacePressure');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByTemperature2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2M');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visibility');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weathercode');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByWinddirection10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winddirection10M');
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByWindspeed10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windspeed10M');
    });
  }
}

extension WeatherDayQueryProperty
    on QueryBuilder<WeatherDay, WeatherDay, QQueryProperty> {
  QueryBuilder<WeatherDay, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      apparentTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperature');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      evapotranspirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evapotranspiration');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      precipitationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitation');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations> rainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rain');
    });
  }

  QueryBuilder<WeatherDay, List<int>, QQueryOperations>
      relativehumidity2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relativehumidity2M');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      surfacePressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surfacePressure');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      temperature2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2M');
    });
  }

  QueryBuilder<WeatherDay, List<String>, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }

  QueryBuilder<WeatherDay, List<int>, QQueryOperations> weathercodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercode');
    });
  }

  QueryBuilder<WeatherDay, List<int>, QQueryOperations>
      winddirection10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winddirection10M');
    });
  }

  QueryBuilder<WeatherDay, List<double>, QQueryOperations>
      windspeed10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windspeed10M');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetWeather7DayCollection on Isar {
  IsarCollection<Weather7Day> get weather7Days => this.collection();
}

const Weather7DaySchema = CollectionSchema(
  name: r'Weather7Day',
  id: -6046414381677256947,
  properties: {
    r'temperature2MMax': PropertySchema(
      id: 0,
      name: r'temperature2MMax',
      type: IsarType.doubleList,
    ),
    r'temperature2MMin': PropertySchema(
      id: 1,
      name: r'temperature2MMin',
      type: IsarType.doubleList,
    ),
    r'time': PropertySchema(
      id: 2,
      name: r'time',
      type: IsarType.dateTimeList,
    ),
    r'weathercode': PropertySchema(
      id: 3,
      name: r'weathercode',
      type: IsarType.longList,
    )
  },
  estimateSize: _weather7DayEstimateSize,
  serialize: _weather7DaySerialize,
  deserialize: _weather7DayDeserialize,
  deserializeProp: _weather7DayDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _weather7DayGetId,
  getLinks: _weather7DayGetLinks,
  attach: _weather7DayAttach,
  version: '3.0.5',
);

int _weather7DayEstimateSize(
  Weather7Day object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.temperature2MMax.length * 8;
  bytesCount += 3 + object.temperature2MMin.length * 8;
  bytesCount += 3 + object.time.length * 8;
  bytesCount += 3 + object.weathercode.length * 8;
  return bytesCount;
}

void _weather7DaySerialize(
  Weather7Day object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.temperature2MMax);
  writer.writeDoubleList(offsets[1], object.temperature2MMin);
  writer.writeDateTimeList(offsets[2], object.time);
  writer.writeLongList(offsets[3], object.weathercode);
}

Weather7Day _weather7DayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Weather7Day(
    temperature2MMax: reader.readDoubleList(offsets[0]) ?? [],
    temperature2MMin: reader.readDoubleList(offsets[1]) ?? [],
    time: reader.readDateTimeList(offsets[2]) ?? [],
    weathercode: reader.readLongList(offsets[3]) ?? [],
  );
  object.id = id;
  return object;
}

P _weather7DayDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTimeList(offset) ?? []) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weather7DayGetId(Weather7Day object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weather7DayGetLinks(Weather7Day object) {
  return [];
}

void _weather7DayAttach(
    IsarCollection<dynamic> col, Id id, Weather7Day object) {
  object.id = id;
}

extension Weather7DayQueryWhereSort
    on QueryBuilder<Weather7Day, Weather7Day, QWhere> {
  QueryBuilder<Weather7Day, Weather7Day, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Weather7DayQueryWhere
    on QueryBuilder<Weather7Day, Weather7Day, QWhereClause> {
  QueryBuilder<Weather7Day, Weather7Day, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterWhereClause> idBetween(
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

extension Weather7DayQueryFilter
    on QueryBuilder<Weather7Day, Weather7Day, QFilterCondition> {
  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMaxElementEqualTo(
    double value, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMaxElementGreaterThan(
    double value, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMaxElementLessThan(
    double value, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMaxElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMinElementEqualTo(
    double value, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMinElementGreaterThan(
    double value, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMinElementLessThan(
    double value, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      temperature2MMinElementBetween(
    double lower,
    double upper, {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      timeElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      timeElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      timeElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      timeElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> timeIsEmpty() {
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      weathercodeElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
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
}

extension Weather7DayQueryObject
    on QueryBuilder<Weather7Day, Weather7Day, QFilterCondition> {}

extension Weather7DayQueryLinks
    on QueryBuilder<Weather7Day, Weather7Day, QFilterCondition> {}

extension Weather7DayQuerySortBy
    on QueryBuilder<Weather7Day, Weather7Day, QSortBy> {}

extension Weather7DayQuerySortThenBy
    on QueryBuilder<Weather7Day, Weather7Day, QSortThenBy> {
  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension Weather7DayQueryWhereDistinct
    on QueryBuilder<Weather7Day, Weather7Day, QDistinct> {
  QueryBuilder<Weather7Day, Weather7Day, QDistinct>
      distinctByTemperature2MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2MMax');
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QDistinct>
      distinctByTemperature2MMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature2MMin');
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QDistinct> distinctByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weathercode');
    });
  }
}

extension Weather7DayQueryProperty
    on QueryBuilder<Weather7Day, Weather7Day, QQueryProperty> {
  QueryBuilder<Weather7Day, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Weather7Day, List<double>, QQueryOperations>
      temperature2MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMax');
    });
  }

  QueryBuilder<Weather7Day, List<double>, QQueryOperations>
      temperature2MMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMin');
    });
  }

  QueryBuilder<Weather7Day, List<DateTime>, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<Weather7Day, List<int>, QQueryOperations> weathercodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercode');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLocationCollection on Isar {
  IsarCollection<Location> get locations => this.collection();
}

const LocationSchema = CollectionSchema(
  name: r'Location',
  id: -8833727672639471650,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.string,
    ),
    r'country': PropertySchema(
      id: 1,
      name: r'country',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(
      id: 2,
      name: r'lat',
      type: IsarType.string,
    ),
    r'lon': PropertySchema(
      id: 3,
      name: r'lon',
      type: IsarType.string,
    )
  },
  estimateSize: _locationEstimateSize,
  serialize: _locationSerialize,
  deserialize: _locationDeserialize,
  deserializeProp: _locationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _locationGetId,
  getLinks: _locationGetLinks,
  attach: _locationAttach,
  version: '3.0.5',
);

int _locationEstimateSize(
  Location object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.city.length * 3;
  bytesCount += 3 + object.country.length * 3;
  bytesCount += 3 + object.lat.length * 3;
  bytesCount += 3 + object.lon.length * 3;
  return bytesCount;
}

void _locationSerialize(
  Location object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.city);
  writer.writeString(offsets[1], object.country);
  writer.writeString(offsets[2], object.lat);
  writer.writeString(offsets[3], object.lon);
}

Location _locationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Location(
    city: reader.readString(offsets[0]),
    country: reader.readString(offsets[1]),
    lat: reader.readString(offsets[2]),
    lon: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _locationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _locationGetId(Location object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationGetLinks(Location object) {
  return [];
}

void _locationAttach(IsarCollection<dynamic> col, Id id, Location object) {
  object.id = id;
}

extension LocationQueryWhereSort on QueryBuilder<Location, Location, QWhere> {
  QueryBuilder<Location, Location, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocationQueryWhere on QueryBuilder<Location, Location, QWhereClause> {
  QueryBuilder<Location, Location, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Location, Location, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idBetween(
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

extension LocationQueryFilter
    on QueryBuilder<Location, Location, QFilterCondition> {
  QueryBuilder<Location, Location, QAfterFilterCondition> cityEqualTo(
    String value, {
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityGreaterThan(
    String value, {
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityLessThan(
    String value, {
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityStartsWith(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityEndsWith(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityContains(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityMatches(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> latEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lat',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lon',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> lonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lon',
        value: '',
      ));
    });
  }
}

extension LocationQueryObject
    on QueryBuilder<Location, Location, QFilterCondition> {}

extension LocationQueryLinks
    on QueryBuilder<Location, Location, QFilterCondition> {}

extension LocationQuerySortBy on QueryBuilder<Location, Location, QSortBy> {
  QueryBuilder<Location, Location, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }
}

extension LocationQuerySortThenBy
    on QueryBuilder<Location, Location, QSortThenBy> {
  QueryBuilder<Location, Location, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lon', Sort.desc);
    });
  }
}

extension LocationQueryWhereDistinct
    on QueryBuilder<Location, Location, QDistinct> {
  QueryBuilder<Location, Location, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Location, Location, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Location, Location, QDistinct> distinctByLat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Location, Location, QDistinct> distinctByLon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lon', caseSensitive: caseSensitive);
    });
  }
}

extension LocationQueryProperty
    on QueryBuilder<Location, Location, QQueryProperty> {
  QueryBuilder<Location, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Location, String, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<Location, String, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<Location, String, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<Location, String, QQueryOperations> lonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lon');
    });
  }
}
