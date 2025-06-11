import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocalizedMessage {
  String getLocalizedMessage(BuildContext context);
}

abstract class Failure extends Equatable implements LocalizedMessage {
  const Failure();

  @override
  List<Object> get props => [];
}

class EmptyFailure extends Failure {
  const EmptyFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => '';
}

class ServerFailure extends Failure {
  final String? statusCode;

  const ServerFailure(this.statusCode) : super();

  @override
  List<Object> get props => [statusCode ?? ''];

  @override
  String getLocalizedMessage(BuildContext context) => ' $statusCode';
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => "Error";
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => "Error";
}

class GeneralFailure extends Failure {
  const GeneralFailure(this.error) : super();
  final String error;

  @override
  String getLocalizedMessage(BuildContext context) => error;
}
