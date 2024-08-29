import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../models/error_response.dart';
import '../models/news/article.dart';
import '../models/news/news_response.dart';
import '../models/news/source.dart';
import '../models/pokemon/cry.dart';
import '../models/pokemon/damage_type.dart';
import '../models/pokemon/encounter.dart';
import '../models/pokemon/encounter_method.dart';
import '../models/pokemon/encounter_slot.dart';
import '../models/pokemon/evolution.dart';
import '../models/pokemon/evolution_chain_holder.dart';
import '../models/pokemon/evolution_holder.dart';
import '../models/pokemon/gen_type.dart';
import '../models/pokemon/machine.dart';
import '../models/pokemon/move_learn_method.dart';
import '../models/pokemon/move_metum.dart';
import '../models/pokemon/pokemon.dart';
import '../models/pokemon/pokemon_ability.dart';
import '../models/pokemon/pokemon_ability_holder.dart';
import '../models/pokemon/pokemon_cries.dart';
import '../models/pokemon/pokemon_form.dart';
import '../models/pokemon/pokemon_form_holder.dart';
import '../models/pokemon/pokemon_form_with_version_group.dart';
import '../models/pokemon/pokemon_move.dart';
import '../models/pokemon/pokemon_move_holder.dart';
import '../models/pokemon/pokemon_request.dart';
import '../models/pokemon/pokemon_resource.dart';
import '../models/pokemon/pokemon_response.dart';
import '../models/pokemon/pokemon_species.dart';
import '../models/pokemon/pokemon_species_holder.dart';
import '../models/pokemon/pokemon_stat.dart';
import '../models/pokemon/pokemon_type.dart';
import '../models/pokemon/sprite.dart';
import '../models/pokemon/sprite_response.dart';
import '../models/pokemon/stat.dart';
import '../models/pokemon/type_data.dart';
import '../models/pokemon/type_data_holder.dart';
import '../models/pokemon/type_efficacies.dart';
import 'date_time_serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  Article,
  Cry,
  DamageType,
  Encounter,
  EncounterMethod,
  EncounterSlot,
  ErrorResponse,
  Evolution,
  EvolutionChainHolder,
  EvolutionHolder,
  GenType,
  Machine,
  MoveLearnMethod,
  MoveMetum,
  NewsResponse,
  Pokemon,
  PokemonAbility,
  PokemonAbilityHolder,
  PokemonCries,
  PokemonForm,
  PokemonFormHolder,
  PokemonFormWithVersionGroup,
  PokemonMove,
  PokemonMoveHolder,
  PokemonRequest,
  PokemonResource,
  PokemonResponse,
  PokemonSpeciesHolder,
  PokemonSpecies,
  PokemonStat,
  PokemonType,
  Source,
  Sprite,
  SpriteResponse,
  Stat,
  TypeDataHolder,
  TypeData,
  TypeEfficacies,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
