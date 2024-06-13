import 'package:ryc_desafio_do_modulo_basico/core/models/user.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/generic.repository.dart';

class  UserRepository extends GenericRepository<UserModel>{

@override
final String table = "_user";

}