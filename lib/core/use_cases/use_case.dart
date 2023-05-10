import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<DataType, Parameter> {
  Future<Either<Failure, DataType>> execute([Parameter parameter]);
}

class NoParameter {}
