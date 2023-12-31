import 'package:rethink_db_ns/rethink_db_ns.dart';

Future<void> createDb(RethinkDb r, Connection connection) async {
  //create db
  await r.dbCreate('test').run(connection).catchError((err) => {});
  //create users table
  await r.tableCreate('users').run(connection).catchError((err) => {});
  //create messages table
  await r.tableCreate('messages').run(connection).catchError((err) => {});
  //create receipts table
  await r.tableCreate('receipts').run(connection).catchError((err) => {});
  //create typing_events table
  await r.tableCreate('typing_events').run(connection).catchError((err) => {});
}

Future<void> cleanDb(RethinkDb r, Connection connection) async {
  //delete users table
  await r.table('users').delete().run(connection).catchError((err) => {print(err)});

  //delete messages table
  await r.table('messages').delete().run(connection).catchError((err) => {print(err)});

  //delete receipts table
  await r.table('receipts').delete().run(connection).catchError((err) => {print(err)});

  //delete typing_events table
  await r.table('typing_events').delete().run(connection).catchError((err) => {print(err)});
}
