import 'package:flutter/widgets.dart';

import 'package:meta/meta.dart';

@immutable
abstract class DataState {}

class Initial extends DataState {}

class Loading extends DataState {}

class Success extends DataState {}
