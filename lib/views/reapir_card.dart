import 'package:flutter/material.dart';
import 'package:work_shop_app/models/repair_card_model.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

class RepairCard extends StatefulWidget {
  final String docName;
  @override
  _RepairCard createState() => _RepairCard();
  const RepairCard({Key? key, required this.docName}) : super(key: key);
}

class _RepairCard extends State<RepairCard> {
  final bar = SnackBar(content: Text(Localozation.localization 
  ? "Data succesfully added"
  : "Данные успешно добавленны"));
  late final RepairCardModel _modelInstance =
      RepairCardModel(docName: widget.docName);
  final _formKeyForms = GlobalKey<FormState>();
  Future<bool?> _showWarning(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                  Localozation.localization ? "Data on that page won't be saved. Are you sure?" : "Данные на этой странице будут потерянны. Вы уверены?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(Localozation.localization ? "Yes, leave page" : "Да, покинуть страницу",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(Localozation.localization ? "No, stay on page" : "Нет, остаться на странице",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)))
              ],
            ));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final _closePage = await _showWarning(context);
        return _closePage ?? false;
      },
      child: Scaffold(
      appBar: (AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 0, 211),
        title: const Text('Edil-Oral.kz'),
      )),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Builder(
              builder: (context) => Form(
                  key: _formKeyForms,
                  child: ListView(cacheExtent: 20000000, children: [
                    
                        Center(child: Text(
                            Localozation.localization
                                ? "Reapir card"
                                : "Карта ремотного процесса",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.statorRR,
                        initialDropM: _modelInstance.statorM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Stator"
                        : "Статор",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.statorM = "NO";
                          } else {
                            _modelInstance.statorM = "";
                          }
                          setState(() {
                            _modelInstance.statorRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.statorM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.statorNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.statorCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.fanRR,
                        initialDropM: _modelInstance.fanM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Fan"
                        : "Вентилятор",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.fanM = "NO";
                          } else {
                            _modelInstance.fanM = "";
                          }
                          setState(() {
                            _modelInstance.fanRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.fanM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.fanNote = value!),
                        onSavedCBD: (value) =>
                            setState(() => _modelInstance.fanCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.fanCoverRR,
                        initialDropM: _modelInstance.fanCoverM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Fan cover"
                        : "Крышка вентилятора",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.fanCoverM = "NO";
                          } else {
                            _modelInstance.fanCoverM = "";
                          }
                          setState(() {
                            _modelInstance.fanCoverRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.fanCoverM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.fanCoverNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.fanCoverCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.ndeESRR,
                        initialDropM: _modelInstance.ndeESM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "NDE End shield"
                        : "NDE торцевой щит",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.ndeESM = "NO";
                          } else {
                            _modelInstance.ndeESM = "";
                          }
                          setState(() {
                            _modelInstance.ndeESRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.ndeESM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.ndeESNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.ndeESCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.deESRR,
                        initialDropM: _modelInstance.deESM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "DE End shield"
                        : "DE торцевой щит",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.deESM = "NO";
                          } else {
                            _modelInstance.deESM = "";
                          }
                          setState(() {
                            _modelInstance.deESRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.deESM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.deESNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.deESCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.innerBDeRR,
                        initialDropM: _modelInstance.innerBdeM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Inner bearing cap DE"
                        : "Внутренняя крышка подшибника DE",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.innerBdeM = "NO";
                          } else {
                            _modelInstance.innerBdeM = "";
                          }
                          setState(() {
                            _modelInstance.innerBDeRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.innerBdeM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.innerBdeNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.innerBdeCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.innerBNdeRR,
                        initialDropM: _modelInstance.innerBNdeM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Inner bearing cap NDE"
                        : "Внутренняя крышка подшибника NDE",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.innerBNdeM = "NO";
                          } else {
                            _modelInstance.innerBNdeM = "";
                          }
                          setState(() {
                            _modelInstance.innerBNdeRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.innerBNdeM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.innerBNdeNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.innerBNdeCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.shaftRR,
                        initialDropM: _modelInstance.shaftM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Shaft"
                        : "Вал",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.shaftM = "NO";
                          } else {
                            _modelInstance.shaftM = "";
                          }
                          setState(() {
                            _modelInstance.shaftRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.gasketsM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.shaftNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.shaftCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.slotsRR,
                        initialDropM: _modelInstance.slotsM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Slots"
                        : "Пазы",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.slotsM = "NO";
                          } else {
                            _modelInstance.slotsM = "";
                          }
                          setState(() {
                            _modelInstance.slotsRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.slotsM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.slotsNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.slotsCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.bearingRR,
                        initialDropM: _modelInstance.bearingM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Bearing"
                        : "Подшибники",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.bearingM = "NO";
                          } else {
                            _modelInstance.bearingM = "";
                          }
                          setState(() {
                            _modelInstance.bearingRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.bearingM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.bearingNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.bearingCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.rotorRR,
                        initialDropM: _modelInstance.rotorM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Rotor"
                        : "Ротор",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.rotorM = "NO";
                          } else {
                            _modelInstance.rotorM = "";
                          }
                          setState(() {
                            _modelInstance.rotorRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.rotorM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.rotorNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.rotorCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.coreRR,
                        initialDropM: _modelInstance.coreM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Core"
                        : "Сердечник",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.coreM = "NO";
                          } else {
                            _modelInstance.coreM = "";
                          }
                          setState(() {
                            _modelInstance.coreRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.coreM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.coreNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.coreCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.gasketsRR,
                        initialDropM: _modelInstance.gasketsM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Gaskets and seals"
                        : "Прокладки и сальники",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.gasketsM = "NO";
                          } else {
                            _modelInstance.gasketsM = "";
                          }
                          setState(() {
                            _modelInstance.gasketsRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.gasketsM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.gasketsNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.gasketsCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.threadRR,
                        initialDropM: _modelInstance.threadM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Thread, nuts and etc"
                        : "Резба, болты и т.д.",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.threadM = "NO";
                          } else {
                            _modelInstance.threadM = "";
                          }
                          setState(() {
                            _modelInstance.threadRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.threadM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.threadNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.threadCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.terminalBRR,
                        initialDropM: _modelInstance.terminalBM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Terminal box"
                        : "Терминальная кробка",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.terminalBM = "NO";
                          } else {
                            _modelInstance.terminalBM = "";
                          }
                          setState(() {
                            _modelInstance.terminalBRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.terminalBM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.terminalBNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.terminalBCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.enclosuresABPBRR,
                        initialDropM: _modelInstance.enclosuresABPM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Enclosures& Base plate"
                        : "Корпус и основания",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.enclosuresABPM = "NO";
                          } else {
                            _modelInstance.enclosuresABPM = "";
                          }
                          setState(() {
                            _modelInstance.enclosuresABPBRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.enclosuresABPM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.enclosuresABPNote = value!),
                        onSavedCBD: (value) => setState(() =>
                            _modelInstance.enclosuresABPCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.tempERR,
                        initialDropM: _modelInstance.tempEM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Temparuture element"
                        : "Термо элемент",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.tempEM = "NO";
                          } else {
                            _modelInstance.tempEM = "";
                          }
                          setState(() {
                            _modelInstance.tempERR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.tempEM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.tempENote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.tempEPCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.heatersRR,
                        initialDropM: _modelInstance.heatersM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Heaters"
                        : "Нагреватели",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.heatersM = "NO";
                          } else {
                            _modelInstance.heatersM = "";
                          }
                          setState(() {
                            _modelInstance.heatersRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.heatersM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.heatersNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.heatersCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.lightingsRR,
                        initialDropM: _modelInstance.lightingsM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Lightings"
                        : "Светильники",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.lightingsM = "NO";
                          } else {
                            _modelInstance.lightingsM = "";
                          }
                          setState(() {
                            _modelInstance.lightingsRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.lightingsM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.lightingsNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.lightingsCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.controlURR,
                        initialDropM: _modelInstance.controlUM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Control unit"
                        : "Панель управления",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.controlUM = "NO";
                          } else {
                            _modelInstance.controlUM = "";
                          }
                          setState(() {
                            _modelInstance.controlURR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.controlUM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.controlUNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.controlUCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.cableGERR,
                        initialDropM: _modelInstance.cableGEM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Cable gland gland entry"
                        : "Кабельный ввод",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.cableGEM = "NO";
                          } else {
                            _modelInstance.cableGEM = "";
                          }
                          setState(() {
                            _modelInstance.cableGERR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.cableGEM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.cableGENote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.cableGECByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.inspectionWRR,
                        initialDropM: _modelInstance.inspectionWM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Inspection window"
                        : "Смотровое окно",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.inspectionWM = "NO";
                          } else {
                            _modelInstance.inspectionWM = "";
                          }
                          setState(() {
                            _modelInstance.inspectionWRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.inspectionWM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.inspectionWNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.inspectionWCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.switchesRR,
                        initialDropM: _modelInstance.switchesM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Switches"
                        : "Переключатели",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.switchesM = "NO";
                          } else {
                            _modelInstance.switchesM = "";
                          }
                          setState(() {
                            _modelInstance.switchesRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.switchesM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.switchesNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.switchesCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.ballastsRR,
                        initialDropM: _modelInstance.ballastsM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Ballasts"
                        : "ПРА",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.ballastsM = "NO";
                          } else {
                            _modelInstance.ballastsM = "";
                          }
                          setState(() {
                            _modelInstance.ballastsRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.ballastsM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.ballastsNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.ballastsCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.capacitorsRR,
                        initialDropM: _modelInstance.capacitorsM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Capacitors"
                        : "Конденсаторы",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.capacitorsM = "NO";
                          } else {
                            _modelInstance.capacitorsM = "";
                          }
                          setState(() {
                            _modelInstance.capacitorsRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.capacitorsM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.capacitorsNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.capacitorsCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.relaysRR,
                        initialDropM: _modelInstance.relaysM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Relays"
                        : "Реле",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.relaysM = "NO";
                          } else {
                            _modelInstance.relaysM = "";
                          }
                          setState(() {
                            _modelInstance.relaysRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.relaysM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.relaysNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.relaysCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.lampHRR,
                        initialDropM: _modelInstance.lampHM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Lamp holders"
                        : "Паторны ламп",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.lampHM = "NO";
                          } else {
                            _modelInstance.lampHM = "";
                          }
                          setState(() {
                            _modelInstance.lampHRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.lampHM = newValue!;
                          });
                        },
                        onSavedNote: (value) =>
                            setState(() => _modelInstance.lampHNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.lampHCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.batteriesRR,
                        initialDropM: _modelInstance.batteriesM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Batteries"
                        : "Батареи",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.batteriesM = "NO";
                          } else {
                            _modelInstance.batteriesM = "";
                          }
                          setState(() {
                            _modelInstance.batteriesRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.batteriesM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.batteriesNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.batteriesCByDate = value!)),
                    
                    CommonFormForReapirProtocol(
                        initialDropRR: _modelInstance.transformersRR,
                        initialDropM: _modelInstance.transformersM,
                        iterListRR: _modelInstance.commonDropListRR,
                        iterListM: _modelInstance.commonDropListM,
                        sectionName: Localozation.localization 
                        ? "Transformers"
                        : "Трансформаторы",
                        onChangedRR: (String? newValue) {
                          if (newValue != "N/A") {
                            _modelInstance.transformersM = "NO";
                          } else {
                            _modelInstance.transformersM = "";
                          }
                          setState(() {
                            _modelInstance.transformersRR = newValue!;
                          });
                        },
                        onChangedM: (String? newValue) {
                          setState(() {
                            _modelInstance.transformersM = newValue!;
                          });
                        },
                        onSavedNote: (value) => setState(
                            () => _modelInstance.transformersNote = value!),
                        onSavedCBD: (value) => setState(
                            () => _modelInstance.transformersCByDate = value!)),
                    
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: Center(
                            child: SizedBox(
                          child: ElevatedButton(
                            child: Text(Localozation.localization 
                            ? "Save"
                            : "Сохранить"),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            onPressed: () {
                              if (_formKeyForms.currentState!.validate()) {
                                _formKeyForms.currentState!.save();
                                _modelInstance.sendData();
                                bar.show(context);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ))),
                  ])))),
    ));
  }
}
