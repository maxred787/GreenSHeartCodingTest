# greensheart_coding_test_1

Requirements:
    - Flutter version 3.24.3
    - Android 15 or Web Browser (Chrome, Edge)

A Flutter project for GreenSHeart Internship Coding Test

Created: 12/10/24

# Assumptions
- Users can understand English
- Medication may not always be recorded by the patient
- Home page will only be displayed after user login

# Part 1

For simplicity, a bottom navigation bar is used to allow users to switch between the home page and login page.
In the login page, the users are given hints on what to input for their email. Icons are used to simplify the UI.
In the home page, different medications are displayed in cards depending on its type of medication i.e. prescription.

# Part 2

Medication is an abstract class which is inherited by the PrescriptionMediction class. It inherits the variables from the parent class
and adds new variables for a prescription.
MedicationManager is a manager class for Medication objects to be used in a Stateful Widget. This is used to update the
medications list on the home page.

# Part 3

File structure of project:
- lib/
    - main.dart (main program)
    - pages/
        - home_page.dart    (Home page of the app)
        - login_page.dart   (Login page of the app)
        - med_card.dart     (Cards containing medication information to display)
    - medication/
        - medication.dart           (contains abstract class Medication)
        - medication_manager.dart   (contains MedicationManager class for state management)
        - prescription_manager.dart (Contains PrescriptionMedication class which inherits from Medication)
- google_fonts/ (contains custom fonts from Google)

# Part 4

DNF