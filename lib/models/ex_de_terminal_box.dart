import 'package:firedart/firedart.dart';
import 'state.dart';

class ExDeTerminalBoxModel {
  String docName;

  String typeOfFlamePathTBC = "N/A";
  String typeOfFlamePathTBI = "N/A";
  String typeOfFlamePathIPS = "N/A";
  String lenghtOfFlamePathTBC = "N/A";
  String lenghtOfFlamePathTBI = "N/A";
  String lenghtOfFlamePathIPS = "N/A";
  String diametrOfFlamePathTBC = "N/A";
  String diametrOfFlamePathTBI = "N/A";
  String diametrOfFlamePathIPS = "N/A";
  String diametrOfClearancesTBC = "N/A";
  String diametrOfClearancesTBI = "N/A";
  String diametrOfClearancesIPS = "N/A";
  String maximumGapTBC = "N/A";
  String maximumGapTBI = "N/A";
  String maximumGapIPS = "N/A";

  Map<String, dynamic> dataMap = {};

  ExDeTerminalBoxModel({required this.docName});

  void sendData() {
    StateModel state = StateModel(docName);
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "typeOfFlamePathTBC": typeOfFlamePathTBC,
      "typeOfFlamePathTBI": typeOfFlamePathTBI,
      "typeOfFlamePathIPS": typeOfFlamePathIPS,
      "lenghtOfFlamePathTBC": lenghtOfFlamePathTBC,
      "lenghtOfFlamePathTBI": lenghtOfFlamePathTBI,
      "lenghtOfFlamePathIPS": lenghtOfFlamePathIPS,
      "diametrOfFlamePathTBC": diametrOfFlamePathTBC,
      "diametrOfFlamePathTBI": diametrOfFlamePathTBI,
      "diametrOfFlamePathIPS": diametrOfFlamePathIPS,
      "diametrOfClearancesTBC": diametrOfClearancesTBC,
      "diametrOfClearancesTBI": diametrOfClearancesTBI,
      "diametrOfClearancesIPS": diametrOfClearancesIPS,
      "maximumGapTBC": maximumGapTBC,
      "maximumGapTBI": maximumGapTBI,
      "maximumGapIPS": maximumGapIPS,
    });
    data.document(docName).update({'exDeTerminalBox': dataMap});
    state.adjustData({"exDeTerminalBox": true});
  }
}
