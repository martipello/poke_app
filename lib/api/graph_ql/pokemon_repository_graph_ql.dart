import 'package:graphql/client.dart';

import '../models/pokemon/pokemon_request.dart';
import '../models/pokemon/pokemon_response.dart';
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

    final options = QueryOptions(
      document: gql(
        """
          query samplePokeAPIquery {
            pokemon_v2_pokemon(where: {
              pokemon_v2_pokemontypes: {
                type_id: {_in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
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
                pokemon_v2_pokemonsprites {
                  sprites
                }
              }
          }
      """,
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
