import 'package:greensheart_coding_test_1/medication/medication.dart';

class MedicationManager {
  static MedicationManager? _instance;
  List<Medication> _medications;
  int _nextId = 1;

  factory MedicationManager() {
    _instance ??= MedicationManager._internal([]);
    return _instance!;
  }

  MedicationManager._internal(this._medications);

  bool addMedication(Medication med) {
    if (_medications.any((m) => m.name == med.name)) {
      throw Exception("${med.name} already exists");      
    } else {
      med.id = _nextId;
      _medications.add(med);
      _nextId += 1; 
      return true;
    }
  }

  bool removeMedication(String med) {
    Medication medication;
    for (int m = 0; m < _medications.length; m++) {
      if (_medications[m].name == med) {
        medication = _medications[m];
        return _medications.remove(medication);
      }
    }
    throw Exception("$med does not exist");
  }

  bool updateMedication(String name, int? time, int? dose) {
    for (int m = 0; m < _medications.length; m ++) {
      if (_medications[m].name == name) {
        if (time != null) {
          _medications[m].time = time;
        }
        if (dose != null) {
          _medications[m].dose = dose;
        }
        return true;
      }
    }
    throw Exception("$name does not exist");
  }

  List<Medication> getMedications() => _medications;
}