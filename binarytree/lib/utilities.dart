import 'node.dart';

enum CompareResult { isGreater, isLesser, isEqual }

class Utilities {
  static CompareResult compare(Node firstNode, Node secondNode) {
    CompareResult result = CompareResult.isLesser;
    if (secondNode.value > firstNode.value) {
      result = CompareResult.isGreater;
    } else if (secondNode.value == firstNode.value) {
      result = CompareResult.isEqual;
    } else {
      result = CompareResult.isLesser;
    }
    return result;
  }
}
