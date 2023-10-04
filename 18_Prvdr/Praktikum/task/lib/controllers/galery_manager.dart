import 'package:flutter/material.dart';
import 'package:prioritas2/models/galery_model.dart';

class GaleryManager extends ChangeNotifier {
  final _galeryModel = <GaleryModel>[];
  List<GaleryModel> get galerysModel => _galeryModel;

  void addGalery(GaleryModel galeryModel) {
    _galeryModel.add(galeryModel);
    notifyListeners();
  }
}
