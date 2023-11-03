class Failure{
  final String failureMessage;
  const Failure({this.failureMessage=""});
}

class ErrorMessage extends Failure{
  ErrorMessage({required super.failureMessage});
}
