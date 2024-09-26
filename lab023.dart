
import 'dart:io';

void main() {
  print("Enter your age:");

  try {
    String? userInput = stdin.readLineSync();

    if (userInput == null || userInput.trim().isEmpty) {
      throw FormatException("Input Nedded");
    }

    int userAge = int.parse(userInput);

    if (userAge < 0 || userAge > 120) {
      throw RangeError("Enter a valid age ranging from 0 to 120.");
    }

    int remainingYears = 100 - userAge;
    if (remainingYears > 0) {
      print("You have $remainingYears years left to reach 100.");
    } else {
      print("You have already reached or you are more than 100 years of age!");
    }
  } on FormatException catch (error) {
    print("Error: ${error.message}");
  } on RangeError catch (error) {
    print("Error: ${error.message}");
  } catch (error) {
    print("Unexpected error occurred: $error");
  }
}