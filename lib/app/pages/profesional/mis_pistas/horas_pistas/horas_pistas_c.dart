import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorasPistasController extends GetxController {
  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  final Map deportes = {
    0: [
      'Padel',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3BE.png'
    ],
    1: [
      'Tenis',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3BE.png'
    ],
    2: [
      'Badminton',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3F8.png'
    ],
    3: [
      'P.Climatizada',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/person-swimming_1f3ca.png'
    ],
    4: [
      'Piscina',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/person-swimming_1f3ca.png'
    ],
    5: [
      'Baloncesto',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3C0.png'
    ],
    6: [
      'Fútbol sala',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U26BD.png'
    ],
    7: [
      'Fútbol 7',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U26BD.png'
    ],
    8: [
      'Fútbol 11',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U26BD.png'
    ],
    9: [
      'Pickeball',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F94D.png'
    ],
    10: [
      'Squash',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3F8.png'
    ],
    11: [
      'Tenis de mesa',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3D3.png'
    ],
    12: [
      'Frontón',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3BE.png'
    ],
    13: [
      'Balonmano',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U26BD.png'
    ],
    14: [
      'Rugby',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3C8.png'
    ],
    15: [
      'Multideporte',
      'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F938.png'
    ]
  };

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
