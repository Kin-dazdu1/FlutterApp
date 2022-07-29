import 'package:firedart/firedart.dart';
import 'state.dart';

class ExProofNa {
  String docName;

  

  Map<String, dynamic> dataMap = {};

  ExProofNa({required this.docName});

  void sendData() {
    StateModel state = StateModel(docName);
    CollectionReference data =
      Firestore.instance.collection('Ex proof report');
    dataMap.addAll({
      
    });
    data.document(docName).update({"exProofNa": dataMap});
    state.adjustData({"exProofReport": true});
  }
}
