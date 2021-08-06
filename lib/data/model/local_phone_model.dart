import 'package:equatable/equatable.dart';
import 'package:zeitplan/domain/entity/entity.dart';

class LocalPhoneModel extends Equatable {
  final String? number, ddd, kind;

  LocalPhoneModel({required this.number, this.ddd, this.kind});

  @override
  List<Object?> get props => [number];

  PhoneEntity toEntity() {
    return PhoneEntity(number: number, ddd: ddd ?? "", kind: kind ?? "PHONE");
  }

  Map<String, String> toJson() => {
        "number": this.number!,
        "ddd": this.ddd ?? "",
        "kind": this.kind ?? "PHONE",
      };

  factory LocalPhoneModel.fromEntity(PhoneEntity e) =>
      LocalPhoneModel(number: e.number, ddd: e.ddd, kind: e.kind);
}
