import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Features/Body/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

CustomButton NextButton(
    {required BuildContext context,
    required double bmi,
    required double dailyCalories}) {
  return CustomButton(
    text: "Next",
    onPressed: () async {
      try {
        // Get the current user's ID
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          throw Exception("No user is currently signed in.");
        }

        final userId = user.uid;

        // Save the data to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('userInfo')
            .doc("BMI_CAL_INFO") // Set the document ID
            .set({
          'bmi': bmi,
          'dailyCalories': dailyCalories,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Navigate to the HomeView
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } catch (e) {
        // Show an error message if something goes wrong
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    },
  );
}
