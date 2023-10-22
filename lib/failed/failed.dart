import 'package:equatable/equatable.dart';
import '../model/error_message_model.dart';

abstract class Failure extends Equatable  {

  final String message ;
  const Failure({
    required this.message
  } );
  @override
  // TODO: implement props
  List<Object?> get props => [
    message
  ];

}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

}
class DatabaseFailure extends Failure  {
  const DatabaseFailure({required super.message});

}

// for server
class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

// for local
class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}
