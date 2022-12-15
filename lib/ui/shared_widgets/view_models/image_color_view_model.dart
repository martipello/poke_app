import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rxdart/rxdart.dart';

class ImageColorViewModel {

  final paletteGeneratorStream = BehaviorSubject<PaletteGenerator>();

  void updatePaletteGenerator(ImageProvider imageProvider) async {
    // final paletteGenerator = await PaletteGenerator.fromImageProvider(
    //   imageProvider,
    // );
    // if(!paletteGeneratorStream.isClosed) {
    //   paletteGeneratorStream.add(paletteGenerator);
    // }
  }

  void dispose(){
    paletteGeneratorStream.close();
  }
}
