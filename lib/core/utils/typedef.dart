import 'package:dartz/dartz.dart';
import 'package:project1/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
