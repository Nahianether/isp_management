// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCollection on Isar {
  IsarCollection<User> get users => this.collection();
}

const UserSchema = CollectionSchema(
  name: r'User',
  id: -7838171048429979076,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'alternativePhoneNumber': PropertySchema(
      id: 1,
      name: r'alternativePhoneNumber',
      type: IsarType.string,
    ),
    r'billHistory': PropertySchema(
      id: 2,
      name: r'billHistory',
      type: IsarType.objectList,
      target: r'BillHistory',
    ),
    r'connectionDate': PropertySchema(
      id: 3,
      name: r'connectionDate',
      type: IsarType.dateTime,
    ),
    r'fullName': PropertySchema(
      id: 4,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'packageName': PropertySchema(
      id: 5,
      name: r'packageName',
      type: IsarType.string,
    ),
    r'packagePrice': PropertySchema(
      id: 6,
      name: r'packagePrice',
      type: IsarType.string,
    ),
    r'paymentType': PropertySchema(
      id: 7,
      name: r'paymentType',
      type: IsarType.byte,
      enumMap: _UserpaymentTypeEnumValueMap,
    ),
    r'phoneNumber': PropertySchema(
      id: 8,
      name: r'phoneNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _userEstimateSize,
  serialize: _userSerialize,
  deserialize: _userDeserialize,
  deserializeProp: _userDeserializeProp,
  idName: r'id',
  indexes: {
    r'paymentType': IndexSchema(
      id: -3966929649740911419,
      name: r'paymentType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'paymentType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'BillHistory': BillHistorySchema},
  getId: _userGetId,
  getLinks: _userGetLinks,
  attach: _userAttach,
  version: '3.1.0+1',
);

int _userEstimateSize(
  User object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  {
    final value = object.alternativePhoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.billHistory;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[BillHistory]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              BillHistorySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.packageName.length * 3;
  bytesCount += 3 + object.packagePrice.length * 3;
  bytesCount += 3 + object.phoneNumber.length * 3;
  return bytesCount;
}

void _userSerialize(
  User object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.alternativePhoneNumber);
  writer.writeObjectList<BillHistory>(
    offsets[2],
    allOffsets,
    BillHistorySchema.serialize,
    object.billHistory,
  );
  writer.writeDateTime(offsets[3], object.connectionDate);
  writer.writeString(offsets[4], object.fullName);
  writer.writeString(offsets[5], object.packageName);
  writer.writeString(offsets[6], object.packagePrice);
  writer.writeByte(offsets[7], object.paymentType.index);
  writer.writeString(offsets[8], object.phoneNumber);
}

User _userDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = User(
    address: reader.readString(offsets[0]),
    alternativePhoneNumber: reader.readStringOrNull(offsets[1]),
    billHistory: reader.readObjectList<BillHistory>(
      offsets[2],
      BillHistorySchema.deserialize,
      allOffsets,
      BillHistory(),
    ),
    connectionDate: reader.readDateTime(offsets[3]),
    fullName: reader.readString(offsets[4]),
    packageName: reader.readString(offsets[5]),
    packagePrice: reader.readString(offsets[6]),
    paymentType:
        _UserpaymentTypeValueEnumMap[reader.readByteOrNull(offsets[7])] ??
            PaymentType.paid,
    phoneNumber: reader.readString(offsets[8]),
  );
  object.id = id;
  return object;
}

P _userDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<BillHistory>(
        offset,
        BillHistorySchema.deserialize,
        allOffsets,
        BillHistory(),
      )) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_UserpaymentTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          PaymentType.paid) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _UserpaymentTypeEnumValueMap = {
  'paid': 0,
  'unPaid': 1,
  'allUnPaid': 2,
};
const _UserpaymentTypeValueEnumMap = {
  0: PaymentType.paid,
  1: PaymentType.unPaid,
  2: PaymentType.allUnPaid,
};

