import 'package:firedart/firedart.dart';
import 'state.dart';

class VisualInspectionElectrical {
  
  String docName;
  
  final List<String> commonItems = ["N/A", "OK", "NOT OK", "OK see note"];
  
  final List<String> commonItemsYN = ["Yes", "No"];
  
  String conditionOfStator = "N/A";
  String conditionOfFrameTerminalBox = "N/A";
  String conditionOfStatorIP = "N/A";
  String conditionOfTerminalBoxTB = "N/A";
  String conditionOfTerminalBoxGP = "N/A";
  String minimumGapTB = "N/A";
  String terminalInsulators = "N/A";
  String glandPlatePresent = "No";
  String rotorConcentricity = "N/A";
  String transformers = "N/A";
  String brashes = "N/A";
  String commutator = "N/A";
  String motorFreeInternalVolume = "N/A";
  String terminalBoxFreeInternalVolume = "N/A";

  
  String conditionOfStatorNote = "";
  String conditionOfFrameTerminalBoxNote = "";
  String conditionOfStatorIPNote = "";
  String conditionOfTerminalBoxTBNote = "";
  String conditionOfTerminalBoxGPNote = "";
  String minimumGapTBNote = "";
  String terminalInsulatorsNote = "";
  String glandPlatePresentNote = "";
  String rotorConcentricityNote = "";
  String transformersNote = "";
  String brashesNote = "";
  String commutatorNote = "";
  String motorFreeInternalVolumeNote = "";
  String terminalBoxFreeInternalVolumeNote = "";

  
  Map<String, dynamic> dataMap = {};

  VisualInspectionElectrical({required this.docName});

  
  void sendData() {
    
    StateModel state = StateModel(docName);
    
    CollectionReference data =
        Firestore.instance.collection('Initial form');
    
    dataMap.addAll({
      "conditionOfStator": conditionOfStator,
      "conditionOfFrameTerminalBox": conditionOfFrameTerminalBox,
      "conditionOfStatorIP": conditionOfStatorIP,
      "conditionOfTerminalBoxTB": conditionOfTerminalBoxTB,
      "conditionOfTerminalBoxGP": conditionOfTerminalBoxGP,
      "minimumGapTB": minimumGapTB,
      "terminalInsulators": terminalInsulators,
      "glandPlatePresent": glandPlatePresent,
      "rotorConcentricity": rotorConcentricity,
      "transformers": transformers,
      "brashes": brashes,
      "commutator": commutator,
      "motorFreeInternalVolume": motorFreeInternalVolume,
      "terminalBoxFreeInternalVolume": terminalBoxFreeInternalVolume,
      "conditionOfStatorNote": conditionOfStatorNote,
      "conditionOfFrameTerminalBoxNote": conditionOfFrameTerminalBoxNote,
      "conditionOfStatorIPNote": conditionOfStatorIPNote,
      "conditionOfTerminalBoxTBNote": conditionOfTerminalBoxTBNote,
      "conditionOfTerminalBoxGPNote": conditionOfTerminalBoxGPNote,
      "minimumGapTBNote": minimumGapTBNote,
      "terminalInsulatorsNote": terminalInsulatorsNote,
      "glandPlatePresentNote": glandPlatePresentNote,
      "rotorConcentricityNote": rotorConcentricityNote,
      "transformersNote": transformersNote,
      "brashesNote": brashesNote,
      "commutatorNote": commutatorNote,
      "motorFreeInternalVolumeNote": motorFreeInternalVolumeNote,
      "terminalBoxFreeInternalVolumeNote": terminalBoxFreeInternalVolumeNote,
    });
    
    data.document(docName).update({'visualInspectionElectrical': dataMap});
    
    state.adjustData({"visualInspectionElectrical": true});
  }
}
