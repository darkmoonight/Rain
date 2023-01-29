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
      type: IsarType.double,
    ),
    r'evapotranspiration': PropertySchema(
      id: 1,
      name: r'evapotranspiration',
      type: IsarType.double,
    ),
    r'precipitation': PropertySchema(
      id: 2,
      name: r'precipitation',
      type: IsarType.double,
    ),
    r'rain': PropertySchema(
      id: 3,
      name: r'rain',
      type: IsarType.long,
    ),
    r'relativehumidity2M': PropertySchema(
      id: 4,
      name: r'relativehumidity2M',
      type: IsarType.long,
    ),
    r'surfacePressure': PropertySchema(
      id: 5,
      name: r'surfacePressure',
      type: IsarType.double,
    ),
    r'temperature2M': PropertySchema(
      id: 6,
      name: r'temperature2M',
      type: IsarType.double,
    ),
    r'time': PropertySchema(
      id: 7,
      name: r'time',
      type: IsarType.string,
    ),
    r'visibility': PropertySchema(
      id: 8,
      name: r'visibility',
      type: IsarType.long,
    ),
    r'weathercode': PropertySchema(
      id: 9,
      name: r'weathercode',
      type: IsarType.long,
    ),
    r'winddirection10M': PropertySchema(
      id: 10,
      name: r'winddirection10M',
      type: IsarType.long,
    ),
    r'windspeed10M': PropertySchema(
      id: 11,
      name: r'windspeed10M',
      type: IsarType.double,
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
  bytesCount += 3 + object.time.length * 3;
  return bytesCount;
}

void _weatherDaySerialize(
  WeatherDay object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.apparentTemperature);
  writer.writeDouble(offsets[1], object.evapotranspiration);
  writer.writeDouble(offsets[2], object.precipitation);
  writer.writeLong(offsets[3], object.rain);
  writer.writeLong(offsets[4], object.relativehumidity2M);
  writer.writeDouble(offsets[5], object.surfacePressure);
  writer.writeDouble(offsets[6], object.temperature2M);
  writer.writeString(offsets[7], object.time);
  writer.writeLong(offsets[8], object.visibility);
  writer.writeLong(offsets[9], object.weathercode);
  writer.writeLong(offsets[10], object.winddirection10M);
  writer.writeDouble(offsets[11], object.windspeed10M);
}

WeatherDay _weatherDayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherDay(
    apparentTemperature: reader.readDouble(offsets[0]),
    evapotranspiration: reader.readDouble(offsets[1]),
    id: id,
    precipitation: reader.readDouble(offsets[2]),
    rain: reader.readLong(offsets[3]),
    relativehumidity2M: reader.readLong(offsets[4]),
    surfacePressure: reader.readDouble(offsets[5]),
    temperature2M: reader.readDouble(offsets[6]),
    time: reader.readString(offsets[7]),
    visibility: reader.readLong(offsets[8]),
    weathercode: reader.readLong(offsets[9]),
    winddirection10M: reader.readLong(offsets[10]),
    windspeed10M: reader.readDouble(offsets[11]),
  );
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
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
      apparentTemperatureEqualTo(
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
      apparentTemperatureGreaterThan(
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
      apparentTemperatureLessThan(
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
      apparentTemperatureBetween(
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
      evapotranspirationEqualTo(
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
      evapotranspirationGreaterThan(
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
      evapotranspirationLessThan(
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
      evapotranspirationBetween(
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
      precipitationEqualTo(
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
      precipitationGreaterThan(
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
      precipitationLessThan(
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
      precipitationBetween(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rain',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rain',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rain',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> rainBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      relativehumidity2MEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relativehumidity2M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      relativehumidity2MGreaterThan(
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
      relativehumidity2MLessThan(
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
      relativehumidity2MBetween(
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
      surfacePressureEqualTo(
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
      surfacePressureGreaterThan(
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
      surfacePressureLessThan(
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
      surfacePressureBetween(
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
      temperature2MEqualTo(
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
      temperature2MGreaterThan(
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
      temperature2MLessThan(
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
      temperature2MBetween(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeEqualTo(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeGreaterThan(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeLessThan(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeBetween(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeStartsWith(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeEndsWith(
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

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> visibilityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      visibilityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visibility',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      visibilityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visibility',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition> visibilityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visibility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      weathercodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      weathercodeGreaterThan(
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
      weathercodeLessThan(
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
      weathercodeBetween(
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
      winddirection10MEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winddirection10M',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterFilterCondition>
      winddirection10MGreaterThan(
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
      winddirection10MLessThan(
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
      winddirection10MBetween(
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
      windspeed10MEqualTo(
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
      windspeed10MGreaterThan(
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
      windspeed10MLessThan(
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
      windspeed10MBetween(
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
}

extension WeatherDayQueryObject
    on QueryBuilder<WeatherDay, WeatherDay, QFilterCondition> {}

extension WeatherDayQueryLinks
    on QueryBuilder<WeatherDay, WeatherDay, QFilterCondition> {}

extension WeatherDayQuerySortBy
    on QueryBuilder<WeatherDay, WeatherDay, QSortBy> {
  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByApparentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentTemperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByApparentTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentTemperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByEvapotranspiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evapotranspiration', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByEvapotranspirationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evapotranspiration', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByPrecipitation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitation', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByPrecipitationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitation', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByRain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rain', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByRainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rain', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByRelativehumidity2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativehumidity2M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByRelativehumidity2MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativehumidity2M', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortBySurfacePressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfacePressure', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortBySurfacePressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfacePressure', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByTemperature2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByTemperature2MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2M', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByWeathercodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByWinddirection10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winddirection10M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      sortByWinddirection10MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winddirection10M', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByWindspeed10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windspeed10M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> sortByWindspeed10MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windspeed10M', Sort.desc);
    });
  }
}

extension WeatherDayQuerySortThenBy
    on QueryBuilder<WeatherDay, WeatherDay, QSortThenBy> {
  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByApparentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentTemperature', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByApparentTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentTemperature', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByEvapotranspiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evapotranspiration', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByEvapotranspirationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evapotranspiration', Sort.desc);
    });
  }

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

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByPrecipitation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitation', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByPrecipitationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitation', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByRain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rain', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByRainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rain', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByRelativehumidity2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativehumidity2M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByRelativehumidity2MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativehumidity2M', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenBySurfacePressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfacePressure', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenBySurfacePressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surfacePressure', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByTemperature2M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByTemperature2MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2M', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByWeathercodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByWinddirection10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winddirection10M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy>
      thenByWinddirection10MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winddirection10M', Sort.desc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByWindspeed10M() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windspeed10M', Sort.asc);
    });
  }

  QueryBuilder<WeatherDay, WeatherDay, QAfterSortBy> thenByWindspeed10MDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windspeed10M', Sort.desc);
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

  QueryBuilder<WeatherDay, WeatherDay, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
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

  QueryBuilder<WeatherDay, double, QQueryOperations>
      apparentTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentTemperature');
    });
  }

  QueryBuilder<WeatherDay, double, QQueryOperations>
      evapotranspirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evapotranspiration');
    });
  }

  QueryBuilder<WeatherDay, double, QQueryOperations> precipitationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitation');
    });
  }

  QueryBuilder<WeatherDay, int, QQueryOperations> rainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rain');
    });
  }

  QueryBuilder<WeatherDay, int, QQueryOperations> relativehumidity2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relativehumidity2M');
    });
  }

  QueryBuilder<WeatherDay, double, QQueryOperations> surfacePressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surfacePressure');
    });
  }

  QueryBuilder<WeatherDay, double, QQueryOperations> temperature2MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2M');
    });
  }

  QueryBuilder<WeatherDay, String, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<WeatherDay, int, QQueryOperations> visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }

  QueryBuilder<WeatherDay, int, QQueryOperations> weathercodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercode');
    });
  }

  QueryBuilder<WeatherDay, int, QQueryOperations> winddirection10MProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winddirection10M');
    });
  }

  QueryBuilder<WeatherDay, double, QQueryOperations> windspeed10MProperty() {
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
      type: IsarType.double,
    ),
    r'temperature2MMin': PropertySchema(
      id: 1,
      name: r'temperature2MMin',
      type: IsarType.double,
    ),
    r'time': PropertySchema(
      id: 2,
      name: r'time',
      type: IsarType.dateTime,
    ),
    r'weathercode': PropertySchema(
      id: 3,
      name: r'weathercode',
      type: IsarType.long,
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
  return bytesCount;
}

