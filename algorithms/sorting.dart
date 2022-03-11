void main(List<String> args) {
  final Sorting sorting = Sorting();
  print(sorting.quickSort([54, 90, 73, 89, 14, 65, 2, 190, 15, 70], 0, 9));
}

class Sorting {
  bubbleSort(List<int> array) {
    final length = array.length;
    for (var i = 0; i < length; i++) {
      for (var j = 0; j < length - 1; j++) {
        if (array[j] > array[j + 1]) {
          final temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;
          // print(array);
        }
      }
    }
    return array;
  }

  selectionSort(List<int> array) {
    final length = array.length;
    for (var i = 0; i < length; i++) {
      int smallest = i;
      final temp = array[i];

      for (var j = i; j < length; j++) {
        if (array[j] < array[smallest]) {
          smallest = j;
        }
      }
      array[i] = array[smallest];
      array[smallest] = temp;
    }
    return array;
  }

  insertionSort(List<int> array) {
    final length = array.length;
    for (var i = 0; i < length; i++) {
      if (array[i] < array[0]) {
        // move to first
        final temp = array[i];
        array.remove(temp);
        array.insert(0, temp);
      } else {
        // find somewhere for it
        for (var j = 1; i < i; j++) {
          if (array[i] > array[j - 1] && array[i] < array[j]) {
            final temp = array[i];
            array.remove(temp);
            array.insert(j, temp);
          }
        }
      }
    }
    return array;
  }

  mergeSort(List<int> array) {
    final length = array.length;
    if (length == 1) {
      return array;
    }
    final middle = (length / 2).floor();
    final left = array.sublist(0, middle);
    final right = array.sublist(middle);

    return merge(mergeSort(left), mergeSort(right));
  }

  merge(List<int> left, List<int> right) {
    List<int> result = [];
    int leftIndex = 0;
    int rightIndex = 0;
    while (leftIndex < left.length && rightIndex < right.length) {
      if (left[leftIndex] < right[rightIndex]) {
        result.add(left[leftIndex]);
        leftIndex++;
      } else {
        result.add(right[rightIndex]);
        rightIndex++;
      }
    }
    return [
      ...result,
      ...left.sublist(leftIndex),
      ...right.sublist(rightIndex)
    ];
  }

  quickSort(List<int> array, int left, int right) {
    int pivot = 1;
    int partitionIndex = 1;

    if (left < right) {
      pivot = right;
      partitionIndex = partition(array, pivot, left, right);

      //sort left and right
      quickSort(array, left, partitionIndex - 1);
      quickSort(array, partitionIndex + 1, right);
    }
    return array;
  }

  partition(array, pivot, left, right) {
    int pivotValue = array[pivot];
    int partitionIndex = left;

    for (var i = left; i < right; i++) {
      if (array[i] < pivotValue) {
        swap(array, i, partitionIndex);
        partitionIndex++;
      }
    }
    swap(array, right, partitionIndex);
    return partitionIndex;
  }

  swap(array, firstIndex, secondIndex) {
    var temp = array[firstIndex];
    array[firstIndex] = array[secondIndex];
    array[secondIndex] = temp;
  }
}
