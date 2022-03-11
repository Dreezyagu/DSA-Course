import 'dart:collection';

void main(List<String> args) {
  final Queue queue = Queue();

  print(queue.enqueue("Sam"));
  print(queue.enqueue("Pavel"));
  print(queue.enqueue("Isioma"));
  print(queue.enqueue("Isaiah"));
  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());

  // print(queue.peek());
}

class Queue<T> {
  LinkedList linkedList = LinkedList<MyEntry>();

  peek() {
    if (linkedList.isEmpty) {
      return null;
    }
    return linkedList.first;
  }

  enqueue(String value) {
    linkedList.add(MyEntry(value));
    return linkedList;
  }

  dequeue() {
    if (linkedList.isEmpty) {
      return null;
    }
    final item = linkedList.first;
    linkedList.first.unlink();
    return item;
  }
}

class MyEntry extends LinkedListEntry<MyEntry> {
  final String id;
  MyEntry(this.id);

  @override
  String toString() {
    return '$id';
  }
}