Id _userGetId(User object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userGetLinks(User object) {
  return [];
}

void _userAttach(IsarCollection<dynamic> col, Id id, User object) {
  object.id = id;
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<User, User, QAfterWhere> anyPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'paymentType'),
      );
    });
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
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

  QueryBuilder<User, User, QAfterWhereClause> paymentTypeEqualTo(
      PaymentType paymentType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'paymentType',
        value: [paymentType],
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> paymentTypeNotEqualTo(
      PaymentType paymentType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentType',
              lower: [],
              upper: [paymentType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentType',
              lower: [paymentType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentType',
              lower: [paymentType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentType',
              lower: [],
              upper: [paymentType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> paymentTypeGreaterThan(
    PaymentType paymentType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'paymentType',
        lower: [paymentType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> paymentTypeLessThan(
    PaymentType paymentType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'paymentType',
        lower: [],
        upper: [paymentType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> paymentTypeBetween(
    PaymentType lowerPaymentType,
    PaymentType upperPaymentType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'paymentType',
        lower: [lowerPaymentType],
        includeLower: includeLower,
        upper: [upperPaymentType],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternativePhoneNumber',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternativePhoneNumber',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> alternativePhoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativePhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternativePhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternativePhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> alternativePhoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternativePhoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternativePhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternativePhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternativePhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> alternativePhoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternativePhoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternativePhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      alternativePhoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternativePhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billHistory',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billHistory',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'billHistory',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'billHistory',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'billHistory',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'billHistory',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'billHistory',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> billHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'billHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> connectionDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> connectionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'connectionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> connectionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'connectionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> connectionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'connectionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
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

  QueryBuilder<User, User, QAfterFilterCondition> packageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packagePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packagePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packagePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packagePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packagePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packagePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packagePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packagePrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packagePrice',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> packagePriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packagePrice',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> paymentTypeEqualTo(
      PaymentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentType',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> paymentTypeGreaterThan(
    PaymentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentType',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> paymentTypeLessThan(
    PaymentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentType',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> paymentTypeBetween(
    PaymentType lower,
    PaymentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }
}

extension UserQueryObject on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> billHistoryElement(
      FilterQuery<BillHistory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'billHistory');
    });
  }
}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQuerySortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByAlternativePhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativePhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByAlternativePhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativePhoneNumber', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByConnectionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionDate', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByConnectionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionDate', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPackagePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagePrice', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPackagePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagePrice', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPaymentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }
}

extension UserQuerySortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByAlternativePhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativePhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByAlternativePhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternativePhoneNumber', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByConnectionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionDate', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByConnectionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionDate', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPackagePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagePrice', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPackagePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagePrice', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPaymentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByAlternativePhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternativePhoneNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByConnectionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectionDate');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByPackageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByPackagePrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packagePrice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentType');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<User, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<User, String?, QQueryOperations>
      alternativePhoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternativePhoneNumber');
    });
  }

  QueryBuilder<User, List<BillHistory>?, QQueryOperations>
      billHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billHistory');
    });
  }

  QueryBuilder<User, DateTime, QQueryOperations> connectionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectionDate');
    });
  }

  QueryBuilder<User, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<User, String, QQueryOperations> packageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageName');
    });
  }

  QueryBuilder<User, String, QQueryOperations> packagePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packagePrice');
    });
  }

  QueryBuilder<User, PaymentType, QQueryOperations> paymentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentType');
    });
  }

  QueryBuilder<User, String, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BillHistorySchema = Schema(
  name: r'BillHistory',
  id: -4095001781763806558,
  properties: {
    r'billAmount': PropertySchema(
      id: 0,
      name: r'billAmount',
      type: IsarType.string,
    ),
    r'billPaidDate': PropertySchema(
      id: 1,
      name: r'billPaidDate',
      type: IsarType.dateTime,
    ),
    r'monthOfBill': PropertySchema(
      id: 2,
      name: r'monthOfBill',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _billHistoryEstimateSize,
  serialize: _billHistorySerialize,
  deserialize: _billHistoryDeserialize,
  deserializeProp: _billHistoryDeserializeProp,
);

int _billHistoryEstimateSize(
  BillHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.billAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _billHistorySerialize(
  BillHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.billAmount);
  writer.writeDateTime(offsets[1], object.billPaidDate);
  writer.writeDateTime(offsets[2], object.monthOfBill);
}

BillHistory _billHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BillHistory(
    billAmount: reader.readStringOrNull(offsets[0]),
    billPaidDate: reader.readDateTimeOrNull(offsets[1]),
    monthOfBill: reader.readDateTimeOrNull(offsets[2]),
  );
  return object;
}

P _billHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BillHistoryQueryFilter
    on QueryBuilder<BillHistory, BillHistory, QFilterCondition> {
  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billAmount',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billAmount',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'billAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'billAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'billAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'billAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'billAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billPaidDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billPaidDate',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billPaidDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billPaidDate',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billPaidDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billPaidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billPaidDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billPaidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billPaidDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billPaidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      billPaidDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billPaidDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      monthOfBillIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'monthOfBill',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      monthOfBillIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'monthOfBill',
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      monthOfBillEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthOfBill',
        value: value,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      monthOfBillGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthOfBill',
        value: value,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      monthOfBillLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthOfBill',
        value: value,
      ));
    });
  }

  QueryBuilder<BillHistory, BillHistory, QAfterFilterCondition>
      monthOfBillBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthOfBill',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BillHistoryQueryObject
    on QueryBuilder<BillHistory, BillHistory, QFilterCondition> {}
