import 'dart:io';
import 'dart:typed_data';
import 'package:docx_template/docx_template.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:path_provider/path_provider.dart';

Map<String, dynamic> globalData = {};

Future<String?> _localPath(String docName) async {
  final dataMap = await getMap(docName, "Initial form");
  if (defaultTargetPlatform == TargetPlatform.android) {
    final directory = await getExternalStorageDirectory();
    Directory directoryReq = Directory(
        directory!.path + "/${dataMap!["entryTable"]["requestNumber"]}/");
    Directory directoryTag = Directory(
        directoryReq.path + "/${dataMap["entryTable"]["tagNumber"]}/");
    if (await directoryReq.exists()) {
      if (await directoryTag.exists()) {
        return directoryTag.path;
      } else {
        await directoryTag.create(recursive: true);
        return directoryTag.path;
      }
    } else {
      await directoryReq.create(recursive: true);
      await directoryTag.create(recursive: true);
      return directoryTag.path;
    }
  }
  if (defaultTargetPlatform == TargetPlatform.windows) {
    final directory = await getApplicationSupportDirectory();
    Directory directoryReq = Directory(
        directory.path + "/${dataMap!["entryTable"]["requestNumber"]}/");
    Directory directoryTag = Directory(
        directoryReq.path + "/${dataMap["entryTable"]["tagNumber"]}/");
    if (await directoryReq.exists()) {
      if (await directoryTag.exists()) {
        return directoryTag.path;
      } else {
        await directoryTag.create(recursive: true);
        return directoryTag.path;
      }
    } else {
      await directoryReq.create(recursive: true);
      await directoryTag.create(recursive: true);
      return directoryTag.path;
    }
  }
  return null;
}

Future<File> _localFile(String docxName, String docName) async {
  final path = await _localPath(docName);
  return File('$path/$docxName');
}

Future<File> writeDocx(final bytes, String docxName, String docName) async {
  final file = await _localFile(docxName, docName);
  return file.writeAsBytes(bytes);
}
Future<Map<String, dynamic>?> getMap(String docName, String collection) async {
  Map<String, dynamic>? dataMap;
  CollectionReference reference = Firestore.instance.collection(collection);
  Document data = await reference.document(docName).get();
  if (data.map.isNotEmpty) {
    dataMap = data.map;
    return dataMap;
  }
  return dataMap;
}

Future<bool> generateEntryCard(String docName, String collectionName) async {
  final data = await rootBundle.load('assets/docx/Etnry card.docx');
  final bytes = data.buffer.asUint8List();
  final docx = await DocxTemplate.fromBytes(bytes);
  final dataMap = await getMap(docName, collectionName);
  String ptc = "";
  String rtd = "";
  String heatersROG = "";
  String heatersR = "";
  Content c = Content();
  if (dataMap == null) {
    return false;
  }
  for (Map<String, dynamic> i in dataMap.values) {
    for (String k in i.keys) {
      if (k == "time") {
        c.add(TextContent(k, ("${i[k].day}/${i[k].month}/${i[k].year}")));
        continue;
      }
      if (k == "ptc") {
        for (String e in i[k]) {
          ptc += e + ";" + "\t";
        }
        ptc += "\n";
        c.add(TextContent("ptc", ptc));
        continue;
      }
      if (k == "rtd") {
        for (String e in i[k]) {
          rtd += e + ";" + "\t";
        }
        rtd += "\n";
        c.add(TextContent("rtd", rtd));
        continue;
      }
      if (k == "heaters") {
        for (String e in i[k]) {
          heatersR +=
              RegExp(r"(HE\d+ = +\d+\.\d+ ?(Ohm)|(kOhm))|(HE\d+ = +\d+ ?(Ohm)|(kOhm))")
                      .stringMatch(e)! +
                  ";" +
                  "\n";
          heatersROG +=
              RegExp(r"(HE\d+earth = +\d+\.\d+ ?(GOhm)|(MOhm))|(HE\d+earth = +\d+ ?(GOhm)|(MOhm))")
                      .stringMatch(e)! +
                  ";" +
                  "\n";
        }
        c.add(TextContent("heatersR", heatersR));
        c.add(TextContent("heatersROG", heatersROG));
        continue;
      } else {
        c.add(TextContent(k, i[k]));
      }
    }
  }
  final d = await docx.generate(c);
  if (d != null) {
    await writeDocx(d, "Entry form.docx", docName);
  }
  return true;
}

