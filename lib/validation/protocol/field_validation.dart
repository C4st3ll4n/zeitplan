import '../../presentation/protocol/protocol.dart';

abstract class FieldValidation {
  String get field;
  ValidationError? validate(Map input);
}
