class ExitCommandException implements Exception {
  final int signal;

  const ExitCommandException(this.signal);
}
