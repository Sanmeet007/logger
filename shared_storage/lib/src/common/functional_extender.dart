extension FunctionalExtender<T> on T? {
  /// ```dart
  /// final String? myNullableVar = ...
  ///
  /// // Really annoying repetitive condition
  /// if (myNullableVar != null) return null;
  ///
  /// return doSomethingElseWith(myNullableVar);
  /// ```
  ///
  /// This extension allow an alternative usage:
  /// ```
  /// final String? myNullableVar = ...
  ///
  /// return myNullableVar?.apply((m) => doSomethingElseWith(m));
  /// ```
  R? apply<R>(R Function(T) f) {
    // Local variable to allow automatic type promotion.  Also see:
    // <https://github.com/dart-lang/language/issues/1397>
    final T? self = this;

    return self == null ? null : f(self);
  }

  T? takeIf(bool Function(T) f) {
    final T? self = this;

    if (self == null) {
      return null;
    }

    if (f(self)) {
      return self;
    }

    return null;
  }
}

const willbemovedsoon = Deprecated(
  'This method will be moved to another package in a next release.\nBe aware this method will not be removed but moved to another module outside of [saf].',
);
