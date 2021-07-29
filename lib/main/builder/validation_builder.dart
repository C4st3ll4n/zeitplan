import '../../validation/protocol/protocol.dart';
import '../../validation/validator/validator.dart';

class ValidationBuilder {
  static late ValidationBuilder _instance;
  late String fieldName;
  List<FieldValidation> validations = [];

  ValidationBuilder._();

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._();
    _instance.fieldName = fieldName;
    return _instance;
  }

  List<FieldValidation> build() => validations;

  ValidationBuilder email() {
    validations.add(EmailValidation(_instance.fieldName));
    return this;
  }

  ValidationBuilder min({int minLength = 3}) {
    validations.add(MinLengthFieldValidation(
        field: _instance.fieldName, minLength: minLength));
    return this;
  }

  ValidationBuilder max({int maxLength = 8}) {
    validations.add(MaxLengthFieldValidation(
        field: _instance.fieldName, maxLength: maxLength));
    return this;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(_instance.fieldName));
    return this;
  }

  ValidationBuilder cpf(String cpf) {
    validations.add(CPFFieldValidation(_instance.fieldName));
    return this;
  }

  ValidationBuilder phone(String phone) {
    validations.add(PhoneFieldValidation(_instance.fieldName));
    return this;
  }
}
