import '../api/models/pokemon/pokemon.dart';

extension PokemonExtension on Pokemon? {
  String pokemonHeight(){
    final height = this?.height ?? 0;
    if(height <= 0) {
      return '? cm';
    } else {
      if(height * 10 < 100) {
        return '${(height * 10).toInt().toString()} cm';
      } else {
        return '${(height / 10).toString()} m';
      }
    }
  }

  String pokemonWeight(){
    final weight = this?.weight ?? 0;
    if(weight <= 0) {
      return '? kg';
    } else {
      return '${(weight / 10).toString()} kg';
    }
  }
}