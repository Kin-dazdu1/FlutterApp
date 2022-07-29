import 'package:firedart/firedart.dart';
import 'state.dart';

class RepairCardModel {
  // id of document
  String docName;
  // common drop down list
  List<String> commonDropListRR = ["N/A", "NO", "REPAIRED", "REPLACED"];
  List<String> commonDropListM = ["YES", "NO"];
  // Stator info
  String statorRR = "N/A";  
  String statorM = "";
  String statorNote = "";
  String statorCByDate = "";
  // Fan info
  String fanRR = "N/A";  
  String fanM = "";
  String fanNote = "";
  String fanCByDate = "";  
  // Fan cover info
  String fanCoverRR = "N/A";  
  String fanCoverM = "";
  String fanCoverNote = "";
  String fanCoverCByDate = "";  
  // NDE end shield 
  String ndeESRR = "N/A";  
  String ndeESM = "";
  String ndeESNote = "";
  String ndeESCByDate = "";  
// DE end shield 
  String deESRR = "N/A";  
  String deESM = "";
  String deESNote = "";
  String deESCByDate = "";
  // DE inner bearing cap  
  String innerBDeRR = "N/A";  
  String innerBdeM = "";
  String innerBdeNote = "";
  String innerBdeCByDate = "";
  // NDE inner bearing cap 
  String innerBNdeRR = "N/A";  
  String innerBNdeM = "";
  String innerBNdeNote = "";
  String innerBNdeCByDate = "";
  // Shaft
  String shaftRR = "N/A";  
  String shaftM = "";
  String shaftNote = "";
  String shaftCByDate = "";
  // Slots
  String slotsRR = "N/A";  
  String slotsM = "";
  String slotsNote = "";
  String slotsCByDate = "";
  // Bearing
  String bearingRR = "N/A";  
  String bearingM = "";
  String bearingNote = "";
  String bearingCByDate = "";
  // Rotor
  String rotorRR = "N/A";  
  String rotorM = "";
  String rotorNote = "";
  String rotorCByDate = "";
  // Rotor
  String coreRR = "N/A";  
  String coreM = "";
  String coreNote = "";
  String coreCByDate = "";
  // Gaskets and seals
  String gasketsRR = "N/A";  
  String gasketsM = "";
  String gasketsNote = "";
  String gasketsCByDate = "";
  // Thread nut and etc
  String threadRR = "N/A";  
  String threadM = "";
  String threadNote = "";
  String threadCByDate = "";
  // Termianl box
  String terminalBRR = "N/A";  
  String terminalBM = "";
  String terminalBNote = "";
  String terminalBCByDate = "";
  // Enclosures and Base plate
  String enclosuresABPBRR = "N/A";  
  String enclosuresABPM = "";
  String enclosuresABPNote = "";
  String enclosuresABPCByDate = "";
  // Temp element
  String tempERR = "N/A";  
  String tempEM = "";
  String tempENote = "";
  String tempEPCByDate = "";
  // Heaters
  String heatersRR = "N/A";  
  String heatersM = "";
  String heatersNote = "";
  String heatersCByDate = "";
  // Lightinings
  String lightingsRR = "N/A";  
  String lightingsM = "";
  String lightingsNote = "";
  String lightingsCByDate = "";
  // Control unit
  String controlURR = "N/A";  
  String controlUM = "";
  String controlUNote = "";
  String controlUCByDate = "";
  // Cable gland entry
  String cableGERR = "N/A";  
  String cableGEM = "";
  String cableGENote = "";
  String cableGECByDate = "";
  // inspection windows
  String inspectionWRR = "N/A";  
  String inspectionWM = "";
  String inspectionWNote = "";
  String inspectionWCByDate = "";
  // swithces
  String switchesRR = "N/A";  
  String switchesM = "";
  String switchesNote = "";
  String switchesCByDate = "";
  // ballasts
  String ballastsRR = "N/A";  
  String ballastsM = "";
  String ballastsNote = "";
  String ballastsCByDate = "";
  // capacitors
  String capacitorsRR = "N/A";  
  String capacitorsM = "";
  String capacitorsNote = "";
  String capacitorsCByDate = "";
  // relays
  String relaysRR = "N/A";  
  String relaysM = "";
  String relaysNote = "";
  String relaysCByDate = "";
  // Lamp holders
  String lampHRR = "N/A";  
  String lampHM = "";
  String lampHNote = "";
  String lampHCByDate = "";
  // Batteries 
  String batteriesRR = "N/A";  
  String batteriesM = "";
  String batteriesNote = "";
  String batteriesCByDate = "";
  // Transformers
  String transformersRR = "N/A";  
  String transformersM = "";
  String transformersNote = "";
  String transformersCByDate = "";
  // RepairCardModel MODEL
  Map<String, dynamic> dataMap = {};
  RepairCardModel({required this.docName});