Future<bool> generateProtocolBefore(
    String docName, String collectionName) async {
  final dataMap = await getMap(docName, collectionName);
  if (dataMap == null) {
    return false;
  }
  ByteData data;
  if (await isMotorHighVoltage(docName)) {
    if (!await isMotorGoesOnRewinding(docName)) {
      data = await rootBundle
          .load('assets/docx/Test protocol_before_HV_accept.docx');
    } else {
      data = await rootBundle
          .load('assets/docx/Test protocol_before_HV_not_accept.docx');
    }
  } else {
    if (!await isMotorGoesOnRewinding(docName)) {
      data = await rootBundle
          .load('assets/docx/Test protocol_before_LV_accept.docx');
    } else {
      data = await rootBundle
          .load('assets/docx/Test protocol_before_LV_not_accept.docx');
    }
  }
  final bytes = data.buffer.asUint8List();
  final docx = await DocxTemplate.fromBytes(bytes);
  String heatersOnGroundTest = "";
  String heatersOnWindingTest = "";
  Content c = Content();
  for (Map<String, dynamic> i in dataMap.values) {
    for (String k in i.keys) {
      if (k == "heaters") {
        for (String e in i[k]) {
          heatersOnWindingTest +=
              RegExp(r"(HE\d+winding = +\d+\.\d+ ?GOhm)|(HE\d+winding = +\d+\.\d+ ?MOhm)|(HE\d+winding = +\d+ ?GOhm)|(HE\d+winding = +\d+ ?MOhm)")
                      .stringMatch(e)! +
                  ";" +
                  "\n";
          heatersOnGroundTest +=
              RegExp(r"(HE\d+earth = +\d+\.\d+ ?GOhm)|(HE\d+earth = +\d+\.\d+ ?MOhm)|(HE\d+earth = +\d+ ?GOhm)|(HE\d+earth = +\d+ ?MOhm)")
                      .stringMatch(e)! +
                  ";" +
                  "\n";
        }
        c.add(TextContent("heatersOnWindingTest", heatersOnWindingTest));
        c.add(TextContent("heatersOnGroundTest", heatersOnGroundTest));
        continue;
      } else {
        c.add(TextContent(k, i[k]));
      }
    }
  }
  final d = await docx.generate(c);
  if (d != null) {
    await writeDocx(d, "Test protocol before.docx", docName);
  }
  return true;
}

