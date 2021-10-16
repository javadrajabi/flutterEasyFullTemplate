import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/utils/value_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/data/local/constants/db_constants.dart';

class LocalDB {
  LocalDB._();

  static String path = '/';
  static var db;
  static Future init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    path = [documentsDirectory.path, DBConstants.DB_NAME].join('/');
    db = await databaseFactoryIo.openDatabase(path);
  }

  static Future getlocalNodeCount() async {
    try {
      var records;
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      records = (await store.find(db,
          finder: Finder(filter: Filter.notNull('owner'))));
      List res = [];

      records.forEach((element) {
        if (!res.contains(element['owner'])) {
          res.add(element['owner']);
        }
      });

      return res;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalMyStoreForsave(String type) async {
    try {
      var records;
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      print(type);
      if (type == 'Hidden' ||
          type == 'Hollow' ||
          type == 'Luster' ||
          type == 'Roof') {
        print('in if');
        records = (await store.find(db,
            finder: Finder(
                filter: Filter.matches('name', '^Light'),
                sortOrders: [SortOrder('cunt')])));
      } else {
        print('else if');
        records = (await store.find(db,
            finder: Finder(
                filter: Filter.matches('type', '^$type'),
                sortOrders: [SortOrder('cunt')])));
      }

      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalTempDetails(int cunt) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      var records =
          (await store.find(db, finder: Finder(filter: Filter.byKey(cunt))));

      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalDuplicateSendName(String name) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      var records = (await store.find(db,
          finder: Finder(filter: Filter.matches('sendCode', '^' + name))));

      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalCurtainDetails(int cunt) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var records =
          (await store.find(db, finder: Finder(filter: Filter.byKey(cunt))));

      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalAllLight(nodeId) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var records = (await store.find(db,
          finder: Finder(
              filter: Filter.and([
                Filter.matches('owner', nodeId),
                Filter.matches('name', '^Light')
              ]),
              sortOrders: [SortOrder('cunt')])));
      print(records);
      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalAllSocket(nodeId) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var records = (await store.find(db,
          finder: Finder(
              filter: Filter.and([
                Filter.matches('owner', nodeId),
                Filter.matches('name', '^Socket')
              ]),
              sortOrders: [SortOrder('cunt')])));
      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalAllTemp(nodeId) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var records = (await store.find(db,
          finder: Finder(
              filter: Filter.and([
                Filter.matches('owner', nodeId),
                Filter.matches('name', '^Temp')
              ]),
              sortOrders: [SortOrder('cunt')])));

      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalAllCurtain(nodeId) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var records = (await store.find(db,
          finder: Finder(
              filter: Filter.and([
                Filter.matches('owner', nodeId),
                Filter.matches('name', '^Curtain')
              ]),
              sortOrders: [SortOrder('cunt')])));

      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalAllMyStoreSetting() async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var records = (await store.find(db,
          finder: Finder(sortOrders: [SortOrder('cunt')])));
      print(records);
      return records;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalAllMyStore({required String owner}) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      if (owner == '') {
        var name = await LocalDB.getlocalNodename();
        name = name ?? '';
        var records = (await store.find(db,
            finder: Finder(
                filter: Filter.equals('owner', name),
                sortOrders: [SortOrder('cunt')])));

        return records;
      } else {
        var records = (await store.find(db,
            finder: Finder(
                filter: Filter.equals('owner', owner),
                sortOrders: [SortOrder('cunt')])));

        return records;
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future deleteAllRecord() async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      // var filter = Filter.equals('sendCode', key);
      // var finder = Finder(filter: filter);
      await store.delete(db);

//
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future deletelocalSelectedMyStore(Map data) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      var res = await store.delete(db,
          finder: Finder(
              filter: Filter.and([
            Filter.equals('NodeId', data['NodeId']),
            Filter.equals('cunt', data['cunt']),
            Filter.equals('sendCode', data['sendCode'])
          ])));
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrmasterl;l;l:::::' + res.toString());
      // await store.record(key).delete(db);
//
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future deletelocalAllMyStore(var key) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      var filter = Filter.equals('sendCode', key);
      var finder = Finder(filter: filter);
      await store.delete(db, finder: finder);

//
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalNodename() async {
    try {
      print("getlocalNodename");
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = StoreRef.main();
      var record = await store.record('nodename').get(db);
//      await store.record('nodename').put(db, name);

      return record;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalPassword() async {
    try {
      print("getlocalPassword");
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = StoreRef.main();
      var record = await store.record('password').get(db);
//      await store.record('nodename').put(db, name);
      print('add record');
      return record;
    } catch (e) {
      throw (e);
    }
  }

  static Future getlocalDeviceId() async {
    try {
      print("getlocalDeviceId");
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = StoreRef.main();
      var record = await store.record('deviceid').get(db);
//      await store.record('nodename').put(db, name);
      print('add record');
      return record;
    } catch (e) {
      throw (e);
    }
  }

  static Future<bool> setlocalNodename(String name) async {
    try {
      print("setlocalNodename");
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = StoreRef.main();
//       await store.record('nodename').get(db);
      await store.record('nodename').put(db, name);
      print('add record');
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future<bool> setlocalPassword(String name) async {
    try {
      print("setlocalPassword");
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = StoreRef.main();
//       await store.record('nodename').get(db);
      await store.record('password').put(db, name);
      print('add record');
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future<bool> setlocalDeviceId(int id) async {
    try {
      print("setlocalDeviceId");
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = StoreRef.main();
//       await store.record('nodename').get(db);
      await store.record('deviceid').put(db, id);
      print('add record');
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future updatelocalrecord(String sendCode, String value,
      {String? onField}) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      var res = await store.update(db, {onField ?? 'value': value},
          finder: Finder(filter: Filter.equals('sendCode', sendCode)));
      // var record = await store.record(key).get(db);
      print('update record :  $res --------- $sendCode -------$value');
      return 'updated';
    } catch (e) {
      throw (e);
    }
  }

  static Future updatelocalrecordByKey(key, String varName, value) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      var res = await store.update(db, {varName: value},
          finder: Finder(filter: Filter.byKey(key)));
      // var record = await store.record(key).get(db);
      print('update record $key :  $res --------- $varName ::  $value -------');
      return 'updated';
    } catch (e) {
      throw (e);
    }
  }

  static Future updateLocalRecordAlias(int key, String alias) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);
      var res = await store.update(db, {'alias': alias},
          finder: Finder(filter: Filter.byKey(key)));
      var record = await store.record(key).get(db);
      print('update record :  $res --------- $record -------');
      return record!['alias'];
    } catch (e) {
      throw (e);
    }
  }

  static Future<bool> setlocalMyStore(data,
      {required String name,
      required String type,
      required int cunt,
      required String value,
      required String sendCode,
      required String owner}) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      await store.add(db, data);
//      final db = ObjectDB(path);
//      db.open();
//      final data = await db.find({'tbname': 'mycards'});
//      db.close();
//      print(data[0]['data']);
      print('add record');
      return true;
    } catch (e) {
      throw (e);
    }
  }

  static Future<bool> setlocalNodeStore(var data) async {
    try {
      // Directory documentsDirectory = await getApplicationDocumentsDirectory();
      // final path = [documentsDirectory.path, 'inoSoft.db'].join('/');
      // var db = await databaseFactoryIo.openDatabase(path);
      var store = intMapStoreFactory.store(DBConstants.STORE_NAME);

      await store.add(db, data);
//      final db = ObjectDB(path);
//      db.open();
//      final data = await db.find({'tbname': 'mycards'});
//      db.close();
//      print(data[0]['data']);
      print('add record');
      return true;
    } catch (e) {
      throw (e);
    }
  }
}

////////////////////////////////////
