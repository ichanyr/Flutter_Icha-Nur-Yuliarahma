import 'package:flutter/material.dart';
import 'package:prioritas2/models/galery_model.dart';

class GaleryManager extends ChangeNotifier {
  final _galeryModel = <GaleryModel>[
    GaleryModel(image: 'assets/images/alterralogo.png'),
    GaleryModel(image: 'assets/images/androidstudiologo.png'),
    GaleryModel(image: 'assets/images/flutterlogo.jpg'),
    GaleryModel(image: 'assets/images/logodart.jpg'),
    GaleryModel(image: 'assets/images/logovscode.png'),
  ];
  List<GaleryModel> get galerysModel => _galeryModel;

  // void addGalery(GaleryModel galeryModel) {
  //   _galeryModel.add(galeryModel);
  //   notifyListeners();
  // }
}
