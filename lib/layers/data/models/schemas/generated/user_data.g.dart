// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserDataCollection on Isar {
  IsarCollection<UserData> get userDatas => this.collection();
}

const UserDataSchema = CollectionSchema(
  name: r'UserData',
  id: 4284092529070872654,
  properties: {
    r'avatar': PropertySchema(
      id: 0,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 1,
      name: r'email',
      type: IsarType.string,
    ),
    r'isGuest': PropertySchema(
      id: 2,
      name: r'isGuest',
      type: IsarType.bool,
    ),
    r'isSeller': PropertySchema(
      id: 3,
      name: r'isSeller',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 5,
      name: r'phone',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 6,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _userDataEstimateSize,
  serialize: _userDataSerialize,
  deserialize: _userDataDeserialize,
  deserializeProp: _userDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userDataGetId,
  getLinks: _userDataGetLinks,
  attach: _userDataAttach,
  version: '3.1.0+1',
);

int _userDataEstimateSize(
  UserData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userDataSerialize(
  UserData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatar);
  writer.writeString(offsets[1], object.email);
  writer.writeBool(offsets[2], object.isGuest);
  writer.writeBool(offsets[3], object.isSeller);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.phone);
  writer.writeString(offsets[6], object.uuid);
}

UserData _userDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserData();
  object.avatar = reader.readStringOrNull(offsets[0]);
  object.email = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isGuest = reader.readBool(offsets[2]);
  object.isSeller = reader.readBool(offsets[3]);
  object.name = reader.readStringOrNull(offsets[4]);
  object.phone = reader.readStringOrNull(offsets[5]);
  object.uuid = reader.readStringOrNull(offsets[6]);
  return object;
}

P _userDataDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userDataGetId(UserData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userDataGetLinks(UserData object) {
  return [];
}

void _userDataAttach(IsarCollection<dynamic> col, Id id, UserData object) {
  object.id = id;
}

extension UserDataQueryWhereSort on QueryBuilder<UserData, UserData, QWhere> {
  QueryBuilder<UserData, UserData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserDataQueryWhere on QueryBuilder<UserData, UserData, QWhereClause> {
  QueryBuilder<UserData, UserData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserData, UserData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idBetween(
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

extension UserDataQueryFilter
    on QueryBuilder<UserData, UserData, QFilterCondition> {
  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> isGuestEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isGuest',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> isSellerEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSeller',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension UserDataQueryObject
    on QueryBuilder<UserData, UserData, QFilterCondition> {}

extension UserDataQueryLinks
    on QueryBuilder<UserData, UserData, QFilterCondition> {}

extension UserDataQuerySortBy on QueryBuilder<UserData, UserData, QSortBy> {
  QueryBuilder<UserData, UserData, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByIsGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGuest', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByIsGuestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGuest', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByIsSeller() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeller', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByIsSellerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeller', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension UserDataQuerySortThenBy
    on QueryBuilder<UserData, UserData, QSortThenBy> {
  QueryBuilder<UserData, UserData, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIsGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGuest', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIsGuestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGuest', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIsSeller() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeller', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIsSellerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeller', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension UserDataQueryWhereDistinct
    on QueryBuilder<UserData, UserData, QDistinct> {
  QueryBuilder<UserData, UserData, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByIsGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isGuest');
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByIsSeller() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSeller');
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension UserDataQueryProperty
    on QueryBuilder<UserData, UserData, QQueryProperty> {
  QueryBuilder<UserData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserData, String?, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<UserData, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<UserData, bool, QQueryOperations> isGuestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isGuest');
    });
  }

  QueryBuilder<UserData, bool, QQueryOperations> isSellerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSeller');
    });
  }

  QueryBuilder<UserData, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<UserData, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<UserData, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
