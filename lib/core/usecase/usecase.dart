
import '../either/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Exception, Type>> call(Params param);
}

class NoParams {}