
import 'package:firedart/firedart.dart';

import 'state.dart';

class ExDeMechanicalCLearanceModel {
  String docName;
  String bearingtypeOfFlamePathDe = "N/A";
  String bearingtypeOfFlamePathNDe = "N/A";
  String bearingtypeOfFlamePathNote = "";
  String bearinglengthOfFlamePathDe = "N/A";
  String bearinglengthOfFlamePathNDe = "N/A";
  String bearinglengthOfFlamePathNote = "";
  String maxDiametrOfFlamePathDe = "N/A";
  String maxDiametrOfFlamePathNDe = "N/A";
  String maxDiametrOfFlamePathNote = "";
  String minDiametrOfBearingDe = "N/A";
  String minDiametrOfBearingNDe = "N/A";
  String minDiametrOfBearingNote = "";
  String measuredClearanceDe = "N/A";
  String measuredClearanceNde = "N/A";
  String measuredClearanceNote = "";
  String bearingmaximumGapDe = "N/A";
  String bearingmaximumGapNde = "N/A";
  String bearingmaximumGapNote = "";
  Map<String, dynamic> dataMap = {};

  ExDeMechanicalCLearanceModel({required this.docName});

  void sendData() {
    StateModel state = StateModel(docName);
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "bearingtypeOfFlamePathDe": bearingtypeOfFlamePathDe,
      "bearingtypeOfFlamePathNDe": bearingtypeOfFlamePathNDe,
      "bearingtypeOfFlamePathNote": bearingtypeOfFlamePathNote,
      "bearinglengthOfFlamePathDe": bearinglengthOfFlamePathDe,
      "bearinglengthOfFlamePathNDe": bearinglengthOfFlamePathNDe,
      "bearinglengthOfFlamePathNote": bearinglengthOfFlamePathNote,
      "maxDiametrOfFlamePathDe": maxDiametrOfFlamePathDe,
      "maxDiametrOfFlamePathNDe": maxDiametrOfFlamePathNDe,
      "maxDiametrOfFlamePathNote": maxDiametrOfFlamePathNote,
      "minDiametrOfBearingDe": minDiametrOfBearingDe,
      "minDiametrOfBearingNDe": minDiametrOfBearingNDe,
      "minDiametrOfBearingNote": minDiametrOfBearingNote,
      "measuredClearanceDe": measuredClearanceDe,
      "measuredClearanceNde": measuredClearanceNde,
      "measuredClearanceNote": measuredClearanceNote,
      "bearingmaximumGapDe": bearingmaximumGapDe,
      "bearingmaximumGapNde": bearingmaximumGapNde,
      "bearingmaximumGapNote": bearingmaximumGapNote,
    });
    data.document(docName).update({'exDeMechanicalCLearance': dataMap});
    state.adjustData({"exDeMechanicalCLearance": true});
  }
}
