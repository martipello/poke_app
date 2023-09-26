import 'package:graphql/client.dart';

import '../../utils/console_output.dart';
import '../models/pokemon/damage_type.dart';
import '../models/pokemon/gen_type.dart';
import '../models/pokemon/pokemon_request.dart';
import '../models/pokemon/pokemon_response.dart';
import '../models/pokemon/pokemon_type.dart';
import 'graph_ql_client.dart';

class PokemonRepositoryGraphQl {
  PokemonRepositoryGraphQl(
    this.graphQlClient,
  );

  final GraphQlClient graphQlClient;

  Future<QueryResult<dynamic>> getPokemon(
    PokemonRequest pokemonRequest,
  ) async {
    //TODO this should be calling fetch more
    final _graphQlClient = await graphQlClient.getClient();
    final _pokemonDocument = _createGetPokemonDocument(pokemonRequest);
    final options = QueryOptions(
      document: gql(
        _pokemonDocument,
      ),
    );
    log('QUERY').d('GET POKEMONS $_pokemonDocument');
    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonInfo(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = await graphQlClient.getClient();
    final pokemonInfoDocument = _createPokemonInfoDocument(pokemonRequest);
    final options = QueryOptions(
      document: gql(pokemonInfoDocument),
    );
    log('QUERY').d('GET POKEMON INFO $pokemonInfoDocument');
    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonStatsWeaknessAndResistance(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = await graphQlClient.getClient();
    final pokemonStatsWeaknessAndResistanceDocument = _createPokemonStatsWeaknessAndResistanceDocument(pokemonRequest);
    final options = QueryOptions(
      document: gql(pokemonStatsWeaknessAndResistanceDocument),
    );
    log('QUERY').d('GET POKEMON WEAKNESS RESISTANCE $pokemonStatsWeaknessAndResistanceDocument');
    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonEvolutions(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = await graphQlClient.getClient();
    final pokemonEvolutionsDocument = _createPokemonEvolutionsDocument(pokemonRequest);
    final options = QueryOptions(
      document: gql(pokemonEvolutionsDocument),
    );
    log('QUERY').d('GET POKEMON EVOLUTIONS $pokemonEvolutionsDocument');
    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonForms(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = await graphQlClient.getClient();
    final pokemonFormsDocument = _createPokemonFormsDocument(pokemonRequest);
    final options = QueryOptions(
      document: gql(pokemonFormsDocument),
    );
    log('QUERY').d('GET POKEMON FORMS $pokemonFormsDocument');
    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonMoves(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = await graphQlClient.getClient();
    final pokemonMoveDocument = _createPokemonMoveDocument(pokemonRequest);
    final options = QueryOptions(
      document: gql(
        pokemonMoveDocument,
      ),
    );
    log('QUERY').d('GET POKEMON FORMS $pokemonMoveDocument');
    return _graphQlClient.query(options);
  }

  Future<QueryResult<Object?>> fetchMore(
    QueryOptions originalOptions,
    QueryResult previousResult,
  ) async {
    final _graphQlClient = await graphQlClient.getClient();
    return _graphQlClient.fetchMore(
      fetchMoreOptions,
      originalOptions: originalOptions,
      previousResult: previousResult,
    );
  }

  FetchMoreOptions get fetchMoreOptions => FetchMoreOptions.partial(
        updateQuery: (previousResultData, fetchMoreResultData) {
          try {
            final _previousResultData = PokemonResponse.fromJson(previousResultData!);
            final _fetchMoreResultData = PokemonResponse.fromJson(fetchMoreResultData!);
            return PokemonResponse(
              (b) => b.pokemon_v2_pokemon.addAll(
                [
                  ..._previousResultData.pokemon_v2_pokemon,
                  ..._fetchMoreResultData.pokemon_v2_pokemon,
                ],
              ),
            ).toJson();
          } catch (e) {
            //TODO handle error
            return null;
          }
        },
      );

  String _createGetPokemonDocument(PokemonRequest pokemonRequest) {
    final typeIds = pokemonRequest.pokemonTypes.isNotEmpty
        ? pokemonRequest.pokemonTypes.map(
            (p0) => p0.id,
          )
        : PokemonType.filters.map(
            (e) => e.id,
          );
    final genTypeIds = pokemonRequest.genTypes.isNotEmpty
        ? pokemonRequest.genTypes.map(
            (p0) => p0.id,
          )
        : GenType.filters.map(
            (e) => e.id,
          );
    final id = pokemonRequest.search?.replaceAll(RegExp(r'[^0-9]'), '');
    final isIdSearch = id?.isNotEmpty == true;
    final search = isIdSearch ? 'id: {_eq: $id}' : 'name: {_like: "%${pokemonRequest.search ?? ''}%"}';
    return '''
        query pokemonQuery {
          pokemon_v2_pokemon(where: {
            pokemon_v2_pokemontypes: {
              type_id: {
                _in: ${typeIds.toList()}
              }, 
            pokemon_v2_pokemon: {
                $search
              }
            }, 
            pokemon_v2_pokemonspecy: {
              generation_id: {
                _in: ${genTypeIds.toList()}
                }
              }
          }, order_by: {
              id: asc
            }, 
            limit: ${pokemonRequest.limit ?? 0}, 
            offset: ${pokemonRequest.skip ?? 0},
          ) {
            id
            name
            pokemon_v2_pokemontypes {
              type_id
              pokemon_v2_type {
                id
                name
              }
            }
            pokemon_v2_pokemonspecy {
              evolution_chain_id
            }
            pokemon_v2_pokemonsprites {
              sprites
            }
            pokemon_v2_pokemonspecy {
              pokemon_v2_pokemonspeciesnames(
                where: {
                  language_id: {
                    _eq: ${pokemonRequest.languageId}
                  }
                }
              ) {
                  genus
                }
                generation_id
              }
              height
              weight
            }
        }
    ''';
  }

  String _createPokemonInfoDocument(PokemonRequest pokemonRequest) {
    return '''
      query pokemonInfoQuery {
         pokemon_v2_pokemon(where: {id: {_eq: ${pokemonRequest.pokemonId}}}) {
           id
           pokemon_species_id
           name
           height
           base_experience
           pokemon_v2_encounters(order_by: {version_id: asc}) {
             max_level
             min_level
             pokemon_v2_version {
               name
               id
               version_group_id
             }
             id
             location_area_id
             encounter_slot_id
             version_id
             pokemon_v2_locationarea {
               id
               name
               game_index
             }
             pokemon_v2_encounterslot {
               rarity
               pokemon_v2_encountermethod {
                 pokemon_v2_encountermethodnames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
                   name
                 }
               }
               encounter_method_id
               id
             }
           }        
           pokemon_v2_pokemonspecy {
             base_happiness
             capture_rate
             evolution_chain_id
             is_baby
             is_legendary
             is_mythical
             pokemon_v2_pokemonspeciesnames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
               id
               genus
               name
               pokemon_species_id
             }
             pokemon_v2_pokemonspeciesflavortexts(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
               flavor_text
               version_id
               pokemon_v2_version {
                  name,
                  pokemon_v2_versiongroup {
                    name
                  }
                }
             }
             forms_switchable
             hatch_counter
             pokemon_v2_pokemonshape {
               pokemon_v2_pokemonshapenames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
                 name
               }
             }
             pokemon_v2_pokemonhabitat {
               pokemon_v2_pokemonhabitatnames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
                 id
                 name
               }
             }
             gender_rate
             pokemon_v2_pokemonegggroups {
               pokemon_v2_egggroup {
                 name
               }
             }
             pokemon_v2_pokemoncolor {
               name
             }
             evolves_from_species_id
           }
           weight
           pokemon_v2_pokemonforms {
             name
             is_mega
             is_default
             is_battle_only
             form_name
             pokemon_id
           }
           pokemon_v2_pokemonabilities {
             is_hidden
             pokemon_v2_ability {
               generation_id
               is_main_series
               name
               pokemon_v2_abilityflavortexts(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
                  flavor_text
                  pokemon_v2_versiongroup {
                    name
                  }
               }
               pokemon_v2_abilityeffecttexts(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
                id
                short_effect
                pokemon_v2_ability {
                  generation_id
                }
              }
             }
           }
         }
       }
    ''';
  }

  String _createPokemonStatsWeaknessAndResistanceDocument(PokemonRequest pokemonRequest) {
    return '''
        query statsWeaknessResistanceQuery {
          pokemon_v2_pokemon(where: {id: {_eq: ${pokemonRequest.pokemonId}}}) {
            pokemon_v2_pokemonstats {
              base_stat
              effort
              stat_id
              pokemon_v2_stat {
                name
                move_damage_class_id
                is_battle_only
                game_index
              }
            }
            pokemon_v2_pokemontypes {
              id
              pokemon_v2_type {
                name
                pokemonV2TypeefficaciesByTargetTypeId {
                  damage_factor
                  damage_type_id
                  pokemon_v2_type {
                    name
                  }
                  target_type_id
                }
              }
            }
          }
        }
    ''';
  }

  String _createPokemonEvolutionsDocument(PokemonRequest pokemonRequest) {
    return '''
query MyQuery {
pokemon_v2_evolutionchain(where: {pokemon_v2_pokemonspecies: {pokemon_v2_pokemons: {id: {_eq: ${pokemonRequest.pokemonId}}}}}) {
  id
  pokemon_v2_pokemonspecies {
    base_happiness
    capture_rate
    evolution_chain_id
    evolves_from_species_id
    forms_switchable
    gender_rate
    is_baby
    hatch_counter
    is_legendary
    is_mythical
    name
    pokemon_v2_pokemonevolutions {
      needs_overworld_rain
      min_level
      min_happiness
      min_beauty
      min_affection
      location_id
      pokemon_v2_evolutiontrigger {
        name
        pokemon_v2_evolutiontriggernames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
          id
          name
        }
      }
      turn_upside_down
      trade_species_id
      time_of_day
      relative_physical_stats
      pokemon_v2_location {
        name
        pokemon_v2_region {
          name
        }
      }
      pokemon_v2_item {
        name
      }
      known_move_id
      known_move_type_id
      held_item_id
      gender_id
      pokemonV2ItemByHeldItemId {
        name
      }
    }
    pokemon_v2_pokemonspeciesnames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
      genus
    }
    pokemon_v2_pokemons {
      name
      pokemon_v2_pokemontypes {
        pokemon_v2_type {
          name
          id
        }
      }
      id
      weight
      height
      base_experience
      is_default 
      pokemon_v2_pokemonspecy {
        generation_id
      }    
    }
    generation_id
  }
}
}
    ''';
  }

  String _createPokemonFormsDocument(PokemonRequest pokemonRequest) {
    return '''
query MyQuery {
pokemon_v2_pokemon(where: {id: {_eq: ${pokemonRequest.pokemonId}}}) {
  id
  pokemon_v2_pokemonspecy {
    pokemon_v2_pokemons {
      pokemon_v2_pokemonforms {
        pokemon_v2_versiongroup {
          name
          id
        }
        pokemon_v2_pokemonformnames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
          pokemon_v2_pokemonform {
            pokemon_v2_pokemonformgenerations {
              pokemon_v2_generation {
                name
              }
            }
            pokemon_v2_pokemon {
              pokemon_v2_pokemontypes {
                pokemon_v2_type {
                  name
                  id
                }
              }
              pokemon_v2_pokemonsprites(limit: 1) {
                sprites
              }
              weight
              height
              base_experience
              id
              is_default                
              pokemon_v2_pokemonabilities {
                pokemon_v2_ability {
                  name
                  pokemon_v2_abilityeffecttexts(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
                    short_effect
                  }
                  pokemon_v2_abilityflavortexts(where: {language_id: {_eq: ${pokemonRequest.languageId}}}, distinct_on: flavor_text) {
                    flavor_text
                  }
                  pokemon_v2_generation {
                    name
                  }
                }
              }
            }
            form_name
            form_order
            id
            is_battle_only
            is_default
            is_mega
            order
            pokemon_id
            pokemon_v2_pokemonformnames(where: {language_id: {_eq: ${pokemonRequest.languageId}}}) {
              pokemon_name
              name
            }
          }
        }
      }
    }
  }
}
}
    ''';
  }

  String _createPokemonMoveDocument(PokemonRequest pokemonRequest) {
    final typeIds = pokemonRequest.pokemonTypes.isNotEmpty
        ? pokemonRequest.pokemonTypes.map(
            (p0) => p0.id,
          )
        : PokemonType.filters.map(
            (e) => e.id,
          );
    final damageTypeIds = pokemonRequest.damageTypes.isNotEmpty
        ? pokemonRequest.damageTypes.map(
            (p0) => p0.id,
          )
        : DamageType.filters.map(
            (e) => e.id,
          );
    return '''
query MyQuery {
pokemon_v2_pokemon(where: {id: {_eq: ${pokemonRequest.pokemonId}}}) {
  id
  pokemon_v2_pokemonmoves(limit: ${pokemonRequest.limit}, offset: ${pokemonRequest.skip}, distinct_on: move_id, where: {pokemon_v2_move: {name: {_like: "%${pokemonRequest.search ?? ''}%"}, pokemon_v2_type: {id: {_in: ${typeIds.toList()}}, pokemon_v2_movedamageclass: {id: {_in: ${damageTypeIds.toList()}}}}}}) {
    id
    level
    pokemon_v2_movelearnmethod {
      name
      pokemon_v2_versiongroupmovelearnmethods {
        pokemon_v2_versiongroup {
          name
          id
        }
        pokemon_v2_movelearnmethod {
          name
          pokemon_v2_movelearnmethoddescriptions(where: {language_id: {_eq: ${pokemonRequest.languageId}}}, limit: 1) {
            description
          }
        }
      }
    }
    pokemon_v2_move {
      accuracy
      move_effect_chance
      name
      priority
      pp
      power
      super_contest_effect_id
      type_id
      pokemon_v2_type {
        name
        id
        pokemon_v2_movedamageclass {
          name
          id
        }
      }
      pokemon_v2_movemetum {
        crit_rate
        ailment_chance
        flinch_chance
        drain
        max_hits
        max_turns
        min_hits
        min_turns
        stat_chance
        pokemon_v2_movemetaailment {
          name
        }
        pokemon_v2_movemetacategory {
          name
        }
        healing
      }
      id
      pokemon_v2_machines(order_by: {version_group_id: asc}) {
        machine_number
        pokemon_v2_versiongroup {
          name
        }
      }
      pokemon_v2_moveflavortexts(where: {language_id: {_eq: ${pokemonRequest.languageId}}}, limit: 1, order_by: {version_group_id: desc}) {
        flavor_text
      }
    }
  }
}
}
      ''';
  }
}
