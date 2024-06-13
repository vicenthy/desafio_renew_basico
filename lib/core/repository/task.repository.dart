import 'package:ryc_desafio_do_modulo_basico/core/models/task.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/generic.repository.dart';

class  TaskRepository extends GenericRepository<TaskModel> {
@override
final String table = "_task";

}