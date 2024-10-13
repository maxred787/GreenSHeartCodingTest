import 'package:greensheart_coding_test_1/medication/medication.dart';

class PrescriptionMedication extends Medication{
  DateTime _date;           // Date the medication was prescribed
  String _instructions;     // Prescription instructions
  String _patientName;      // Patient's full name
  String _prescriptionist;  // Prescriptionist's name

  PrescriptionMedication(super.name, super.time, super.dose, this._date, this._instructions, this._patientName, this._prescriptionist);

  DateTime get date => _date;
  String get instructions => _instructions;
  String get patientName => _patientName;
  String get prescriptionist => _prescriptionist;

  set date(DateTime value) {
    _date = value;
  }

  set instructions(String value) {
    _instructions = value;
  }

  set patientName(String value) {
    _patientName = value;
  }

  set prescriptionist(String value) {
    _prescriptionist = value;
  }

}