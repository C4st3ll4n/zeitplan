import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(ZeitplanApp());
}
