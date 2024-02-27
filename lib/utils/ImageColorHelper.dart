// import 'dart:isolate';
// import 'dart:typed_data';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_isolate/flutter_isolate.dart';
// import 'package:palette_generator/palette_generator.dart';
// import 'package:rxdart/rxdart.dart';
//
// @pragma('vm:entry-point')
// void computePalette(List<Object> args) async {
//   final imageBytes = args[0] as Uint8List;
//   final port = args[1] as SendPort;
//   final image = Image.memory(imageBytes);
//   final palette = await PaletteGenerator.fromImageProvider(
//     image.image,
//     maximumColorCount: 7,
//   );
//   final colorList = palette.colors
//       .map(
//         (e) => e.value,
//       )
//       .toList();
//   port.send(
//     colorList,
//   );
// }
//
// const int kPaletteError = 101;
//
// class ImageColorViewModel {
//   final colorListStream = BehaviorSubject<List<int>>();
//   FlutterIsolate? isolate;
//
//   void updatePalette(
//     BuildContext context,
//     CachedNetworkImageProvider imageProvider,
//   ) async {
//     if (!colorListStream.isClosed) {
//       var file = await DefaultCacheManager().getSingleFile(
//         imageProvider.url,
//       );
//       final bytes = await file.readAsBytes();
//       final port = ReceivePort();
//       if (!colorListStream.isClosed) {
//         isolate = await FlutterIsolate.spawn(
//           computePalette,
//           [
//             bytes,
//             port.sendPort,
//           ],
//         );
//         port.listen(
//           (message) {
//             if (!colorListStream.isClosed) {
//               colorListStream.add(
//                 message,
//               );
//             }
//             isolate?.kill();
//             port.close();
//           },
//         );
//       }
//     }
//   }
//
//   void dispose() {
//     isolate?.kill();
//     colorListStream.close();
//   }
// }
