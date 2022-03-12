void main(List<String> args) {
  final DynamicProgramming dynamicProgramming = DynamicProgramming();
  var fasterFib = dynamicProgramming.fibonacciMaster();

  print(dynamicProgramming.fibonacci(35));
  print(
      'we did ' + dynamicProgramming.calculations.toString() + ' calculations');
  print(fasterFib(35));
  print('we did ' +
      dynamicProgramming.calculationsMaster.toString() +
      ' calculations');
  print(dynamicProgramming.fibonacciMaster2(35));
}

class DynamicProgramming {
  //0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233...
  var calculations = 0;
  var calculationsMaster = 0;

  fibonacci(n) {
    //O(2^n)
    calculations++;

    if (n < 2) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  fibonacciMaster() {
    //O(n)
    Map cache = {};
    fib(n) {
      calculationsMaster++;
      if (cache.containsKey(n)) {
        return cache[n];
      } else {
        if (n < 2) {
          return n;
        } else {
          cache[n] = fib(n - 1) + fib(n - 2);
          return cache[n];
        }
      }
    }

    ;
    return fib;
  }

  fibonacciMaster2(n) {
    var answer = [0, 1];
    for (var i = 2; i <= n; i++) {
      answer.add(answer[i - 2] + answer[i - 1]);
    }
    return answer.removeLast();
  }
}
