enum Region {
  kanto(
    1,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fkanto_region.webp?alt=media',
  ),
  johto(2,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fjohto_region.jpeg?alt=media',
  ),
  hoenn(3,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fhoenn_region.webp?alt=media',
  ),
  sinnoh(4,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fsinnoh_region.webp?alt=media',
  ),
  unova(5,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Funova_region.png?alt=media',
  ),
  kalos(6,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fkalos_region.webp?alt=media',
  ),
  alola(7,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Falola_region.jpg?alt=media',
  ),
  galor(8,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fgalar_region.jpeg?alt=media',
  ),
  hisui(9,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fhisui_region.webp?alt=media',
  ),
  paldea(10,
    'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/maps%2Fpaldea_region.jpeg?alt=media',
  );

  const Region(
    this.id,
    this.mapUrl,
  );

  final int id;
  final String mapUrl;
}
