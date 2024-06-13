import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service/storage.service.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';

abstract class  GenericRepository<T extends BaseModel> {
final StorageService _storageService = getIt.get<StorageService>();
String get table;

GenericRepository(){
  _storageService.initdb(table);
}

save(T item) {
  _storageService.save(item);
}

update(T item) {
  _storageService.update("${item.id}",  item);
}

delete(String id) {
  _storageService.delete(id);
}

T findById(String id){
  return _storageService.findById(id);
}

List<T> findAll(){
  return _storageService.findAll();
}

List<T> findWhere(bool Function(dynamic) filter){
  return _storageService.findWhere(filter);
}


}