import 'package:ryc_desafio_do_modulo_basico/core/service/storage.service.dart';

abstract class  GenericRepository {
StorageService get storageService;
String get table;

GenericRepository(){
  storageService.initdb(table);
}

save(Map<String, dynamic> item) {
  storageService.save(item);
}

update(Map<String, dynamic> item) {
  storageService.update("${item['id']}",  item);
}

delete(String id) {
  storageService.delete(id);
}

findById(String id){
  return storageService.findById(id);
}

List findAll(){
  return storageService.findAll();
}

List findWhere(bool Function(dynamic) filter){
  return storageService.findWhere(filter);
}


}