void _weather7DaySerialize(
  Weather7Day object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.temperature2MMax);
  writer.writeDouble(offsets[1], object.temperature2MMin);
  writer.writeDateTime(offsets[2], object.time);
  writer.writeLong(offsets[3], object.weathercode);
}

Weather7Day _weather7DayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Weather7Day(
    id: id,
    temperature2MMax: reader.readDouble(offsets[0]),
    temperature2MMin: reader.readDouble(offsets[1]),
    time: reader.readDateTime(offsets[2]),
    weathercode: reader.readLong(offsets[3]),
  );
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
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
      temperature2MMaxEqualTo(
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
      temperature2MMaxGreaterThan(
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
      temperature2MMaxLessThan(
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
      temperature2MMaxBetween(
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
      temperature2MMinEqualTo(
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
      temperature2MMinGreaterThan(
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
      temperature2MMinLessThan(
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
      temperature2MMinBetween(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> timeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> timeGreaterThan(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> timeLessThan(
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

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition> timeBetween(
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
      weathercodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weathercode',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterFilterCondition>
      weathercodeGreaterThan(
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
      weathercodeLessThan(
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
      weathercodeBetween(
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
}

extension Weather7DayQueryObject
    on QueryBuilder<Weather7Day, Weather7Day, QFilterCondition> {}

extension Weather7DayQueryLinks
    on QueryBuilder<Weather7Day, Weather7Day, QFilterCondition> {}

extension Weather7DayQuerySortBy
    on QueryBuilder<Weather7Day, Weather7Day, QSortBy> {
  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      sortByTemperature2MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMax', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      sortByTemperature2MMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMax', Sort.desc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      sortByTemperature2MMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMin', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      sortByTemperature2MMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMin', Sort.desc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> sortByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> sortByWeathercodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.desc);
    });
  }
}

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

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      thenByTemperature2MMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMax', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      thenByTemperature2MMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMax', Sort.desc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      thenByTemperature2MMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMin', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy>
      thenByTemperature2MMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature2MMin', Sort.desc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> thenByWeathercode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.asc);
    });
  }

  QueryBuilder<Weather7Day, Weather7Day, QAfterSortBy> thenByWeathercodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weathercode', Sort.desc);
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

  QueryBuilder<Weather7Day, double, QQueryOperations>
      temperature2MMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMax');
    });
  }

  QueryBuilder<Weather7Day, double, QQueryOperations>
      temperature2MMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature2MMin');
    });
  }

  QueryBuilder<Weather7Day, DateTime, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<Weather7Day, int, QQueryOperations> weathercodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weathercode');
    });
  }
}