Future<bool> generateProtocolAfter(
    String docName, String collectionName) async {
  final dataMapIForm = await getMap(docName, "Initial form");
  final dataMapTAfter = await getMap(docName, collectionName);
  if (dataMapIForm == null || dataMapTAfter == null) {
    return false;
  }
  ByteData data;
  if (await isMotorHighVoltage(docName)) {
    data = await rootBundle.load('assets/docx/Test protocol_after_HV.docx');
  } else {
    data = await rootBundle.load('assets/docx/Test protocol_after_LV.docx');
  }
  String heatersOnGroundTest = "";
  String heatersOnWindingTest = "";
  String time = "";
  String ambient = "";
  String phaseA = "";
  String phaseB = "";
  String phaseC = "";
  String rpm = "";
  String tempNDE = "";
  String tempDE = "";
  String frameTemp = "";
  String? yellowPT = "";
  String? greenPT = "";
  String? redPT = "";
  Content c = Content();
  final bytes = data.buffer.asUint8List();
  final docx = await DocxTemplate.fromBytes(bytes);
  for (Map<String, dynamic> i in dataMapIForm.values) {
    for (String k in i.keys) {
      c.add(TextContent(k, i[k]));
    }
  }
  for (Map<String, dynamic> i in dataMapTAfter.values) {
    for (String k in i.keys) {
      if (k == "measurments") {
        for (int e = 0; e < i[k].length; e++) {
          time = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
                  RegExp(r"(Time: +\d+\.\d+)|(Time: +\d+)")
                      .stringMatch(i[k][e])!)! +
              " min";
          ambient = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
              RegExp(r"(Ambient temp: +\d+\.\d+)|(Ambient temp: +\d+)")
                  .stringMatch(i[k][e])!)!;
          phaseA = RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                  r"(Current in phase A: +\d+\.\d+ ?A)|(Current in phase A: +\d+ ?A)")
              .stringMatch(i[k][e])!)!;
          phaseB = RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                  r"(Current in phase B: +\d+\.\d+ ?A)|(Current in phase B: +\d+ ?A)")
              .stringMatch(i[k][e])!)!;
          phaseC = RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                  r"(Current in phase C: +\d+\.\d+ ?A)|(Current in phase C: +\d+ ?A)")
              .stringMatch(i[k][e])!)!;
          rpm = RegExp(r"(\d+\.\d+)|(\d+) ?RPM").stringMatch(
              RegExp(r"(RPM: +\d+\.\d+)|(RPM: +\d+) ?RPM")
                  .stringMatch(i[k][e])!)!;
          tempNDE = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
              RegExp(r"(NDE temp: +\d+\.\d+)|(NDE temp: +\d+)")
                  .stringMatch(i[k][e])!)!;
          tempDE = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
              RegExp(r"([^N]DE temp: +\d+\.\d+)|([^N]DE temp: +\d+)")
                  .stringMatch(i[k][e])!)!;
          frameTemp = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
              RegExp(r"(Frame temp: +\d+\.\d+)|(Frame temp: +\d+)")
                  .stringMatch(i[k][e])!)!;
          yellowPT = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
                  RegExp(r"(Yellow phase temp: +\d+\.\d+)|(Yellow phase temp: +\d+)")
                          .stringMatch(i[k][e]) ??
                      "") ??
              "N/A";
          greenPT = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
                  RegExp(r"(Green phase temp: +\d+\.\d+)|(Green phase temp: +\d+)")
                          .stringMatch(i[k][e]) ??
                      "") ??
              "N/A";
          redPT = RegExp(r"(\d+\.\d+)|(\d+)").stringMatch(
                  RegExp(r"(Red phase temp: +\d+\.\d+)|(Red phase temp: +\d+)")
                          .stringMatch(i[k][e]) ??
                      "") ??
              "N/A";
          c.add(TextContent("time$e", time));
          c.add(TextContent("ambient$e", ambient));
          c.add(TextContent("phaseA$e", phaseA));
          c.add(TextContent("phaseB$e", phaseB));
          c.add(TextContent("phaseC$e", phaseC));
          c.add(TextContent("rpm$e", rpm));
          c.add(TextContent("tempNDE$e", tempNDE));
          c.add(TextContent("tempDE$e", tempDE));
          c.add(TextContent("frameTemp$e", frameTemp));
          c.add(TextContent("yellowPT$e", yellowPT));
          c.add(TextContent("greenPT$e", greenPT));
          c.add(TextContent("redPT$e", redPT));
          continue;
        }
      }
      if (k == "heatersA") {
        for (String e in i[k]) {
          heatersOnWindingTest +=
              RegExp(r"(HE\d+winding = +\d+\.\d+ ?GOhm)|(HE\d+winding = +\d+\.\d+ ?MOhm)|(HE\d+winding = +\d+ ?GOhm)|(HE\d+winding = +\d+ ?MOhm)")
                      .stringMatch(e)! +
                  ";" +
                  "\n";
          heatersOnGroundTest +=
              RegExp(r"(HE\d+earth = +\d+\.\d+ ?GOhm)|(HE\d+earth = +\d+\.\d+ ?MOhm)|(HE\d+earth = +\d+ ?GOhm)|(HE\d+earth = +\d+ ?MOhm)")
                      .stringMatch(e)! +
                  ";" +
                  "\n";
        }
        c.add(TextContent("heatersOnWindingTest", heatersOnWindingTest));
        c.add(TextContent("heatersOnGroundTest", heatersOnGroundTest));
        continue;
      } else {
        c.add(TextContent(k, i[k]));
      }
    }
  }
  final d = await docx.generate(c);
  if (d != null) {
    await writeDocx(d, "Test protocol after.docx", docName);
  }
  return true;
}

Future<bool> generateRepairCard(String docName, String collectionName) async {
  final data = await rootBundle.load('assets/docx/repair_card.docx');
  final bytes = data.buffer.asUint8List();
  final docx = await DocxTemplate.fromBytes(bytes);
  final dataMapIForm = await getMap(docName, "Initial form");
  final dataMapRC = await getMap(docName, collectionName);
  Content c = Content();
  if (dataMapIForm == null || dataMapRC == null) {
    return false;
  }
  for (Map<String, dynamic> i in dataMapIForm.values) {
    for (String k in i.keys) {
      c.add(TextContent(k, i[k]));
      if (k == "time") {
        c.add(TextContent(k, ("${i[k].day}/${i[k].month}/${i[k].year}")));
        continue;
      }
    }
  }
  for (Map<String, dynamic> i in dataMapRC.values) {
    for (String k in i.keys) {
      c.add(TextContent(k, i[k]));
    }
  }
  final d = await docx.generate(c);
  if (d != null) {
    await writeDocx(d, "Repair card.docx", docName);
  }
  return true;
}

Future<bool> generateRewindingCard(
    String docName, String collectionName) async {
  final dataMapState = await getMap(docName, "State");
  if (!dataMapState!.keys.contains("rewindingForm")) {
    return true;
  }
  final data = await rootBundle.load('assets/docx/rewinding_card.docx');
  final bytes = data.buffer.asUint8List();
  final docx = await DocxTemplate.fromBytes(bytes);
  final dataMapIForm = await getMap(docName, "Initial form");
  final dataMapRC = await getMap(docName, collectionName);
  Content c = Content();
  if (dataMapIForm == null || dataMapRC == null) {
    return false;
  }
  for (Map<String, dynamic> i in dataMapIForm.values) {
    for (String k in i.keys) {
      if (k == "time") {
        c.add(TextContent(k, ("${i[k].day}/${i[k].month}/${i[k].year}")));
        continue;
      }
      c.add(TextContent(k, i[k]));
    }
  }
  for (Map<String, dynamic> i in dataMapRC.values) {
    for (String k in i.keys) {
      c.add(TextContent(k, i[k]));
    }
  }
  final d = await docx.generate(c);
  if (d != null) {
    await writeDocx(d, "Rewinding card.docx", docName);
  }
  return true;
}

