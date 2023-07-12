import 'package:flutter/material.dart';

import 'base_screen_stateful_widget.dart';

class BaseScreenViewModel {
  BaseScreenViewModel();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  BaseState? _baseState;

  BaseState? get baseState => _baseState;

  void setBaseState(BaseState value) {
    _baseState = value;
  }

  // Assume true from instantiation, let async network calls first check/verify
  bool hasInternet = true;

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
    if (_baseState != null) {
      _baseState!.refreshView();
    }
  }
}
