import 'package:flutter/material.dart';

import '../util/screen_scale_mixin.dart';
import 'base_screen_view_model.dart';

// ignore: must_be_immutable
class BaseScreenStatefulWidget extends StatefulWidget {
  BaseScreenStatefulWidget(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  BaseScreenViewModel viewModel;

  // BaseScreenViewModel get viewModel => _viewModel;

  @override
  BaseState createState() => BaseState();
}

class BaseState<C extends BaseScreenViewModel,
    T extends BaseScreenStatefulWidget> extends State<T> with AppScaleMixin {
  C get viewModel => widget.viewModel as C;

  // Default implementation is nec. since abstract class cannot be instantiated
  @override
  Widget build(BuildContext context) => const Scaffold();

  void _setViewModelBaseState() {
    widget.viewModel.setBaseState(this);
  }

  @override
  void initState() {
    _setViewModelBaseState();
    super.initState();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    debugPrint('didUpdateWidget()');

    widget.viewModel = oldWidget.viewModel;

    // This should never be true now
    if (viewModel.baseState == null) {
      debugPrint('_setViewModelBaseState()');

      _setViewModelBaseState();
    }

    super.didUpdateWidget(oldWidget);
  }

  void refreshView() {
    setState(() {});
  }

      void showSnackBar(
        String message, {
        bool isSuccess = true,
        Color? color,
      }) {
        final backgroundColor =
            color ?? (isSuccess ? Colors.green[600] : Colors.red[600]);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: backgroundColor,
            content: Text(
              message,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      }

    void showTopSnackBar(
      String message, {
      bool isSuccess = true,
      Color? color,
      Duration? duration,
    }) {
      final backgroundColor =
          color ?? (isSuccess ? Colors.green[600] : Colors.red[600]);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration ?? const Duration(milliseconds: 500),
          backgroundColor: Colors.transparent,
          content: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      );
    }
}
