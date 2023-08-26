import 'package:mestinyatet/Models/static_screen.dart';

var staticText = [
  StaticScreen(
    heading: "Bersyukurlah",
    desc:
        "Syukur itu ibarat vitamin D untuk jiwa, dosis yang rendah saja bisa menyediakan tambahan imunitas  dari omong kosong dan menguatkan psikologis anda",
    label: "Tuliskan apa yang syukuri hari ini",
    data: "",
    columnName: "gratitude",
  ),
  StaticScreen(
    heading: "Relakan Saja",
    desc:
        "Orang zaman dahulu membuat daftar hal yang akan mereka lakukan sebelum mereka mati, sekarang kita akan membuat apa hal yang harusnya bisa kita relakan sebelum kita mati",
    label: "Tuliskan apa yang ingin anda abaikan",
    data: "",
    columnName: "fuck_it",
  ),
  StaticScreen(
    heading: "Emosi",
    desc:
        "Apa yang anda rasakan? Ceritakan peristiwa yang anda alami dan bagaimana perasaan Anda tentang hal tersebut",
    label: "Ceritakan perasaan Anda",
    data: "",
    columnName: "emotion",
  )
];

var staticTextCollection = StaticScreenCollection(collection: staticText);
