import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Features/Body/presentation/views/home_view.dart';
import 'package:e_commerce/Features/Body/presentation/views/widgets/next_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/widgets/Custom_Text_form_field.dart';
import '../../../../../core/widgets/Custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';

class TakeInfoViewBody extends StatefulWidget {
  const TakeInfoViewBody({super.key});

  @override
  _TakeInfoViewBodyState createState() => _TakeInfoViewBodyState();
}

class _TakeInfoViewBodyState extends State<TakeInfoViewBody> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String gender = 'Male';
  String activityLevel = 'Sedentary';
  double bmi = 0.0;
  double dailyCalories = 0.0;
  String bmiCategory = '';

  final Map<String, double> activityMultipliers = {
    'Sedentary': 1.2,
    'Light': 1.375,
    'Moderate': 1.55,
    'Active': 1.725,
    'Very Active': 1.9,
  };

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void calculateBMIAndCalories() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final double weight = double.tryParse(weightController.text) ?? 0;
      final double height = double.tryParse(heightController.text) ?? 0;
      final int age = int.tryParse(ageController.text) ?? 0;

      if (weight > 0 && height > 0 && age > 0) {
        final heightInMeters = height / 100;
        final bmiResult = weight / (heightInMeters * heightInMeters);

        final category = _getBMICategory(bmiResult);
        final calorieNeeds = _calculateDailyCalories(weight, height, age);

        setState(() {
          bmi = bmiResult;
          bmiCategory = category;
          dailyCalories = calorieNeeds;
        });
      }
    }
  }

  String _getBMICategory(double bmiResult) {
    if (bmiResult < 18.5) return 'Underweight';
    if (bmiResult < 25) return 'Normal';
    if (bmiResult < 30) return 'Overweight';
    return 'Obesity';
  }

  double _calculateDailyCalories(double weight, double height, int age) {
    final bmr = gender == 'Male'
        ? 10 * weight + 6.25 * height - 5 * age + 5
        : 10 * weight + 6.25 * height - 5 * age - 161;
    return bmr * (activityMultipliers[activityLevel] ?? 1.2);
  }

  Color getGaugeColor() {
    if (bmi < 18.5) return Colors.red;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "Hello", isBack: false),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildGenderDropdown(),
                const SizedBox(height: 10),
                _buildActivityLevelDropdown(),
                const SizedBox(height: 10),
                _buildInputField('Age (years)', ageController),
                const SizedBox(height: 10),
                _buildInputField('Weight (kg)', weightController),
                const SizedBox(height: 10),
                _buildInputField('Height (cm)', heightController),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: calculateBMIAndCalories,
                  text: 'Calculate BMI & Calories',
                ),
                const SizedBox(height: 20),
                if (bmi > 0) _buildResultsDisplay(),
                const SizedBox(height: 20),
                if (bmi > 0) _buildBMIGauge(),
                if (bmi > 0)
                  NextButton(
                      context: context, bmi: bmi, dailyCalories: dailyCalories),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: gender,
      items: ['Male', 'Female']
          .map((g) => DropdownMenuItem(value: g, child: Text(g)))
          .toList(),
      onChanged: (value) => setState(() => gender = value!),
      decoration: InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      icon: const Icon(Icons.arrow_drop_down_circle),
      dropdownColor: Colors.grey[100],
      style: const TextStyle(fontSize: 16, color: Colors.black),
    );
  }

  Widget _buildActivityLevelDropdown() {
    return DropdownButtonFormField<String>(
      value: activityLevel,
      items: activityMultipliers.keys
          .map((level) => DropdownMenuItem(
                value: level,
                child: Text(
                  level,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ))
          .toList(),
      onChanged: (value) => setState(() => activityLevel = value!),
      decoration: InputDecoration(
        labelText: 'Activity Level',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      icon: const Icon(Icons.arrow_drop_down_circle),
      dropdownColor: Colors.grey[100],
      style: const TextStyle(fontSize: 16, color: Colors.black),
    );
  }

  Widget _buildInputField(String hintText, TextEditingController controller) {
    return CustomTextFormField(
      hintText: hintText,
      textInputType: TextInputType.number,
      onSaved: (value) => controller.text = value ?? '',
    );
  }

  Widget _buildResultsDisplay() {
    return Column(
      children: [
        Text(
          'Your BMI: ${bmi.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'Category: $bmiCategory',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        Text(
          'Daily Calorie Needs: ${dailyCalories.toStringAsFixed(0)} kcal',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBMIGauge() {
    return SizedBox(
      height: 250,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 10,
            maximum: 40,
            ranges: <GaugeRange>[
              _buildGaugeRange(10, 16, const Color.fromARGB(255, 234, 255, 0),
                  'Underweight'),
              _buildGaugeRange(16, 25, Colors.green, 'Normal'),
              _buildGaugeRange(25, 30, Colors.orange, 'Overweight'),
              _buildGaugeRange(30, 40, Colors.red, 'Obesity'),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: bmi,
                enableAnimation: true,
                needleColor: getGaugeColor(),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  bmi > 0 ? bmi.toStringAsFixed(1) : '0.0',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                positionFactor: 0.5,
                angle: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }

  GaugeRange _buildGaugeRange(
      double start, double end, Color color, String label) {
    return GaugeRange(
      startValue: start,
      endValue: end,
      color: color,
      label: label,
      startWidth: 15,
      endWidth: 15,
    );
  }
}
