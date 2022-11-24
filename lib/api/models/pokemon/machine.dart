import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'machine.g.dart';

abstract class Machine implements Built<Machine, MachineBuilder> {

  factory Machine([void Function(MachineBuilder) updates]) = _$Machine;
  Machine._();

  int? get machine_number;

  PokemonResource? get pokemon_v2_versiongroup;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Machine.serializer, this) as Map<String, dynamic>;
  }

  static Machine fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Machine.serializer, json)!;
  }

  static Serializer<Machine> get serializer => _$machineSerializer;
}