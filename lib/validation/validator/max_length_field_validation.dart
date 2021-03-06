import 'package:equatable/equatable.dart';

import '../../presentation/protocol/protocol.dart' show ValidationError;
import '../protocol/protocol.dart';

class MaxLengthFieldValidation extends Equatable implements FieldValidation {
  MaxLengthFieldValidation({required this.field, required this.maxLength});

  final String field;
  final int maxLength;

  @override
  List<Object> get props => [field];

  @override
  ValidationError? validate(Map input) {
    if (input[field] != null &&
        input[field].trim().isNotEmpty &&
        input[field].length <= maxLength) return null;
    return ValidationError.invalidField;
  }
}
