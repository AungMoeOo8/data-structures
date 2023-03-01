import 'utilities.dart';

class SearchResult {
  bool isFound = false;
  int searchedNodes = 0;
  int depth = 0;
  Node? node;
}

class Node {
  int value;
  Node? leftNode;
  Node? rightNode;
  int _depth = 0;

  Node({required this.value});

  void insertNode(Node newNode) {
    CompareResult compareResult = Utilities.compare(this, newNode);
    newNode._depth++;

    if (compareResult == CompareResult.isGreater ||
        compareResult == CompareResult.isEqual) {
      _checkRightNodeNullAndInsert(newNode);
    } else {
      _checkLeftNodeNullAndInsert(newNode);
    }
  }

  SearchResult search(int value) {
    SearchResult result = SearchResult();
    bool isLeftNodeChecked = false;

    result.searchedNodes++;

    if (this.value == value) {
      result.isFound = true;
      result.depth = _depth;
      result.node = this;
    }

    if (result.isFound != true) {
      if (isLeftNodeChecked == false && leftNode != null) {
        SearchResult leftResult = leftNode?.search(value) ?? SearchResult();
        result.isFound = leftResult.isFound;
        result.searchedNodes += leftResult.searchedNodes;
        result.depth = leftResult.depth;
        result.node = leftResult.node;
        isLeftNodeChecked = true;
      }
    }

    if (result.isFound != true) {
      if (rightNode != null) {
        SearchResult rightResult = rightNode?.search(value) ?? SearchResult();
        result.isFound = rightResult.isFound;
        result.searchedNodes += rightResult.searchedNodes;
        result.depth = rightResult.depth;
        result.node = rightResult.node;
      }
    }

    return result;
  }

  void _checkLeftNodeNullAndInsert(Node newNode) {
    if (leftNode != null) {
      leftNode?.insertNode(newNode);
    } else {
      leftNode = newNode;
    }
  }

  void _checkRightNodeNullAndInsert(Node newNode) {
    if (rightNode != null) {
      rightNode?.insertNode(newNode);
    } else {
      rightNode = newNode;
    }
  }
}
