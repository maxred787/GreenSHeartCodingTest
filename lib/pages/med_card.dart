import 'package:flutter/material.dart';
import 'package:greensheart_coding_test_1/medication/medication.dart';
import 'package:greensheart_coding_test_1/medication/prescription_medication.dart';

class MedCard extends StatelessWidget {
  const MedCard({
    super.key,
    required this.med,
  });

  final Medication med;

  List<Widget> getMedDetails() {
    List<Widget> details = [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CircleAvatar(maxRadius: 15, child: Text("#${med.id}",),),
            ),
            Text(med.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.timer, color: Colors.black54,),
          ),
          Text("${med.time} days"),
        ],
      ),
      Text("Dosage: ${med.dose} mg"),
    ];
    String myClass = "${med}".split(" ")[2].replaceAll("'", "");

    // check if object is of class PrescriptionMedication
    if (myClass == "PrescriptionMedication") {
      PrescriptionMedication prescriptMed = med as PrescriptionMedication;
      details.addAll([
        Text("Date: ${prescriptMed.date.day}/${prescriptMed.date.month}/${prescriptMed.date.year}"),
        Text("Instructions",
          style: TextStyle(
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, -2))
            ],
            color: Colors.transparent,
            decoration: TextDecoration.underline,
          ),
        ),
        Text("${prescriptMed.instructions}.", softWrap: true,),
        Text("Patient: ${prescriptMed.patientName}"),
        Text("Prescribed by: ${prescriptMed.prescriptionist}")
      ]);
    }
    return details;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: Card(
        color: Colors.purple[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getMedDetails(),
          ),
        ),
      ),
    );
  }
}
