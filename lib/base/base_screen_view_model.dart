import 'package:flutter/material.dart';

import 'base_screen_stateful_widget.dart';

class BaseScreenViewModel with ViewNavigatorMixin {
  bool _isLoading = false;

  BaseState? _baseState;

  bool get isLoading => _isLoading;

  BaseState? get baseState => _baseState;

  bool get hasContext => activeContext != null;

  BuildContext? get activeContext {
    final isMounted = baseState?.mounted ?? false;

    final BuildContext? context = !isMounted ? null : baseState?.context;

    return context;
  }

  Map<dynamic, dynamic> get viewArguments {
    return baseState!.arguments;
  }

  void setBaseState(BaseState value) {
    _baseState = value;
  }

  void toast(String message) {
    _baseState?.toast(message);
  }

  void setLoading() {
    refreshView(isLoading: true);
  }

  void setReady() {
    refreshView(isLoading: false);
  }

  void refreshView({bool? isLoading}) {
    debugPrint('refreshView(), isLoading: $isLoading');

    if (isLoading != null) {
      _isLoading = isLoading;
    }

    // Warning: this is null on Dev env. Hot Reload
    if (_baseState != null && _baseState!.mounted) {
      _baseState!.refreshView();
    }
  }
}

mixin ViewNavigatorMixin {
  Future<void> pushNamed(
      BuildContext context,
      String routeName, [
        Map<dynamic, dynamic> arguments = const {},
      ]) async {
    await Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}
