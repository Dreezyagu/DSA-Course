void main() {
  print(firstRecurringCharacter([1, 3, 5, 2, 7, 4, 9]));
}

int? firstRecurringCharacter(List<int> numbers) {
  final Map<int, bool> seenNumbers = {};

  for (var i = 0; i < numbers.length; i++) {  //O(n)
    if (seenNumbers[numbers[i]] == true) {  // 0(1)
      return numbers[i];
    }
    seenNumbers[numbers[i]] = true;
  }
  return null;
}