  // Sending data to Initial form collection in electricalMeasurment MAP
  void sendData() {
    // State instance
    StateModel state = StateModel(docName);
    // Collection reference
    CollectionReference data = Firestore.instance.collection('Repair card');
    // adding all to local map
    dataMap.addAll({
        "statorRR": statorRR,
        "statorM": statorM,
        "statorNote": statorNote,
        "statorCByDate": statorCByDate,
        "fanRR": fanRR,
        "fanM": fanM,
        "fanNote": fanNote,
        "fanCByDate": fanCByDate,
        "fanCoverRR": fanCoverRR,
        "fanCoverM": fanCoverM,
        "fanCoverNote": fanCoverNote,
        "fanCoverCByDate": fanCoverCByDate,
        "ndeESRR": ndeESRR,
        "ndeESM": ndeESM,
        "ndeESNote": ndeESNote,
        "ndeESCByDate": ndeESCByDate,
        "deESRR": deESRR,
        "deESM": deESM,
        "deESNote": deESNote,
        "deESCByDate": deESCByDate,
        "innerBDeRR": innerBDeRR,
        "innerBdeM": innerBdeM,
        "innerBdeNote": innerBdeNote,
        "innerBdeCByDate": innerBdeCByDate,
        "innerBNdeRR": innerBNdeRR,
        "innerBNdeM": innerBNdeM,
        "innerBNdeNote": innerBNdeNote,
        "innerBNdeCByDate": innerBNdeCByDate,
        "shaftRR": shaftRR,
        "shaftM": shaftM,
        "shaftNote": shaftNote,
        "shaftCByDate": shaftCByDate,
        "slotsRR": slotsRR,
        "slotsM": slotsM,
        "slotsNote": slotsNote,
        "slotsCByDate": slotsCByDate,
        "bearingRR": bearingRR,
        "bearingM": bearingM,
        "bearingNote": bearingNote,
        "bearingCByDate": bearingCByDate,
        "rotorRR": rotorRR,
        "rotorM": rotorM,
        "rotorNote": rotorNote,
        "rotorCByDate": rotorCByDate,
        "coreRR": coreRR,
        "coreM": coreM,
        "coreNote": coreNote,
        "coreCByDate": coreCByDate,
        "gasketsRR": gasketsRR,
        "gasketsM": gasketsM,
        "gasketsNote": gasketsNote,
        "gasketsCByDate": gasketsCByDate,
        "threadRR": threadRR,
        "threadM": threadM,
        "threadNote": threadNote,
        "threadCByDate": threadCByDate,
        "terminalBRR": terminalBRR,
        "terminalBM": terminalBM,
        "terminalBNote": terminalBNote,
        "terminalBCByDate": terminalBCByDate,
        "enclosuresABPBRR": enclosuresABPBRR,
        "enclosuresABPM": enclosuresABPM,
        "enclosuresABPNote": enclosuresABPNote,
        "enclosuresABPCByDate": enclosuresABPCByDate,
        "tempERR": tempERR,
        "tempEM": tempEM,
        "tempENote": tempENote,
        "tempEPCByDate": tempEPCByDate,
        "heatersRR": heatersRR,
        "heatersM": heatersM,
        "heatersNote": heatersNote,
        "heatersCByDate": heatersCByDate,
        "lightingsRR": lightingsRR,
        "lightingsM": lightingsM,
        "lightingsNote": lightingsNote,
        "lightingsCByDate": lightingsCByDate,
        "controlURR": controlURR,
        "controlUM": controlUM,
        "controlUNote": controlUNote,
        "controlUCByDate": controlUCByDate,
        "cableGERR": cableGERR,
        "cableGEM": cableGEM,
        "cableGENote": cableGENote,
        "cableGECByDate": cableGECByDate,
        "inspectionWRR": inspectionWRR,
        "inspectionWM": inspectionWM,
        "inspectionWNote": inspectionWNote,
        "inspectionWCByDate": inspectionWCByDate,
        "switchesRR": switchesRR,
        "switchesM": switchesM,
        "switchesNote": switchesNote,
        "switchesCByDate": switchesCByDate,
        "ballastsRR": ballastsRR,
        "ballastsM": ballastsM,
        "ballastsNote": ballastsNote,
        "ballastsCByDate": ballastsCByDate,
        "capacitorsRR": capacitorsRR,
        "capacitorsM": capacitorsM,
        "capacitorsNote": capacitorsNote,
        "capacitorsCByDate": capacitorsCByDate,
        "relaysRR": relaysRR,
        "relaysM": relaysM,
        "relaysNote": relaysNote,
        "relaysCByDate": relaysCByDate,
        "lampHRR": lampHRR,
        "lampHM": lampHM,
        "lampHNote": lampHNote,
        "lampHCByDate": lampHCByDate,
        "batteriesRR": batteriesRR,
        "batteriesM": batteriesM,
        "batteriesNote": batteriesNote,
        "batteriesCByDate": batteriesCByDate,
        "transformersRR": transformersRR,
        "transformersM": transformersM,
        "transformersNote": transformersNote,
        "transformersCByDate": transformersCByDate,
    });
    // updating collection by adding generated map to document
    data.document(docName).update({'repairCard': dataMap});
    // Adjusting state of electricalMeasurement to true
    state.adjustData({"repairCard": true});
  }
}
