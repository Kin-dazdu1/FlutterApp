import 'package:firedart/firedart.dart';
import 'state.dart';

class DeviationsActionsNotesModel {
  String docName;
  String? deviations;
  String? actions;
  String? notes;

  Map<String, dynamic> dataMap = {};

  DeviationsActionsNotesModel({required this.docName});
  void sendData() {
    StateModel state = StateModel(docName);
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    dataMap.addAll({
      "deviations": deviations,
      "actions": actions,
      "notes": notes,
    });
    data.document(docName).update({'deviationActionNote': dataMap});
    state.adjustData({"deviationActionNote": true});
  }
}
