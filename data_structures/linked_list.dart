import 'dart:collection';

void main(List<String> args) {
  final LinkedListClass linkedListClass = LinkedListClass.init(
    10,
  );
  linkedListClass.append(5);
  linkedListClass.append(6);
  linkedListClass.append(7);
  linkedListClass.append(9);

  linkedListClass.insert(4, 8);
  print(linkedListClass.linkedList);
  linkedListClass.reverse();
  print(linkedListClass.linkedList);
}

class LinkedListClass {
  final int head;

  LinkedListClass(this.head);

  LinkedList linkedList = LinkedList<MyEntry>();

  LinkedListClass.init(this.head) {
    linkedList.add(MyEntry(head));
  }

  append(int value) {
    linkedList.add(MyEntry(value));
  }

  remove(int value) {
    final removedItem = linkedList.elementAt(value);
    linkedList.remove(removedItem);
  }

  reverse() {
    if (linkedList.length <= 1) {
      return linkedList;
    }
    // final head = linkedList.first;
    for (var i = 1; i < linkedList.length; i++) { //O(n)
      final movingElement = linkedList.elementAt(i); //O(n)
      linkedList.remove(movingElement);//O(n)
      linkedList.addFirst(movingElement);//O(1)
    }
  }

  insert(int index, int value) {
    if (index >= linkedList.length) {
      index = linkedList.length - 1;
      linkedList.elementAt(index).insertAfter(MyEntry(value));
    } else {
      linkedList.elementAt(index).insertBefore(MyEntry(value));
    }
  }
}

class MyEntry extends LinkedListEntry<MyEntry> {
  final int id;
  MyEntry(this.id);

  @override
  String toString() {
    return '$id';
  }
}
