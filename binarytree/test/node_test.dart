import 'package:binarytree/node.dart';
import 'package:test/test.dart';

void main() {
  group('Insertion:', () {
    test('root node must be 0 depth', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));

      expect(parent.search(5).depth, 0);
    });

    test('insert left node', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));

      expect(parent.leftNode?.value, 3);
      expect(parent.search(3).depth, 1);
    });

    test('insert right node', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));

      expect(parent.rightNode?.value, 7);
      expect(parent.search(7).depth, 1);
    });

    test('same value go to right node', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));
      parent.insertNode(Node(value: 7));

      expect(parent.rightNode?.rightNode?.value, 7);
    });
  });

  group('Searching:', () {
    test('search leftNode value', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));

      expect(parent.search(1).isFound, true);
      expect(parent.search(1).searchedNodes, 3);
      expect(parent.search(1).depth, 2);
    });

    test('search rightNode value', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));

      expect(parent.search(7).isFound, true);
      expect(parent.search(7).searchedNodes, 5);
      expect(parent.search(7).depth, 1);
    });

    test('unexited value should not be founded and depth should be zero', () {
      Node parent = Node(value: 5);
      parent.insertNode(Node(value: 3));
      parent.insertNode(Node(value: 1));
      parent.insertNode(Node(value: 0));
      parent.insertNode(Node(value: 7));

      expect(parent.search(9).isFound, false);
      expect(parent.search(9).searchedNodes, 5);
      expect(parent.search(9).depth, 0);
    });
  });
}
