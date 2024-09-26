import 'dart:async';

// Function to simulate retrieving weather details from a service
Future<String> retrieveWeatherDetails() async {
  // Simulate a delay of 3 seconds
  await Future.delayed(Duration(seconds: 3));

  // Simulate a successful or unsuccessful fetch
  bool fetchSuccessful = true; // Change this to false to test error handling

  if (fetchSuccessful) {
    return 'Weather Update: Clear skies, 25°C';
  } else {
    throw Exception('Unable to retrieve weather information.');
  }
}

void main() async {
  print('Starting weather data retrieval...');

  try {
    // Awaiting the retrieveWeatherDetails function
    String weatherDetails = await retrieveWeatherDetails();
    print('Weather Details: $weatherDetails');
  } catch (error) {
    // Handling any exceptions that occur during retrieval
    print('Encountered an error: $error');
  } finally {
    print('Weather data retrieval process completed.');
  }
}