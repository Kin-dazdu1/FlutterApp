import 'package:firedart/firedart.dart';
import 'state.dart';

class ExDeMechanicalStatorEndModel {
  String docName;
  String shieldTypeOfFlamePathDe = "N/A";
  String shieldTypeOfFlamePathNDe = "N/A";
  String shieldTypeOfFlamePathNote = "";
  String shieldLengthOfFlamePathDe = "N/A";
  String shieldLengthOfFlamePathNDe = "N/A";
  String shieldLengthOfFlamePathNote = "N/A";
  String maxDiametrOfMotorDe = "N/A";
  String maxDiametrOfMotorNDe = "N/A";
  String maxDiametrOfMotorNote = "";
  String minDiametrOfEndDe = "N/A";
  String minDiametrOfEndNDe = "N/A";
  String minDiametrOfEndNote = "";
  String shaftMeasuredClearanceDe = "N/A";
  String shaftMeasuredClearanceNde = "N/A";
  String shaftMeasuredClearanceNote = "";
  String shaftMaximumGapDe = "N/A";
  String shaftMaximumGapNde = "N/A";
  String shaftMaximumGapNote = "";
  Map<String, dynamic> dataMap = {};

  ExDeMechanicalStatorEndModel({required this.docName});

  void sendData() {
    StateModel state = StateModel(docName);
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "shieldTypeOfFlamePathDe": shieldTypeOfFlamePathDe, 
      "shieldTypeOfFlamePathNDe": shieldTypeOfFlamePathNDe, 
      "shieldTypeOfFlamePathNote": shieldTypeOfFlamePathNote, 
      "shieldLengthOfFlamePathDe": shieldLengthOfFlamePathDe, 
      "shieldLengthOfFlamePathNDe": shieldLengthOfFlamePathNDe, 
      "shieldLengthOfFlamePathNote": shieldLengthOfFlamePathNote, 
      "maxDiametrOfMotorDe": maxDiametrOfMotorDe,
      "maxDiametrOfMotorNDe": maxDiametrOfMotorNDe, 
      "maxDiametrOfMotorNote": maxDiametrOfMotorNote, 
      "minDiametrOfEndDe": minDiametrOfEndDe,
      "minDiametrOfEndNDe": minDiametrOfEndNDe,
      "minDiametrOfEndNote": minDiametrOfEndNote,
      "shaftMeasuredClearanceDe": shaftMeasuredClearanceDe,
      "shaftMeasuredClearanceNde": shaftMeasuredClearanceNde,
      "shaftMeasuredClearanceNote": shaftMeasuredClearanceNote,
      "shaftMaximumGapDe": shaftMaximumGapDe,
      "shaftMaximumGapNde": shaftMaximumGapNde,
      "shaftMaximumGapNote": shaftMaximumGapNote, 
    });        
    data.document(docName).update({'exDeMechanicalStatorEnd': dataMap});
    state.adjustData({"exDeMechanicalStatorEnd": true});
  }
}
