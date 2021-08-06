import 'package:equatable/equatable.dart';
import 'package:zeitplan/domain/entity/entity.dart';

class RemotePhoneModel extends Equatable {
  final String? number, ddd, kind;

  RemotePhoneModel({required this.number, this.ddd, this.kind});

  @override
  List<Object?> get props => [number];

  PhoneEntity toEntity() {
    return PhoneEntity(number: number, ddd: ddd, kind: kind ?? "PHONE");
  }
}
