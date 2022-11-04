import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../models/error_response.dart';
import '../models/pokemon/pokemon.dart';
import '../models/pokemon/pokemon_request.dart';
import '../models/pokemon/pokemon_response.dart';
import '../models/pokemon/pokemon_species.dart';
import '../models/pokemon/pokemon_species_holder.dart';
import '../models/pokemon/sprite.dart';
import '../models/pokemon/sprite_response.dart';
import '../models/pokemon/type_data.dart';
import '../models/pokemon/type_data_holder.dart';
import 'date_time_serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  ErrorResponse,
  Pokemon,
  TypeDataHolder,
  PokemonRequest,
  PokemonResponse,
  PokemonSpeciesHolder,
  PokemonSpecies,
  TypeDataHolder,
  TypeData,
  Sprite,
  SpriteResponse,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
