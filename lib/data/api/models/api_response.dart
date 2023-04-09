class ApiResponse<T> {
  ApiResponse({
    this.statusCode,
    this.statusMessage,
    this.data,
    this.tokenExpired = false,
    this.success,
    this.error,
    this.result
  });
  final int? statusCode;
  final String? statusMessage;
  final bool? tokenExpired;
  final T? data;
  final int? success;
  final String? error;
  final String? result;
}
