import 'package:graphql/client.dart';

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
    final _graphQlClient = graphQlClient.getClient();

    final typeIds = pokemonRequest.pokemonTypes.isNotEmpty
        ? pokemonRequest.pokemonTypes.map(
            (p0) => p0.id,
          )
        : PokemonType.values.map(
            (e) => e.id,
          );
    final options = QueryOptions(
      document: gql(
        """
          query pokemonQuery {
            pokemon_v2_pokemon(where: {
              pokemon_v2_pokemontypes: {
                type_id: {
                  _in: ${typeIds.toList()}
                }, 
              pokemon_v2_pokemon: {
                name: {
                  _like: "%${pokemonRequest.search ?? ''}%"}
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
      """,
      ),
    );

    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonInfo(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = graphQlClient.getClient();
    final options = QueryOptions(
      document: gql(
        '''
        query pokemonInfoQuery {
           pokemon_v2_pokemon(where: {id: {_eq: ${pokemonRequest.pokemonId}}}) {
             id
             pokemon_species_id
             name
             height
             base_experience
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
                 name
               }
               pokemon_v2_pokemonhabitat {
                 name
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
      ''',
      ),
    );

    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonStatsWeaknessAndResistance(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = graphQlClient.getClient();
    final options = QueryOptions(
      document: gql(
        '''
          query statsWeaknessResistanceQuery {
            pokemon_v2_pokemon(where: {id: {_eq: 1}}) {
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
      ''',
      ),
    );

    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonEvolutions(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = graphQlClient.getClient();
    final options = QueryOptions(
      document: gql(
        '''
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
      }
    }
  }
}

      ''',
      ),
    );

    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonForms(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = graphQlClient.getClient();
    final options = QueryOptions(
      document: gql(
        '''
query MyQuery {
  pokemon_v2_pokemon(where: {id: {_eq: 666}}) {
    id
    pokemon_v2_pokemonforms {
      form_name
      is_mega
      is_default
      is_battle_only
      form_order
      pokemon_id
      order
      name
      pokemon_v2_pokemon {
        id
        pokemon_v2_encounters {
          location_area_id
          max_level
          min_level
          pokemon_v2_locationarea {
            name
          }
        }
      }
    }
  }
}
      ''',
      ),
    );

    return _graphQlClient.query(options);
  }

  Future<QueryResult<dynamic>> getPokemonMoves(
    PokemonRequest pokemonRequest,
  ) async {
    final _graphQlClient = graphQlClient.getClient();
    final options = QueryOptions(
      document: gql(
        '''
query MyQuery {
  pokemon_v2_pokemon(where: {id: {_eq: 1}}) {
    id
    pokemon_v2_pokemonmoves(distinct_on: id) {
      id
      level
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
          pokemon_v2_movedamageclass {
            pokemon_v2_movedamageclassdescriptions(where: {language_id: {_eq: 9}}) {
              pokemon_v2_movedamageclass {
                name
                id
              }
            }
          }
          id
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
        }
        id
        pokemon_v2_machines {
          machine_number
          pokemon_v2_versiongroup {
            name
          }
        }
      }
      pokemon_v2_movelearnmethod {
        name
        pokemon_v2_movelearnmethodnames(where: {language_id: {_eq: 9}}) {
          id
          name
        }
      }
    }
  }
}

        ''',
      ),
    );

    return _graphQlClient.query(options);
  }

  Future<QueryResult<Object?>> fetchMore(
    QueryOptions originalOptions,
    QueryResult previousResult,
  ) {
    return graphQlClient.getClient().fetchMore(
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
}
