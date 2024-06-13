import 'dart:convert';

import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/v7.dart';

class StorageService {
  final _storage = getIt.get<SharedPreferences>();
  List _colletion = List.empty(growable: true);
  late String _table;

  initdb(String table) {
    _table = table;
    _load();
  }

  Future<void> save(dynamic item) async {
    item.id = const UuidV7().generate();
    _colletion.add(item);
    _sync(_colletion);
  }

  Future<void> update(String id, dynamic item) async {
    _colletion.removeWhere((find) => find.id == item.id);
    _colletion.add(item);
    _sync(_colletion);
  }

   Future<void> delete(String id) async {
    _colletion.removeWhere((find) => find.id == id);
    _sync(_colletion);
  }

  findById(String id) {
    final result = _colletion.firstOrNull((find) => find.id == id);
    if (result != null) {
      return result;
    }
    throw Exception("Object not found");
  }

  findAll() {
    return _colletion;
  }

  findWhere( bool Function (dynamic) filter) {
    return _colletion.where(filter);
  }


  Future<void> _sync(List item) async {
    await _storage.setString(_table, jsonEncode(item));
    _load();
  }

  void _load() {
    String? data = _storage.getString(_table);
    if (data != null) {
      _colletion = jsonDecode(data);
    }
    _colletion = List.empty(growable: true);
  }
}
