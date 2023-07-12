import 'package:flutter/material.dart';

import '../util/screen_scale_mixin.dart';

abstract class BaseStatelessWidget extends StatelessWidget with AppScaleMixin {
  BaseStatelessWidget({
    Key? key,
  }) : super(key: key);
}
