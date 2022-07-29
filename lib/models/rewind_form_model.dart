import 'package:firedart/firedart.dart';
import 'state.dart';

class RewindingCardModel {
  // id of document
  String docName;
  final DateTime time = DateTime.now();
  // Amount of slots
  String slotsAmount = "";
  // Heating
  String heating = "";
  // Number of phases slot
  String numberOPS = "";
  // Temp. feeler
  String tempFeeler = "";
  // Length lead of windings - out cable
  String lengthLO = "";
  // Wire diameter old
  String wireDiametrO = "";
  // Lenght lead of windings - none out cable
  String lengthLNO = "";
  // Amount wires old
  String amountWO = "";
  // Amount wires new
  String amountWN = "";
  // Length of lamination
  String lengthOL = "";
  // Wire diameter new
  String wireDiametrN = "";
  // Diameter of lamination
  String diametrOL = "";
  // Amount of bars
  String amountOB = "";
  // Amount windings coil/slot
  String amointW = "";
  // Span equipitential
  String spanE = "";
  // Step winding (DC)
  String windingStepDC = "";
  // Number equipotentional
  String numberspanE = "";
  // Circuit
  String circuit = "";
  // Wire diameter
  String diametr = "";
  // Step winding
  String stepW = "";
  // Lamination repaired
  bool laminationR = false;
  // Lamination tested
  bool laminationT = false;
  // Amount of hours
  String amountOH = "";
  // Circuit drive right way
  bool circuitDRW = false;
  // Type Slot Wedges
  String typeSW = "";
  // Rotor magnetization
  String rotorM = "";
  // Class
  String clas = "";
  // Rewind technician
  String rewindT = "";
  // Remarks
  String remarks = "";
  // RepairCardModel MODEL
  Map<String, dynamic> dataMap = {};
  RewindingCardModel({required this.docName});

  // Sending data to Initial form collection in electricalMeasurment MAP
  void sendData() {
    // State instance
    StateModel state = StateModel(docName);
    // Collection reference
    CollectionReference data = Firestore.instance.collection('Rewinding card');
    // adding all to local map
    dataMap.addAll({
      "diametrOL": diametrOL,
      "amountWN": amountWN,
      "time": time,
      "slotsAmount": slotsAmount,
      "heating": heating,
      "numberOPS": numberOPS,
      "tempFeeler": tempFeeler,
      "lengthLO": lengthLO,
      "wireDiametrO": wireDiametrO,
      "lengthLNO": lengthLNO,
      "amountWO": amountWO,
      "lengthOL": lengthOL,
      "wireDiametrN": wireDiametrN,
      "amountOB": amountOB,
      "amointW": amointW,
      "spanE": spanE,
      "windingStepDC": windingStepDC,
      "numberspanE": numberspanE,
      "circuit": circuit,
      "diametr": diametr,
      "stepW": stepW,
      "laminationR": laminationR? "YES":"NO",
      "laminationT": laminationT? "YES":"NO",
      "amountOH": amountOH,
      "circuitDRW": circuitDRW? "YES":"NO",
      "typeSW": typeSW,
      "rotorM": rotorM,
      "clas": clas,
      "rewindT": rewindT,
      "remarks": remarks,
    });
    // updating collection by adding generated map to document
    data.document(docName).update({'rewindingForm': dataMap});
    // Adjusting state of electricalMeasurement to true
    state.adjustData({"rewindingForm": true});
  }
}
