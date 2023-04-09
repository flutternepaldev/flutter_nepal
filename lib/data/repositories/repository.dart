import '../api/api.dart';

class Repository {
  Repository({required this.authApi, required this.othersApi});

  final AuthApi authApi;
  final OthersApi othersApi;
}
