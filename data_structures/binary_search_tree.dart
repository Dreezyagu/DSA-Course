void main(List<String> args) {
  final BinarySearchTree binarySearchTree = BinarySearchTree();
  binarySearchTree.insert(9);
  binarySearchTree.insert(4);
  binarySearchTree.insert(6);
  binarySearchTree.insert(20);
  binarySearchTree.insert(170);
  binarySearchTree.insert(15);
  binarySearchTree.insert(1);
  print(binarySearchTree.DFTInOrder());
  print(binarySearchTree.DFTPreOrder());
  print(binarySearchTree.DFTPostOrder());
}

class BinarySearchTree {
  Node? root;

  insert(int value) {
    if (root == null) {
      root = Node(value: value, left: null, right: null);
      return;
    } else {
      Node? currentNode = root;
      Node newNode = Node(value: value);
      while (true) {
        if (value <= currentNode!.value) {
          //left
          if (currentNode.left == null) {
            currentNode.left = newNode;
            return root;
          }
          currentNode = currentNode.left;
        } else {
          if (currentNode.right == null) {
            currentNode.right = newNode;
            return root;
          }
          currentNode = currentNode.right;
        }
      }
    }
  }

  bool lookup(int value) {
    if (root == null) {
      root = Node(value: value, left: null, right: null);
      return false;
    }
    var currentNode = root;
    while (currentNode != null) {
      if (value < currentNode.value) {
        currentNode = currentNode.left;
      } else if (value > currentNode.value) {
        currentNode = currentNode.right;
      } else if (value == currentNode.value) {
        return true;
      }
    }
    return false;
  }

  String delete(int value) {
    if (root == null) {
      root = Node(value: value, left: null, right: null);
      return "Tree empty";
    }
    var currentNode = root;
    Node? parentNode = null;
    while (currentNode != null) {
      if (value < currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (value > currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else if (value == currentNode.value) {
        // found the item to delete
        if (currentNode.right == null) {
          //no right node
          if (parentNode == null) {
            //checking if no parent node
            this.root = currentNode.left;
          } else if (parentNode.value > currentNode.value) {
            //if parent is greater than the item to delete,
            // make item left child a left child of the parent
            parentNode.left = currentNode.left;
          } else if (parentNode.value < currentNode.value) {
            //if parent is less than the item to delete,
            // make item left child a right child of the parent
            parentNode.right = currentNode.left;
          }
        } else {}
        return "Found";
      }
    }
    return "Woo e no work";
  }

  breadthFirstSearch() {
    final List<Node?> queue = [];
    final List<int> list = [];
    var currentNode = root;
    queue.add(currentNode);
    while (queue.isNotEmpty) {
      currentNode = queue.removeAt(0);
      list.add(currentNode!.value);
      if (currentNode.left != null) {
        queue.add(currentNode.left);
      }
      if (currentNode.right != null) {
        queue.add(currentNode.right);
      }
    }
    return list;
  }

  breadthFirstSearchR(List<Node?> queue, List list) {
    if (queue.length == 0) {
      return list;
    }
    var currentNode = queue.removeAt(0);
    list.add(currentNode!.value);

    if (currentNode.left != null) {
      queue.add(currentNode.left);
    }
    if (currentNode.right != null) {
      queue.add(currentNode.right);
    }

    return breadthFirstSearchR(queue, list);
  }

  DFTPreOrder() {
    return traversePreOrder(root, []);
  }

  DFTPostOrder() {
    return traversePostOrder(root, []);
  }

  DFTInOrder() {
    return traverseInOrder(root, []);
  }
}

traversePreOrder(Node? node, List list) {
  list.add(node?.value);
  if (node?.left != null) {
    traversePreOrder(node?.left, list);
  }
  if (node?.right != null) {
    traversePreOrder(node?.right, list);
  }
  return list;
}

traverseInOrder(Node? node, List list) {
  if (node?.left != null) {
    traverseInOrder(node?.left, list);
  }
  list.add(node?.value);
  if (node?.right != null) {
    traverseInOrder(node?.right, list);
  }
  return list;
}

traversePostOrder(Node? node, List list) {
  if (node?.left != null) {
    traversePostOrder(node?.left, list);
  }
  if (node?.right != null) {
    traversePostOrder(node?.right, list);
  }
  list.add(node?.value);
  return list;
}

//     9
//  4     20
//1  6  15  170

class Node {
  int value;
  Node? left;
  Node? right;

  Node({required this.value, this.left, this.right});
  @override
  String toString() => "{value: $value, left: $left, right: $right}";
}
