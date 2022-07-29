import 'package:firedart/firedart.dart';

class StateModel {
  String docName;
  bool entryTable = true;
  bool repairCard = false;
  bool electricalMeasurement = false;
  bool visualInspectionMechanicalAndRotorStatorClearances = false;
  bool visualInspectionElectrical = false;
  bool testProtocolBefore = false;
  bool testProtocolAfter = false;
  bool exProofReport = false;
  bool exDeMechanicalShaftFlame = false;
  bool exDeMechanicalCLearance = false;
  bool exDeMechanicalStatorEnd = false;
  bool exDeTerminalBox = false;
  bool rewindingForm = false;
  bool deviationActionNote = false;
  Map<String, dynamic> dataMap = {};
  StateModel(this.docName);
  
  
  void sendData(bool exState, String? exDrop) {
    CollectionReference data = Firestore.instance.collection('State');
    
    if (exState && (exDrop == "de" || exDrop == "nA")) {
      dataMap.addAll({
        "exDeMechanicalShaftFlame": exDeMechanicalShaftFlame,
        "exDeMechanicalCLearance": exDeMechanicalShaftFlame,
        "exDeMechanicalStatorEnd": exDeMechanicalShaftFlame,
        "exDeTerminalBox": exDeTerminalBox,
        "visualInspectionElectrical": visualInspectionElectrical,
        "deviationActionNote": deviationActionNote,
        "entryTable": entryTable,
        "electricalMeasurement": electricalMeasurement,
        "visualInspectionMechanicalAndRotorStatorClearances":
            visualInspectionMechanicalAndRotorStatorClearances,
        "testProtocolBefore": testProtocolBefore,
        "testProtocolAfter": testProtocolAfter,
        
        "repairCard": repairCard,
      });
    }
    
    if (exState) {
      dataMap.addAll({
        "repairCard": repairCard,
        "entryTable": entryTable,
        "electricalMeasurement": electricalMeasurement,
        "visualInspectionMechanicalAndRotorStatorClearances":
            visualInspectionMechanicalAndRotorStatorClearances,
        "testProtocolBefore": testProtocolBefore,
        "testProtocolAfter": testProtocolAfter,
        
        "visualInspectionElectrical": visualInspectionElectrical,
        "deviationActionNote": deviationActionNote,
      });
    }
    
    else {
      dataMap.addAll({
        "repairCard": repairCard,
        "entryTable": entryTable,
        "electricalMeasurement": electricalMeasurement,
        "visualInspectionMechanicalAndRotorStatorClearances":
            visualInspectionMechanicalAndRotorStatorClearances,
        "testProtocolBefore": testProtocolBefore,
        "testProtocolAfter": testProtocolAfter,
        "visualInspectionElectrical": visualInspectionElectrical,
        "deviationActionNote": deviationActionNote,
      });
    }
    data.document(docName).set(dataMap);
  }


  void sendDataByMap(Map<String, dynamic> passedMap) {
    CollectionReference data = Firestore.instance.collection('State');
    
    data.document(docName).set(passedMap);
  }

  
  
  Future<void> adjustData(Map<String, dynamic> adjustedMap) async {
    CollectionReference data = Firestore.instance.collection('State');
    await data.document(docName).update(adjustedMap);
  }

  
  
  Future<void> deleteData(String field) async {
    
    CollectionReference data = Firestore.instance.collection('State');
    Document dataRef = await data.document(docName).get();
    Map<String, dynamic> dataMap = dataRef.map;
    dataMap.remove(field);
    await data.document(docName).set(dataMap);
  }

  
  Map<String, dynamic> getDataMap(bool exState, String? exDrop) {
    
    if (exState && exDrop == "de") {
      dataMap.addAll({
        "repairCard": repairCard,
        "entryTable": entryTable,
        "electricalMeasurement": electricalMeasurement,
        "visualInspectionMechanicalAndRotorStatorClearances":
            visualInspectionMechanicalAndRotorStatorClearances,
        "testProtocolBefore": testProtocolBefore,
        "testProtocolAfter": testProtocolAfter,
        
        "exDeMechanicalShaftFlame": exDeMechanicalShaftFlame,
        "exDeMechanicalCLearance": exDeMechanicalShaftFlame,
        "exDeMechanicalStatorEnd": exDeMechanicalShaftFlame,
        "exDeTerminalBox": exDeTerminalBox,
        "visualInspectionElectrical": visualInspectionElectrical,
        "deviationActionNote": deviationActionNote,
      });
    }
    
    if (exState) {
      dataMap.addAll({
        "repairCard": repairCard,
        "entryTable": entryTable,
        "electricalMeasurement": electricalMeasurement,
        "visualInspectionMechanicalAndRotorStatorClearances":
            visualInspectionMechanicalAndRotorStatorClearances,
        "testProtocolBefore": testProtocolBefore,
        "testProtocolAfter": testProtocolAfter,
        
        "visualInspectionElectrical": visualInspectionElectrical,
        "deviationActionNote": deviationActionNote,
      });
    }
    
    else {
      dataMap.addAll({
        "repairCard": repairCard,
        "entryTable": entryTable,
        "electricalMeasurement": electricalMeasurement,
        "visualInspectionMechanicalAndRotorStatorClearances":
            visualInspectionMechanicalAndRotorStatorClearances,
        "testProtocolBefore": testProtocolBefore,
        "testProtocolAfter": testProtocolAfter,
        "visualInspectionElectrical": visualInspectionElectrical,
        "deviationActionNote": deviationActionNote,
      });
    }
    return dataMap;
  }
}
