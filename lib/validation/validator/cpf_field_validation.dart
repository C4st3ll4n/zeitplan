import 'package:equatable/equatable.dart';

import '../../presentation/protocol/protocol.dart';
import '../protocol/protocol.dart';

class CPFFieldValidation extends Equatable implements FieldValidation {
  final String field;

  CPFFieldValidation(this.field);

  @override
  ValidationError? validate(Map<dynamic, dynamic> input) {
    final regex = RegExp(
        r"([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})");

    final isValid =
        input[field]?.isNotEmpty != true || regex.hasMatch(input[field]);

    return isValid ? null : ValidationError.invalidField;
  }

  @override
  List<Object?> get props => [field];
}
