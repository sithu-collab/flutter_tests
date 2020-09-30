import 'dart:io';

import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:moor_ffi/moor_ffi.dart';
part 'moor_database.g.dart';

class Orders extends Table {
  TextColumn get price => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productName => text()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    return VmDatabase(file);
  });
}


@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  Future<List<Order>> getAllOrder() => select(orders).get();
  Stream<List<Order>> watchAllOrder() => select(orders).watch();
  Future insertNewOrder(Order order) => into(orders).insert(order);
  Future deleteOrder(Order order) => delete(orders).delete(order);

}