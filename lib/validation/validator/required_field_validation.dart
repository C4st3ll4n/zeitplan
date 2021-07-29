import 'package:equatable/equatable.dart';

import '../../presentation/protocol/protocol.dart';
import '../protocol/protocol.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  RequiredFieldValidation(this.field);

  final String field;

  @override
  ValidationError? validate(Map input) {
    return input[field]?.isNotEmpty == true
        ? null
        : ValidationError.requiredField;
  }

  @override
  List<Object> get props => [field];
}
