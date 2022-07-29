import 'package:firedart/firedart.dart';
import 'state.dart';

class InitialForm {
  static DateTime time = DateTime.now();
  String? brefDesctiption = "N/A";
  String? typeOfCooling = "N/A";
  String? requestNumber = "N/A";
  String? tagNumber = "N/A";
  String? manufacturer = "N/A";
  String? voltage = "N/A";
  String? rotorVoltage = "N/A";
  String? type = "N/A";
  String? nominalCurrent = "N/A";
  String? rotorCurrent = "N/A";
  String? serialNumber = "N/A";
  String? frequency = "N/A";
  String? genVoltage = "N/A";
  String? power = "N/A";
  String? insClass = "N/A";
  String? genCurrent = "N/A";
  String? rpm = "N/A";
  String? exRating = "N/A";
  String? deBearing = "N/A";
  String? ndeBearing = "N/A";
  String? greaseType = "N/A";
  String? duty = "N/A";
  String? ctRationClass = "N/A";
  String? nlcToFlaRatio = "N/A";
  String? teTime = "N/A";
  String? yearOfManuf = "N/A";
  String? exNum = "N/A";
  String? ipRate = "N/A";
  String? customer = "N/A";
  bool exSwitch = false;
  Map<String, dynamic> dataMap = {};

  String? connectionDDrop = 'Y';
  var connectionItems = ['Y', 'Δ', 'Δ/Y'];
  String exTypeDrop = 'N/A';
  var exTypeDropItems = [
    'N/A',
    'de',
    'nA',
  ];
  String? equipmentNameInitialDrop = 'AC motor asynchronous';
  var equipmentNameItems = [
    'AC motor synchronous',
    'AC motor asynchronous',
    'DC motor',
    'Generator'
  ];

  InitialForm(this.requestNumber, this.serialNumber);

  void sendData() {
    StateModel state = StateModel("R:$requestNumber;SN:$serialNumber");
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "customer": customer,
      'typeOfCooling': typeOfCooling,
      'brefDesctiption': brefDesctiption,
      'equipmentNameInitialDrop': equipmentNameInitialDrop,
      'requestNumber': requestNumber,
      'tagNumber': tagNumber,
      'manufacturer': manufacturer,
      'voltage': voltage,
      'rotorVoltage': rotorVoltage,
      'type': type,
      'nominalCurrent': nominalCurrent,
      'rotorCurrent': rotorCurrent,
      'serialNumber': serialNumber,
      'frequency': frequency,
      'genVoltage': genVoltage,
      'power': power,
      "exTypeDrop": exTypeDrop,
      'insClass': insClass,
      'genCurrent': genCurrent,
      'rpm': rpm,
      'exRating': exRating,
      'deBearing': deBearing,
      'ndeBearing': ndeBearing,
      'greaseType': greaseType,
      'duty': duty,
      'ctRationClass': ctRationClass,
      'nlcToFlaRatio': nlcToFlaRatio,
      'teTime': teTime,
      'time': time,
      'yearOfManuf': yearOfManuf,
      'exNum': exNum,
      'ipRate': ipRate,
      'connectionDDrop': connectionDDrop,
    });
    data
        .document("R:$requestNumber;SN:$serialNumber")
        .update({'entryTable': dataMap});
    state.sendData(exSwitch, exTypeDrop);
  }

  void sendDataStateByMap(Map<String, dynamic> passedMap) {
    StateModel state = StateModel("R:$requestNumber;SN:$serialNumber");
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "customer": customer,
      "exTypeDrop": exTypeDrop,
      'typeOfCooling': typeOfCooling,
      'brefDesctiption': brefDesctiption,
      'equipmentNameInitialDrop': equipmentNameInitialDrop,
      'requestNumber': requestNumber,
      'tagNumber': tagNumber,
      'manufacturer': manufacturer,
      'voltage': voltage,
      'rotorVoltage': rotorVoltage,
      'type': type,
      'nominalCurrent': nominalCurrent,
      'rotorCurrent': rotorCurrent,
      'serialNumber': serialNumber,
      'frequency': frequency,
      'genVoltage': genVoltage,
      'power': power,
      'insClass': insClass,
      'genCurrent': genCurrent,
      'rpm': rpm,
      'exRating': exRating,
      'deBearing': deBearing,
      'ndeBearing': ndeBearing,
      'greaseType': greaseType,
      'duty': duty,
      'ctRationClass': ctRationClass,
      'nlcToFlaRatio': nlcToFlaRatio,
      'teTime': teTime,
      'time': time,
      'yearOfManuf': yearOfManuf,
      'exNum': exNum,
      'ipRate': ipRate,
      'connectionDDrop': connectionDDrop,
    });
    data
        .document("R:$requestNumber;SN:$serialNumber")
        .update({'entryTable': dataMap});
    state.sendDataByMap(passedMap);
  }

  Map<String, dynamic> getDataMap() {
    StateModel state = StateModel("R:$requestNumber;SN:$serialNumber");
    return state.getDataMap(exSwitch, exTypeDrop);
  }
}
