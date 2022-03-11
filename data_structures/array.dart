void main() {
  Exercises exercises = Exercises();
  // print(exercises.reverseAString("My name is Ifeanyi"));
  // print(exercises.twoSum([1, 1, 3, 5], 6));
  // print(exercises.moveZeroes([0]));
  print(exercises.wordMap("I am am a boy am boy"));
}

//exercises
class Exercises {
  String reverseAString(String string) {
    if (string.length > 2) {
      // List stringMap = [];
      // for (var i = 0; i < string.length; i++) {
      //   stringMap.insert(0, string[i]);
      // }
      return string.split("").reversed.toList().join();
    }
    return string;
  }

  mergeSortedArray(List<int> list1, List<int> list2) {
    List<int> mergedList = [...list1, ...list2];
    mergedList.sort((a, b) => a.compareTo(b));
    ;
    return [...list1, ...list2]..sort();
  }

  List twoSum(List<int> list, int target) {
    List set = [];
    List complements = [];

    for (var i = 0; i < list.length; i++) {
      if (complements.contains(list[i])) {
        set.add(list.indexOf(target - list[i]));
        set.add(list.indexOf(list[i]));
        break;
      }
      complements.add(target - list[i]);
    }
    return set;
  }

  wordMap(String sentence) {
    final List<String> sentenceList = sentence.split(" ");
    final Map<String, int> map = {};

    for (var word in sentenceList) {
      final count = map[word] ?? 0;
      map[word] = count + 1;
    }
    // for (var i = 0; i < sentenceList.length; i++) {
    //   final String key = sentenceList[i];
    //   final int? keyValue = map[key];
    //   if (keyValue != null) {
    //     map[key] = (keyValue + 1);
    //   } else {
    //     map[key] = 1;
    //   }
    // }
    return map;
  }

  List moveZeroes(List<int> list) {
    final length = list.length;
    for (var i = 0; i < length; i++) {
      if (list[i] == 0) {
        list.add(list[i]);
        list.removeAt(i);
      }
    }
    return list;
  }
} //O(n+m)

// create your own array
class MyArray {
  int length;
  Map? data;
  MyArray({this.length = 0, this.data});

  get(index) {
    if (data == null) data = {};
    return data?[index];
  }

  push(item) {
    if (data == null) data = {};
    data?[length] = item;
    length++;
    return length;
  }

  pop() {
    if (data == null) data = {};
    data?.remove(length - 1);
    length--;
    return data;
  }

  delete(index) {
    if (data == null) data = {};
    shiftItems(index);
  }

  void shiftItems(index) {
    for (var i = index; i < length - 1; i++) {
      data?[i] = data?[i + 1];
    }
    data?.remove(length - 1);
    length--;
  }
}
