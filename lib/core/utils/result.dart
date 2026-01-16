/// Result Type - Functional Error Handling Pattern
///
/// A sealed class that represents either a success or failure outcome.
/// This pattern eliminates the ambiguity of null/exception-based error handling
/// and makes error states explicit and composable.
///
/// ## Usage
/// ```dart
/// Future<Result<User, String>> fetchUser(int id) async {
///   try {
///     final user = await api.getUser(id);
///     return Success(user);
///   } catch (e) {
///     return Failure('Failed to fetch user: $e');
///   }
/// }
///
/// final result = await fetchUser(123);
/// result.when(
///   success: (user) => print('Got user: ${user.name}'),
///   failure: (error) => print('Error: $error'),
/// );
/// ```
library;

/// Sealed Result type for explicit success/failure handling.
///
/// [S] - Success value type
/// [E] - Error value type
sealed class Result<S, E> {
  const Result();

  /// Returns true if this is a [Success] result.
  bool get isSuccess => this is Success<S, E>;

  /// Returns true if this is a [Failure] result.
  bool get isFailure => this is Failure<S, E>;

  /// Get the success value, or null if this is a failure.
  S? get valueOrNull => switch (this) {
        Success(:final value) => value,
        Failure() => null,
      };

  /// Get the error value, or null if this is a success.
  E? get errorOrNull => switch (this) {
        Success() => null,
        Failure(:final error) => error,
      };

  /// Pattern match on the result.
  ///
  /// Both [success] and [failure] callbacks must be provided.
  T when<T>({
    required T Function(S value) success,
    required T Function(E error) failure,
  }) {
    return switch (this) {
      Success(:final value) => success(value),
      Failure(:final error) => failure(error),
    };
  }

  /// Map the success value to a new type.
  Result<T, E> map<T>(T Function(S value) transform) {
    return switch (this) {
      Success(:final value) => Success(transform(value)),
      Failure(:final error) => Failure(error),
    };
  }

  /// Map the error value to a new type.
  Result<S, T> mapError<T>(T Function(E error) transform) {
    return switch (this) {
      Success(:final value) => Success(value),
      Failure(:final error) => Failure(transform(error)),
    };
  }

  /// FlatMap (bind) the success value to a new Result.
  Result<T, E> flatMap<T>(Result<T, E> Function(S value) transform) {
    return switch (this) {
      Success(:final value) => transform(value),
      Failure(:final error) => Failure(error),
    };
  }

  /// Get the success value or a default.
  S getOrElse(S defaultValue) {
    return switch (this) {
      Success(:final value) => value,
      Failure() => defaultValue,
    };
  }

  /// Get the success value or compute a default from the error.
  S getOrElseCompute(S Function(E error) compute) {
    return switch (this) {
      Success(:final value) => value,
      Failure(:final error) => compute(error),
    };
  }
}

/// Represents a successful result containing a value.
final class Success<S, E> extends Result<S, E> {
  /// The success value.
  final S value;

  /// Creates a success result with the given [value].
  const Success(this.value);

  @override
  String toString() => 'Success($value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<S, E> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

/// Represents a failed result containing an error.
final class Failure<S, E> extends Result<S, E> {
  /// The error value.
  final E error;

  /// Creates a failure result with the given [error].
  const Failure(this.error);

  @override
  String toString() => 'Failure($error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<S, E> &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}

/// Extension for wrapping async operations in Result.
extension ResultFuture<S> on Future<S> {
  /// Wraps a Future in a Result, catching any exceptions as Failure.
  Future<Result<S, E>> toResult<E>(E Function(Object error) onError) async {
    try {
      return Success(await this);
    } catch (e) {
      return Failure(onError(e));
    }
  }
}

/// Convenient type alias for Result with String error.
typedef StringResult<S> = Result<S, String>;

/// Convenient type alias for Result<void, String> (operation success/failure).
typedef OperationResult = Result<void, String>;
