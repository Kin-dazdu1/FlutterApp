import 'package:firedart/firedart.dart';
import 'state.dart';

class VisualMechanicalInsectionModel {
  
  String docName;
  final List<String> commonItems = ["N/A", "OK", "NOT OK", "OK see note"];
  
  String driveABearingSeat = "N/A";
  String noneDriveABearingSeat = "N/A";
  String driveEJointFrame = "N/A";
  String jointOnDrive = "N/A";
  String noneDriveEndJ = "N/A";
  String jointOnNoneDrive = "N/A";
  String driveEndShieldJoint = "N/A";
  String driveEndBearing = "N/A";
  String noneDriveEndShield = "N/A";
  String noneDriveEndBearing = "N/A";
  String condtitionOfBolts = "N/A";
  String condtitionOfOilseals = "N/A";
  String condtitionOfFun = "N/A";
  String condtitionOfFunCover = "N/A";
  String precenseOfKey = "N/A";
  String presenceOfCoupl = "N/A";
  String minimumDistBW = "N/A";
  String maximumDOfR = "N/A";
  String diametrClearBRAS = "N/A";
  String rotorBalancR = "N/A";
  
  String driveABearingSeatNote = "";
  String noneDriveABearingSeatNote  = "";
  String driveEJointFrameNote  = "";
  String jointOnDriveNote = "";
  String noneDriveEndJNote  = "";
  String jointOnNoneDriveNote  = "";
  String driveEndShieldJointNote  = "";
  String driveEndBearingNote  = "";
  String noneDriveEndShieldNote  = "";
  String noneDriveEndBearingNote  = "";
  String condtitionOfBoltsNote  = "";
  String condtitionOfOilsealsNote = "";
  String condtitionOfFunNote = "";
  String condtitionOfFunCoverNote = "";
  String precenseOfKeyNote = "";
  String presenceOfCouplNote = "";
  String minimumDistBWNote = "";
  String maximumDOfRNote = "";
  String diametrClearBRASNote = "";
  String rotorBalancRNote = "";
  
  Map<String, dynamic> dataMap = {};

  VisualMechanicalInsectionModel({required this.docName});

  
  void sendData() {
    
    StateModel state = StateModel(docName);
    
    CollectionReference data =
      Firestore.instance.collection('Initial form');
    
    dataMap.addAll({
        "driveABearingSeat": driveABearingSeat,
        "noneDriveABearingSeat": noneDriveABearingSeat,
        "driveEJointFrame": driveEJointFrame,
        "jointOnDrive": jointOnDrive,
        "noneDriveEndJ": noneDriveEndJ,
        "jointOnNoneDrive": jointOnNoneDrive,
        "driveEndShieldJoint": driveEndShieldJoint,
        "driveEndBearing": driveEndBearing,
        "noneDriveEndShield": noneDriveEndShield,
        "noneDriveEndBearing": noneDriveEndBearing,
        "condtitionOfBolts": condtitionOfBolts,
        "condtitionOfOilseals": condtitionOfOilseals,
        "condtitionOfFun": condtitionOfFun,
        "condtitionOfFunCover": condtitionOfFunCover,
        "precenseOfKey": precenseOfKey,
        "presenceOfCoupl": presenceOfCoupl,
        "driveABearingSeatNote": driveABearingSeatNote,
        "noneDriveABearingSeatNote": noneDriveABearingSeatNote,
        "driveEJointFrameNote": driveEJointFrameNote,
        "jointOnDriveNote": jointOnDriveNote,
        "noneDriveEndJNote": noneDriveEndJNote,
        "jointOnNoneDriveNote": jointOnNoneDriveNote, 
        "driveEndShieldJointNote": driveEndShieldJointNote, 
        "driveEndBearingNote": driveEndBearingNote,
        "noneDriveEndShieldNote": noneDriveEndShieldNote, 
        "noneDriveEndBearingNote": noneDriveEndBearingNote,
        "condtitionOfBoltsNote": condtitionOfBoltsNote,
        "condtitionOfOilsealsNote": condtitionOfOilsealsNote,
        "condtitionOfFunNote": condtitionOfFunNote,
        "condtitionOfFunCoverNote": condtitionOfFunCoverNote,
        "precenseOfKeyNote": precenseOfKeyNote,
        "presenceOfCouplNote": presenceOfCouplNote,
        "minimumDistBW": minimumDistBW,
        "maximumDOfR": maximumDOfR,
        "diametrClearBRAS": diametrClearBRAS,
        "rotorBalancR": rotorBalancR,
        "minimumDistBWNote": minimumDistBWNote,
        "maximumDOfRNote": maximumDOfRNote,
        "diametrClearBRASNote": diametrClearBRASNote,
        "rotorBalancRNote": rotorBalancRNote,
    });
    
    data.document(docName).update({'visualInspectionMechanicalAndRotorStatorClearances': dataMap});
    
    state.adjustData({"visualInspectionMechanicalAndRotorStatorClearances": true});
  }
}

