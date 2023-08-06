
abstract class Resource<T> {

  Resource(this.data, this.message);

  final T data;
  final String message;

  void when({
    required void Function(String message, T data) success,
    required void Function(String message, T data) failure,
  }) {
    if (this is Success) {
      success(message, data);
    } else if (this is Failure) {
      failure(message, data);
    }
  }
}

class Success<T> extends Resource<T> {
  Success(String message, T data) : super(data, message);
}

class Failure<T> extends Resource<T> {
  Failure(String message, T data) : super(data, message);
}
