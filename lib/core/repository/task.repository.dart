import 'package:ryc_desafio_do_modulo_basico/core/models/task.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/generic.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service/storage.service.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';

class  TaskRepository extends GenericRepository {
  @override
final  storageService = getIt.get<StorageService>(instanceName: '_task');
@override
final String table = "_task";

@override
  List<TaskModel> findAll() {
    List<dynamic> all = super.findAll();
   List<TaskModel> result =  all.map((item) => TaskModel.fromJson(item))
   .toList();
   result.sort( (a,b) => a.id!.compareTo(b.id!));
    return result;
  }
}