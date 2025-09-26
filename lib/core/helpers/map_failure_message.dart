import '../errors/failures.dart';

String mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      print('Server Failure: ${failure.message}');
      return 'Server Error: ${failure.message}';
    } else if (failure is NetworkFailure) {
      print('Network Failure: ${failure.message}');
      return 'Network Error: ${failure.message}';
    } else {
      print('Unknown Failure: ${failure.message}');
      return 'Unknown Error: ${failure.message}';
    }
  }