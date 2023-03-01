import 'package:binarytree/binarytree.dart';
import 'package:binarytree/node.dart';
import 'package:test/test.dart';

void main() {
  group('Insertion:', () {
    test("rootNode's leftNode should be 3", () {
      BinaryTree bt = BinaryTree();
      bt.insert(Node(value: 5));
      bt.insert(Node(value: 3));
      bt.insert(Node(value: 7));
      bt.insert(Node(value: 9));

      expect(bt.rootNode?.leftNode?.value, 3);
    });

    test("rootNode's right should be 7", () {
      BinaryTree bt = BinaryTree();
      bt.insert(Node(value: 5));
      bt.insert(Node(value: 3));
      bt.insert(Node(value: 7));
      bt.insert(Node(value: 9));

      expect(bt.rootNode?.rightNode?.value, 7);
    });

    test("Equal value should go to rightNode", () {
      BinaryTree bt = BinaryTree();
      bt.insert(Node(value: 5));
      bt.insert(Node(value: 3));
      bt.insert(Node(value: 7));
      bt.insert(Node(value: 7));
      bt.insert(Node(value: 9));

      expect(bt.rootNode?.rightNode?.rightNode?.value, 7);
    });
  });

  group('Search:', () {
    test('Inserted value should be found', () {
      BinaryTree bt = BinaryTree();
      bt.insert(Node(value: 5));
      bt.insert(Node(value: 3));
      bt.insert(Node(value: 7));
      bt.insert(Node(value: 9));

      expect(bt.search(7).isFound, true);
      expect(bt.search(7).searchedNodes, 3);
      expect(bt.search(7).depth, 1);
    });

    test('Result should be false if value does not exit', () {
      BinaryTree bt = BinaryTree();
      bt.insert(Node(value: 5));
      bt.insert(Node(value: 3));
      bt.insert(Node(value: 7));
      bt.insert(Node(value: 9));

      expect(bt.search(8).isFound, false);
      expect(bt.search(8).searchedNodes, 4);
      expect(bt.search(8).depth, 0);
    });
  });
}
