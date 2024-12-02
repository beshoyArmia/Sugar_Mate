abstract class failure {
  final String message;

  failure(this.message);
}

class ServerFailure extends failure {
  ServerFailure(super.message);
}
