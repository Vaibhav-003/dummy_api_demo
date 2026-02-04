/// Base class for all custom application exceptions.
///
/// This class implements [Exception] and provides a standard format for error messages
/// consisting of a [prefix] and a [message].
class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

/// Exception thrown when there is a problem fetching data (e.g. network connectivity).
class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, "Error During Communication: ");
}

/// Exception thrown when the server returns a 400 Bad Request response.
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

/// Exception thrown when the user is not authorized to access the resource (401/403).
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "Unauthorized: ");
}

/// Exception thrown when the input provided is invalid.
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

/// Exception thrown when the server returns a 500 Internal Server Error.
class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Server Error: ");
}

/// General exception for other network-related errors.
class NetworkException extends AppException {
  NetworkException([String? message]) : super(message, "Network Error: ");
}
