import 'package:ryc_desafio_do_modulo_basico/core/repository/generic.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service/storage.service.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
class  UserRepository extends GenericRepository{

@override
final  storageService = getIt.get<StorageService>(instanceName: '_user');
@override
final String table = "_user";

}