import 'dart:math';
import 'dart:io';

void main(List<String> args) {
  print("=== Rock Paper Scissors Game ===");
  print('r = Rock, p = Paper, s = Scissors');
  print('Q = Quit Game');

  Random random = Random();

  while (true) {
    stdout.write("\nApna choice likho (r / q / s / q): ");

    String? userInput = stdin.readLineSync();

    if (userInput == null) {
      print('Input is blank, please input again!');

      continue;
    }

    String userChoice = userInput.trim().toLowerCase();

    if (userChoice == 'q') {
      print("Game Start! Thanks for playing!");
      break;
    }

    if (userChoice != 'r' && userChoice != 'p' && userChoice != 's') {
      print('Not Start! Please input q again!');
      continue;
    }

    List<String> options = ['r', 'p', 's'];
    String computerChoice = options[random.nextInt(3)];

    // show user choice

    if (userChoice == 'r') {
      print("Your choice is Rock!");
    } else if (computerChoice == 'p') {
      print("Your choice is paper!");
    } else {
      print("Your choice is scissors!");
    }

    if (userChoice == computerChoice) {
      print("Result equality!");
    } else if ((userChoice == 'r' && computerChoice == 's') ||
        (userChoice == 'p' && computerChoice == 'r') ||
        (userChoice == 's' && computerChoice == 'p')) {
      print("You win");
    } else {
      print('You lose!');
    }
  }
}
