// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final String price;
  final int id;
  final String productName;
  Order({required this.price, required this.id, required this.productName});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Order(
      price: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['price'] = Variable<String>(price);
    map['id'] = Variable<int>(id);
    map['product_name'] = Variable<String>(productName);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      price: Value(price),
      id: Value(id),
      productName: Value(productName),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      price: serializer.fromJson<String>(json['price']),
      id: serializer.fromJson<int>(json['id']),
      productName: serializer.fromJson<String>(json['productName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'price': serializer.toJson<String>(price),
      'id': serializer.toJson<int>(id),
      'productName': serializer.toJson<String>(productName),
    };
  }

  Order copyWith({String? price, int? id, String? productName}) => Order(
        price: price ?? this.price,
        id: id ?? this.id,
        productName: productName ?? this.productName,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('price: $price, ')
          ..write('id: $id, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(price, id, productName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.price == this.price &&
          other.id == this.id &&
          other.productName == this.productName);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> price;
  final Value<int> id;
  final Value<String> productName;
  const OrdersCompanion({
    this.price = const Value.absent(),
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
  });
  OrdersCompanion.insert({
    required String price,
    this.id = const Value.absent(),
    required String productName,
  })  : price = Value(price),
        productName = Value(productName);
  static Insertable<Order> custom({
    Expression<String>? price,
    Expression<int>? id,
    Expression<String>? productName,
  }) {
    return RawValuesInsertable({
      if (price != null) 'price': price,
      if (id != null) 'id': id,
      if (productName != null) 'product_name': productName,
    });
  }

  OrdersCompanion copyWith(
      {Value<String>? price, Value<int>? id, Value<String>? productName}) {
    return OrdersCompanion(
      price: price ?? this.price,
      id: id ?? this.id,
      productName: productName ?? this.productName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('price: $price, ')
          ..write('id: $id, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<String?> price = GeneratedColumn<String?>(
      'price', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  late final GeneratedColumn<String?> productName = GeneratedColumn<String?>(
      'product_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [price, id, productName];
  @override
  String get aliasedName => _alias ?? 'orders';
  @override
  String get actualTableName => 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Order.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $OrdersTable orders = $OrdersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}
