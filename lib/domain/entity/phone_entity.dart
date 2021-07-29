import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  final String? number, ddd, kind;

  PhoneEntity({required this.number, required this.ddd, this.kind});

  @override
  List<Object?> get props => [number, ddd];
}
