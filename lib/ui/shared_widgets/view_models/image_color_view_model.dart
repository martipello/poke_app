import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rxdart/rxdart.dart';


const int kPaletteError = 101;

class ImageColorViewModel {
  final paletteGeneratorStream = BehaviorSubject<PaletteGenerator>();

  void updatePalette(NetworkImage imageProvider) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );
    if(!paletteGeneratorStream.isClosed) {
      paletteGeneratorStream.add(paletteGenerator);
    }
  }

  void dispose() {
    paletteGeneratorStream.close();
  }
}
