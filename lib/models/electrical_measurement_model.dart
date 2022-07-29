import 'package:firedart/firedart.dart';

import 'state.dart';

class ElectricalMeasurmentModel {
  String docName;
  bool switchWinding = false;
  String? ptcName;
  String? ptcResistance;
  String? rtdName;
  String? rtdResistance;
  String? heName;
  String? heResistance;
  String? heInsulationResistanceWinding;
  String? heInsulationResistanceEarth;
  List<String> ptc = [];
  List<String> rtd = [];
  List<String> heaters = [];
  String? windingTemp = "N/A";
  String? testVoltage = "N/A";
  String? resistenceUV = "N/A";
  String? resistenceVW = "N/A";
  String? resistenceWU = "N/A";
  String? resistenceUE = "N/A";
  String? resistenceVE = "N/A";
  String? resistenceWE = "N/A";
  String? resistenceUU = "N/A";
  String? resistenceVV = "N/A";
  String? resistenceWW = "N/A";
  String? commonResistence = "N/A";
  String? supplyVoltage = "N/A";
  String? connection = "N/A";
  String? averageCurrent = "N/A";
  String? vibroTest = "N/A";
  String? frameTemp = "N/A";
  String? coreTemp = "N/A";
  String? minTemp = "N/A";
  String? hotSpot = "N/A";

  String? resistenceAB = "N/A";
  String? resistenceBC = "N/A";
  String? resistenceAC = "N/A";
  String? resistenceAN = "N/A";
  String? resistenceBN = "N/A";
  String? resistenceCN = "N/A";
  String? resistenceAE = "N/A";
  String? resistenceBE = "N/A";
  String? resistenceCE = "N/A";
  String? primaryWToSecW = "N/A";
  String? earthQuiality = "N/A";
  String? secondToE = "N/A";
  String? primaryWToE = "N/A";
  String? resistenceABUV = "N/A";
  String? resistenceBCVW = "N/A";
  String? resistenceACWU = "N/A";
  String? currentTransName;
  String? currentTransResistence;
  String? currentTransInsResistence;
  List<List<String>> currentTrans = [];
  String? voltageTransName;
  String? voltageTransResistence;
  String? voltageTransInsResistence;
  List<List<String>> voltageTrans = [];
  String? supplyVoltageG = "N/A";
  String? connectionG = "N/A";
  String? averageCurrentG = "N/A";
  String? iU = "N/A";
  String? iV = "N/A";
  String? iW = "N/A";
  String? averageVol = "N/A";
  String? frameTempG = "N/A";
  bool highVoltage = false;
  String resistence15 = "N/A";
  String resistence60 = "N/A";
  String absorptionCoefficient = "N/A";
  Map<String, dynamic> dataMap = {};

  ElectricalMeasurmentModel({required this.docName});

  void sendData() async {
    StateModel state = StateModel(docName);
    CollectionReference data = Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "switchWinding": switchWinding,
      "repairTypeDrop": switchWinding ? "Rewinding and repair" : "Repair and overhaul",
      "highVoltage": highVoltage,
      "resistence15": resistence15,
      "resistence60":resistence60,
      "absorptionCoefficient": absorptionCoefficient,
      "ptc": ptc,
      "commonResistence": commonResistence,
      "rtd": rtd,
      "heaters": heaters,
      "windingTemp": windingTemp,
      "testVoltage": testVoltage,
      "resistenceUV": resistenceUV,
      "resistenceVW": resistenceVW,
      "resistenceWU": resistenceWU,
      "resistenceUE": resistenceUE,
      "resistenceVE": resistenceVE,
      "resistenceWE": resistenceWE,
      "resistenceUU": resistenceUU,
      "resistenceVV": resistenceVV,
      "resistenceWW": resistenceWW,
      "supplyVoltage": supplyVoltage,
      "connection": connection,
      "averageCurrent": averageCurrent,
      "iU": iU,
      "iV": iV,
      "iW": iW,
      "vibroTest": vibroTest,
      "frameTemp": frameTemp,
      "coreTemp": coreTemp,
      "minTemp": minTemp,
      "hotSpot": hotSpot,
      "resistenceAB": resistenceAB,
      "resistenceBC": resistenceBC,
      "resistenceAC": resistenceAC,
      "resistenceAN": resistenceAN,
      "resistenceBN": resistenceBN,
      "resistenceCN": resistenceCN,
      "resistenceAE": resistenceAE,
      "resistenceBE": resistenceBE,
      "resistenceCE": resistenceCE,
      "primaryWToSecW": primaryWToSecW,
      "earthQuiality": earthQuiality,
      "secondToE": secondToE,
      "primaryWToE": primaryWToE,
      "resistenceABUV": resistenceABUV,
      "resistenceBCVW": resistenceBCVW,
      "resistenceACWU": resistenceACWU,
      "supplyVoltageG": supplyVoltageG,
      "connectionG": connectionG,
      "averageCurrentG": averageCurrentG,
      "averageVol": averageVol,
      "frameTempG": frameTempG,
    });
    data.document(docName).update({'electricalMeasurement': dataMap});
    if (switchWinding) {
      state.adjustData({"rewindingForm": false, "electricalMeasurement": true, "testProtocolBefore": true});
    }
    else {
      await state.adjustData({"electricalMeasurement": true, "testProtocolBefore": true});
      state.deleteData("rewindingForm");
    }
  }
}