Future<bool> generateExProofPoor(String docName) async {
  final dataMapIForm = await getMap(docName, "Initial form");
  final dataMapAR = await getMap(docName, "Test after");
  if (dataMapIForm == null || dataMapAR == null) {
    return false;
  }
  if (dataMapIForm["entryTable"]["exTypeDrop"] == "N/A") {
    return true;
  }
  if (dataMapIForm["entryTable"]["exTypeDrop"] == "de") {
    final data =
        await rootBundle.load('assets/docx/Ex proof report d motors.docx');
    final bytes = data.buffer.asUint8List();
    final docx = await DocxTemplate.fromBytes(bytes);
    Content c = Content();
    for (Map<String, dynamic> i in dataMapIForm.values) {
      for (String k in i.keys) {
        if (k == "time") {
          c.add(TextContent(k, ("${i[k].day}/${i[k].month}/${i[k].year}")));
          continue;
        }
        c.add(TextContent(k, i[k]));
      }
    }
    for (Map<String, dynamic> i in dataMapAR.values) {
      for (String k in i.keys) {
        c.add(TextContent(k, i[k]));
        if (k == "measurments") {
          c.add(TextContent(
              "phaseA3",
              RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                      r"(Current in phase A: +\d+\.\d+ ?A)|(Current in phase A: +\d+ ?A)")
                  .stringMatch(i[k][2])!)!));
          c.add(TextContent(
              "phaseB3",
              RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                      r"(Current in phase B: +\d+\.\d+ ?A)|(Current in phase B: +\d+ ?A)")
                  .stringMatch(i[k][2])!)!));
          c.add(TextContent(
              "phaseC3",
              RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                      r"(Current in phase C: +\d+\.\d+ ?A)|(Current in phase C: +\d+ ?A)")
                  .stringMatch(i[k][2])!)!));
        }
      }
    }
    final d = await docx.generate(c);
    if (d != null) {
      await writeDocx(d, "Ex proof report de NOT COMPLITED.docx", docName);
    }
  }
  if (dataMapIForm["entryTable"]["exTypeDrop"] == "nA") {
    final data =
        await rootBundle.load('assets/docx/Ex proof report n motors.docx');
    final bytes = data.buffer.asUint8List();
    final docx = await DocxTemplate.fromBytes(bytes);
    Content c = Content();
    for (Map<String, dynamic> i in dataMapIForm.values) {
      for (String k in i.keys) {
        if (k == "time") {
          c.add(TextContent(k, ("${i[k].day}/${i[k].month}/${i[k].year}")));
          continue;
        }
        if (k == "measurments") {
          c.add(TextContent(
              "phaseA3",
              RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                      r"(Current in phase A: +\d+\.\d+ ?A)|(Current in phase A: +\d+ ?A)")
                  .stringMatch(i[k][2])!)!));
          c.add(TextContent(
              "phaseB3",
              RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                      r"(Current in phase B: +\d+\.\d+ ?A)|(Current in phase B: +\d+ ?A)")
                  .stringMatch(i[k][2])!)!));
          c.add(TextContent(
              "phaseC3",
              RegExp(r"(\d+\.\d+ ?A)|(\d+ ?A)").stringMatch(RegExp(
                      r"(Current in phase C: +\d+\.\d+ ?A)|(Current in phase C: +\d+ ?A)")
                  .stringMatch(i[k][2])!)!));
        }
        c.add(TextContent(k, i[k]));
      }
    }
    for (Map<String, dynamic> i in dataMapAR.values) {
      for (String k in i.keys) {
        c.add(TextContent(k, i[k]));
      }
    }
    final d = await docx.generate(c);
    if (d != null) {
      await writeDocx(d, "Ex proof report nA NOT COMPLITED.docx", docName);
    }
  }
  return true;
}

Future<bool> isMotorHighVoltage(String docName) async {
  final dataMap = await getMap(docName, "Initial form");
  if (dataMap!["electricalMeasurement"]["highVoltage"]) {
    return true;
  } else {
    return false;
  }
}

Future<bool> isMotorGoesOnRewinding(String docName) async {
  final dataMap = await getMap(docName, "Initial form");
  if (dataMap!["electricalMeasurement"]["switchWinding"]) {
    return true;
  } else {
    return false;
  }
}
