void main(List<String> args) {
  final Recursion recursion = Recursion();
  // print(recursion.fibonacciIterative(8));
  print(recursion.numbers..sort());
}

class Recursion {
  int product = 1;
  final List numbers = [2, 65, 13, 4, 9, 3, 56];
  int factorialRecursive(int number) {
    if (number <= 2) {
      print(number);
      return number;
    }
    if (number == 0) {
      return 1;
    }

    return number + factorialRecursive(number - 1);
  }

  factorialIterative(int number) {
    if (number == 0) {
      return 1;
    }
    int value = 1;
    for (var i = number; i > 1; i--) {
      value = i * value;
    }
    return value;
  }

  fibonacciRecursive(int index) {
    if (index < 2) {
      return index;
    }
    return fibonacciRecursive(index - 1) + fibonacciRecursive(index - 2);
  }

  fibonacciIterative(int index) {
    List<int> array = [0, 1];

    for (var i = 2; i <= index; i++) {
      array.add(array[i - 1] + array[i - 2]);
    }
    return array;
  }
}
