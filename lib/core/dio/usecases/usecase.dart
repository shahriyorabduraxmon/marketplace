import 'package:equatable/equatable.dart';
import 'package:marketplace/core/dio/exceptions/failures.dart';
import 'package:marketplace/core/dio/utils/either.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
