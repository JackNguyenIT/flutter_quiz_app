import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

/// This class will be used as a Delegate (mixin) for BlocBase's sub-classes
///
/// It provides some methods to adding and disposing multiple
/// [StreamSubscription]s automatically.
mixin BlocScope<State> on BlocBase<State> {
  /// A [CompositeSubscription] can contains multiple [StreamSubscription]s.
  ///
  /// This variable will be cancelled [CompositeSubscription.dispose] if
  /// this [BlocBase] is closed
  final CompositeSubscription _subscriptions = CompositeSubscription();

  /// Adds new subscription to the [_subscriptions] composite.
  ///
  /// Throws an exception if the [_subscriptions] was disposed
  void addSubscription<T>(StreamSubscription<T> subscription) {
    _subscriptions.add(subscription);
  }

  /// Converts Future to Stream to get a StreamSubscription from it,
  /// which will add to [_subscriptions]
  void runFutureOnScope<T>(Future<T> future) {
    final sub = future.asStream().listen(null);
    addSubscription(sub);
  }

  /// Closes the instance.
  /// This method should be called when the instance is no longer needed.
  /// Once [close] is called, the instance can no longer be used.
  @override
  Future<void> close() async {
    await _subscriptions.dispose();
    await super.close();
  }
}
