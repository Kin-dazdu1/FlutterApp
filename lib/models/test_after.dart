import 'package:firedart/firedart.dart';
import 'state.dart';

class TestProtocolAfterModel {
  
  String docName;

  
  String? testVoltage = "N/A";
  
  String? resistenceUUA = "N/A";
  String? resistenceVVA = "N/A";
  String? resistenceWWA = "N/A";
  String? commonResistenceA = "N/A";
  
  String? heName;
  String? heResistance;
  String? heInsulationResistanceWinding;
  String? heInsulationResistanceEarth;
  List<String> heatersA = [];
  
  String? time;
  String? ambientTemp;
  String? currentA;
  String? currentB;
  String? currentC;
  String? rpm;
  String? tempNDE;
  String? tempFrame;
  String? tempDE;
  String? yellowPT;
  String? greenPT;
  String? redPT;
  
  List<String> measurments = [];

  
  String statorResistence1 = "N/A";
  String statorResistence2 = "N/A";
  String statorResistence3 = "N/A";
  String statorResistenceATM1 = "N/A";
  String statorResistenceATM2 = "N/A";
  String statorResistenceATM3 = "N/A";
  String rotorResistence = "N/A";
  String rotorPolesR = "N/A";
  String rotorPolesRM = "N/A";
  String contactCR = "N/A";
  String contactCRM = "N/A";
  
  String resistence15 = "N/A";
  String resistence60 = "N/A";
  String absorptionCoefficient = "N/A";
  
  Map<String, dynamic> dataMap = {};
  TestProtocolAfterModel({required this.docName});

  
  void sendData() {
    
    StateModel state = StateModel(docName);
    
    CollectionReference data = Firestore.instance.collection('Test after');
    
    dataMap.addAll({
      "testVoltage": testVoltage,
      "heatersA": heatersA,
      "measurments": measurments,
      "resistenceUUA": resistenceUUA,
      "resistenceVVA": resistenceVVA,
      "resistenceWWA": resistenceWWA,
      "commonResistenceA": commonResistenceA,
      "resistence15": resistence15,
      "resistence60": resistence60,
      "absorptionCoefficient": absorptionCoefficient,
    });
    
    data.document(docName).update({'testProtocolAfterMotor': dataMap});
    
    state.adjustData({"testProtocolAfter": true});
  }
}
