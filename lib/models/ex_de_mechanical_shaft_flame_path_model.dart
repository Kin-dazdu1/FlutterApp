import 'package:cloud_firestore/cloud_firestore.dart';
import 'state.dart';

class ExDeMechanicalShaftFlameModel {
  String docName;
  String typeOfFlamePathDe = "N/A";
  String typeOfFlamePathNDe = "N/A";
  String typeOfFlamePathNote = "N/A";
  String lengthOfFlamePathDe = "N/A";
  String lengthOfFlamePathNDe = "N/A";
  String lengthOfFlamePathNote = "N/A";
  String diametrOfFlamePathDe = "N/A";
  String diametrOfFlamePathNDe = "N/A";
  String diametrOfFlamePathNote = "N/A";
  String diametrOfShaftDe = "N/A";
  String diametrOfShaftNDe = "N/A";
  String diametrOfShaftNote = "N/A";
  String diametralclearancesDe = "N/A";
  String diametralclearancesNde = "N/A";
  String diametralclearancesNote = "N/A";
  String maximumGapDe = "N/A";
  String maximumGapNde = "N/A";
  String maximumGapNote = "N/A";
  Map<String, dynamic> dataMap = {};

  ExDeMechanicalShaftFlameModel({required this.docName});

  void sendData() {
    StateModel state = StateModel(docName);
    CollectionReference data =
        FirebaseFirestore.instance.collection('Initial form');
    dataMap.addAll({});
    data.doc(docName).update({'exDeMechanicalShaftFlame': dataMap});
    state.adjustData({"exDeMechanicalShaftFlame": true});
  }
}


















