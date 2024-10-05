import 'package:flutter/material.dart';
import 'screens/budget_screen.dart';
import 'screens/group_size_screen.dart';
import 'screens/interests_screen.dart';
import 'screens/accommodation_screen.dart';
import 'screens/trip_duration_screen.dart';
import 'screens/destination_type_screen.dart';
import 'screens/dietary_restrictions_screen.dart';
import 'screens/transportation_screen.dart';
import 'screens/loading_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> with TickerProviderStateMixin {
  int _currentQuestion = 0;
  
  double _budget = 0;
  int _groupSize = 0;
  List<String> _interests = [];
  String _accommodation = '';
  int _tripDuration = 0;
  int _destinationType = 0;
  String _dietaryRestrictions = '';
  String _transportation = '';

  late AnimationController _controller;
  late Animation<double> _animation;


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: _buildCurrentScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: _currentQuestion < 7 ? _nextQuestion : _submit,
        child: Icon(_currentQuestion < 7 ? Icons.arrow_forward : Icons.check),
      ),
    );
  }
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Adding the post-frame callback properly inside initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
      _controller.forward(from: 0.0);
    });
  }

  void _submit() async {
  // Navigate to LoadingScreen
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoadingScreen(),
    ),
  );

  // Define your API endpoint (change the URL to match your backend)
  String apiUrl = 'http://localhost:37343/itinerary'; // Replace with your actual API URL

  // Prepare the data
  Map<String, dynamic> userInputJson = {
    'budget': _budget,
    'groupSize': _groupSize,
    'interests': _interests,
    'accommodation': _accommodation,
    'tripDuration': _tripDuration,
    'destinationType': _destinationType,
    'dietaryRestrictions': _dietaryRestrictions,
    'transportation': _transportation,
  };

  // Send the POST request
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userInputJson), // Encode the map into a JSON string
    );

    if (response.statusCode == 200) {
      // Success - handle the response here
      print('Data submitted successfully');
      print('Response: ${response.body}');
    } else {
      // Failure - handle the error here
      print('Failed to submit data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions or errors
    print('Error occurred while sending data: $e');
  }

  // Print the JSON string
  String jsonString = jsonEncode(userInputJson);
  print('User Input JSON: $jsonString');

  // Optionally, you could navigate to a result screen after receiving the response
}

  Widget _buildCurrentScreen() {
    switch (_currentQuestion) {
      case 0:
        return _backgroundScreen(0, BudgetScreen(
          budget: _budget,
          onBudgetChanged: (value) => setState(() => _budget = value),
        ));
      case 1:
        return _backgroundScreen(1, GroupSizeScreen(
          groupSize: _groupSize,
          onGroupSizeChanged: (value) => setState(() => _groupSize = value),
        ));
      case 2:
        return _backgroundScreen(2, InterestsScreen(
          interests: _interests,
          onInterestChanged: (interest, isSelected) => setState(() {
            if (isSelected) {
              if (_interests.length < 3) _interests.add(interest);
            } else {
              _interests.remove(interest);
            }
          }),
        ));
      case 3:
        return _backgroundScreen(3, AccommodationScreen(
          accommodation: _accommodation,
          onAccommodationChanged: (value) => setState(() => _accommodation = value),
        ));
      case 4:
        return _backgroundScreen(4, TripDurationScreen(
          tripDuration: _tripDuration,
          onDurationChanged: (value) => setState(() => _tripDuration = value),
        ));
      case 5:
        return _backgroundScreen(5, DestinationTypeScreen(
          destinationType: _destinationType,
          onDestinationChanged: (value) => setState(() => _destinationType = value),
        ));
      case 6:
        return _backgroundScreen(6, DietaryRestrictionsScreen(
          dietaryRestrictions: _dietaryRestrictions,
          onDietaryChanged: (value) => setState(() => _dietaryRestrictions = value),
        ));
      default:
        return _backgroundScreen(7, TransportationScreen(
          transportation: _transportation,
          onTransportationChanged: (value) => setState(() => _transportation = value),
        ));
    }
  }

  Widget _backgroundScreen(int index, Widget child) {
    return Stack(
      children: [
        Positioned.fill(
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              'assets/background${index + 1}.jpg', // Corrected asset path
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(color: Colors.black54),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(_animation),
          child: Center(child: child),
        ),
      ],
    );
  }
}
