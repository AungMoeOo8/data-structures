import 'node.dart';

class BinaryTree {
  Node? rootNode;

  BinaryTree();

  void insert(Node newNode) {
    if (rootNode == null) {
      rootNode = newNode;
    } else {
      rootNode?.insertNode(newNode);
    }
  }

  SearchResult search(int value) {
    SearchResult result = rootNode?.search(value) ?? SearchResult();
    return result;
  }
}
