void main(List<String> args) {
  final Stacks stacks = Stacks<String>();
  print(stacks.push("Sam"));
  print(stacks.push("Pavel"));
  print(stacks.push("Isaiah"));
  print(stacks.push("Isioma"));
  print(stacks.pop());
}

class Stacks<E> {
  final _list = <E>[];

  push(E value) => _list..add(value);

  E? pop() {
    if (_list.isEmpty) {
      return null;
    }
    final item = _list.last;
    _list.removeLast();
    return item;
  }

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
