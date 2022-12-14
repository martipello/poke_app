import 'package:graphql/client.dart';

class GraphQlClient {
  GraphQLClient getClient() {
    final _link = HttpLink(
      'https://beta.pokeapi.co/graphql/v1beta',
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
