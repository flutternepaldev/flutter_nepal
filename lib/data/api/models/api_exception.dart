///This class is created to customize [Exception] class.
class ApiException implements Exception {
  ///This creates new instance of [ApiException]
  ApiException(this.message, {this.tokenExpired = false});

  ///The message is of type [dyanamic] which takes what ever error object is
  ///passed.
  final dynamic message;
  final bool? tokenExpired;

  @override
  String toString() {
    if (message is String) {
      return message;
    }
    return 'Error occured: $message';
  }
}
