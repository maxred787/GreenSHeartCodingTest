abstract class Medication {
  // private attributes
  int _id = 0;
  final String _name;
  int _time; // duration to take medicine (days)
  int _dose; // dosage in milligrams (mg)

  // constructor
  Medication(this._name, this._time, this._dose);

  // ------ getters -------
  int get id => _id;

  String get name => _name;

  int get time => _time;

  int get dose => _dose;

  set id(int value) {
    _id = value;
  }

  set time(int value) {
    _time = value;
  }

  set dose(int value) {
    _dose = value;
  }
}