import 'package:flutter/material.dart';
import 'package:greensheart_coding_test_1/pages/med_card.dart';
import 'package:greensheart_coding_test_1/medication/medication.dart';
import 'package:greensheart_coding_test_1/medication/medication_manager.dart';
import 'package:greensheart_coding_test_1/medication/prescription_medication.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  MedicationManager medicationManager = MedicationManager();

  static final List<Medication> _meds = [
    PrescriptionMedication("Amoxicillin", 7, 500, DateTime.now(), "Take two capsules three times a day", "John Doe", "Dr John Doe"),
    PrescriptionMedication("Ibuprofen", 1, 200, DateTime.now(), "Take two tablets three times a day as needed for pain relief", "John Doe", "Dr John Doe"),
    PrescriptionMedication("Medicine A", 7, 30, DateTime.now(), "Instructions for MedicineA", "John Doe", "Dr John Doe"),
    PrescriptionMedication("Medicine B", 5, 100, DateTime.now(), "Instructions for MedicineB", "John Doe", "Dr John Doe"),
  ];

  void addMedication(med) {
    medicationManager.addMedication(med);
    setState(() {
      medicationManager = medicationManager;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Medication> medications = medicationManager.getMedications();
    if (medications.isEmpty) {
      for (var med in _meds) {
        addMedication(med);
      }
    }
    var theme = Theme.of(context);

    List<MedCard> getMedCards() {
      List<MedCard> medCards = [];
      
      for (var med in medications) {
        medCards.add(
          MedCard(med: med)
        );
      }
      return medCards;
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: theme.colorScheme.inversePrimary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Medications", style: TextStyle(fontSize: 36, fontFamily: "Urbanist"),)
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight - 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: getMedCards().isNotEmpty ? getMedCards() :
                        [
                          Text("No medications recorded")
                        ],
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      ),
      floatingActionButton: createAddMedicationButton(),
    );
  }

  FloatingActionButton createAddMedicationButton() {
    return FloatingActionButton(
      onPressed: () => {addMedication(
        PrescriptionMedication(
          "Paracetamol",
          3,
          1000,
          DateTime(2024, 10, 13, 10, 28),
          "Taken once every 4 to 6 hours if needed",
          "John Doe",
          "Dr John Doe"
        )
      )},
      tooltip: "Add a new medication",
      child: Icon(Icons.add),
    );
  }
}