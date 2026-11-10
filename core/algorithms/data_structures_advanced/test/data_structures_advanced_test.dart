import 'package:data_structures_advanced/data_structures_advanced.dart';
import 'package:test/test.dart';

// Fixtures: BST values and graph labels are positive integers taken from the
// spec; labels are values, not positions.
const int rootValue = 50;
const int lowerValue = 30;
const int higherValue = 70;
const int absentValue = 99;
const int otherAbsentValue = 98;

const int nodeValue = 10;
const int leftChildValue = 20;
const int rightChildValue = 30;

const int labelTen = 10;
const int labelThirty = 30;
const int labelFifty = 50;
const int labelSeventy = 70;

const List<int> treeBranchesInput = [50, 30, 70, 20, 40];
const List<int> treeDuplicateInput = [50, 30, 70, 30];
const List<int> treeOrderedInput = [20, 30, 40, 50, 70];

const List<int> neighboursOfThirty = [30];
const List<int> neighboursSorted = [30, 50, 70];
const List<int> neighboursOfFifty = [50];
const List<int> neighboursWithSecond = [30, 50];
const List<int> neighboursOfLoop = [10];
const List<int> noNeighbours = [];

// Shared builders: every case starts from a freshly initialised instance.
Graph graphWith(List<int> labels) {
  final Graph graph = Graph();
  for (final int label in labels) {
    expect(graph.addVertex(label), isTrue,
        reason: 'add_vertex($label) should succeed');
  }
  return graph;
}

void expectCounts(Graph graph, int vertices, int edges, String caseName) {
  expect(graph.vertexCount(), vertices,
      reason: '$caseName: vertex_count should be $vertices');
  expect(graph.edgeCount(), edges,
      reason: '$caseName: edge_count should be $edges');
}

void insertAll(BinaryTree tree, List<int> values, String caseName) {
  for (final int value in values) {
    expect(tree.insert(value), isTrue,
        reason: '$caseName: insert($value) should succeed');
  }
}

void expectAllPresent(BinaryTree tree, List<int> values, String caseName) {
  for (final int value in values) {
    expect(tree.contains(value), isTrue,
        reason: '$caseName: contains($value) should succeed');
  }
}

void suiteDataStructuresAdvancedTests() {
  group('DataStructuresAdvanced Tests', () {
    group('TreeNode', () {
      test('Create a tree node', () {
        final TreeNode node = TreeNode(nodeValue);
        expect(node.value, nodeValue,
            reason: 'TreeNode init should assign the value');
      });

      test('Absent initial links', () {
        final TreeNode node = TreeNode(nodeValue);
        expect(node.left, isNull,
            reason: 'TreeNode init should leave the left link absent');
        expect(node.right, isNull,
            reason: 'TreeNode init should leave the right link absent');
      });

      test('Link two children', () {
        final TreeNode parent = TreeNode(nodeValue);
        parent.left = TreeNode(leftChildValue);
        parent.right = TreeNode(rightChildValue);
        expect(parent.left?.value, leftChildValue,
            reason: 'set_left should link the left child 20');
        expect(parent.right?.value, rightChildValue,
            reason: 'set_right should link the right child 30');
      });

      test('Traverse each link', () {
        final TreeNode parent = TreeNode(nodeValue);
        parent.left = TreeNode(leftChildValue);
        parent.right = TreeNode(rightChildValue);
        final TreeNode? left = parent.left;
        final TreeNode? right = parent.right;
        expect(left?.value, leftChildValue,
            reason: 'following get_left should lead to 20');
        expect(right?.value, rightChildValue,
            reason: 'following get_right should lead to 30');
        expect(left?.left, isNull,
            reason: 'the left child left link should be absent');
        expect(left?.right, isNull,
            reason: 'the left child right link should be absent');
        expect(right?.left, isNull,
            reason: 'the right child left link should be absent');
        expect(right?.right, isNull,
            reason: 'the right child right link should be absent');
      });

      test('Unlink children', () {
        final TreeNode parent = TreeNode(nodeValue);
        parent.left = TreeNode(leftChildValue);
        parent.right = TreeNode(rightChildValue);

        parent.left = null;
        expect(parent.left, isNull,
            reason: 'set_left(absent) should clear the left link');
        expect(parent.value, nodeValue,
            reason: 'clearing left should preserve the value 10');
        expect(parent.right?.value, rightChildValue,
            reason: 'clearing left should preserve the right child 30');

        parent.right = null;
        expect(parent.left, isNull,
            reason: 'after clearing right the left link should be absent');
        expect(parent.right, isNull,
            reason: 'set_right(absent) should clear the right link');
        expect(parent.value, nodeValue,
            reason: 'clearing right should preserve the value 10');
      });
    });

    group('BinaryTree', () {
      test('Create empty', () {
        final BinaryTree tree = BinaryTree();
        expect(tree.isEmpty(), isTrue, reason: 'a new tree should be empty');
        expect(tree.size(), 0, reason: 'a new tree should have size 0');
        expect(tree.contains(rootValue), isFalse,
            reason: 'a new tree should not contain 50');
      });

      test('Insert the root', () {
        final BinaryTree tree = BinaryTree();
        expect(tree.insert(rootValue), isTrue,
            reason: 'insert(50) should succeed');
        expect(tree.size(), 1, reason: 'size should be 1 after the root');
        expect(tree.isEmpty(), isFalse,
            reason: 'the tree should not be empty after the root');
        expect(tree.contains(rootValue), isTrue,
            reason: 'contains(50) should succeed after insert');
      });

      test('Insert lower and higher', () {
        final BinaryTree tree = BinaryTree();
        insertAll(tree, [rootValue, lowerValue, higherValue], 'lower/higher');
        expect(tree.size(), 3, reason: 'lower/higher: size should be 3');
        expectAllPresent(
            tree, [rootValue, lowerValue, higherValue], 'lower/higher');
      });

      test('Multilevel branches', () {
        final BinaryTree tree = BinaryTree();
        insertAll(tree, treeBranchesInput, 'multilevel');
        expectAllPresent(tree, treeBranchesInput, 'multilevel');
        expect(tree.size(), 5, reason: 'multilevel: size should be 5');
      });

      test('Missing value in nonempty tree', () {
        final BinaryTree tree = BinaryTree();
        expect(tree.insert(rootValue), isTrue,
            reason: 'missing value: insert(50) should succeed');
        expect(tree.contains(absentValue), isFalse,
            reason: 'missing value: contains(99) should fail');
        expect(tree.size(), 1, reason: 'missing value: size should stay 1');
        expect(tree.contains(rootValue), isTrue,
            reason: 'missing value: contains(50) should still succeed');
      });

      test('Idempotent duplicate', () {
        final BinaryTree tree = BinaryTree();
        insertAll(tree, treeDuplicateInput, 'duplicate');
        expect(tree.size(), 3, reason: 'duplicate: size should be 3');
        expectAllPresent(
            tree, [rootValue, lowerValue, higherValue], 'duplicate');
      });

      test('Ordered insertions', () {
        final BinaryTree tree = BinaryTree();
        insertAll(tree, treeOrderedInput, 'ordered');
        expect(tree.size(), 5, reason: 'ordered: size should be 5');
        expectAllPresent(tree, treeOrderedInput, 'ordered');
        expect(tree.contains(absentValue), isFalse,
            reason: 'ordered: contains(99) should fail');
      });
    });

    group('Graph', () {
      test('Create empty', () {
        final Graph graph = Graph();
        expect(graph.isEmpty(), isTrue, reason: 'a new graph should be empty');
        expectCounts(graph, 0, 0, 'create empty');
        expect(graph.hasEdge(labelTen, labelThirty), isFalse,
            reason: 'create empty: has_edge(10,30) should fail');
        expect(graph.getNeighbors(labelTen), isNull,
            reason: 'create empty: get_neighbors(10) should fail');
      });

      test('Isolated vertex', () {
        final Graph graph = Graph();
        expect(graph.addVertex(labelTen), isTrue,
            reason: 'isolated: add_vertex(10) should succeed');
        expect(graph.isEmpty(), isFalse,
            reason: 'isolated: graph should not be empty');
        expectCounts(graph, 1, 0, 'isolated');
        expect(graph.getNeighbors(labelTen), noNeighbours,
            reason: 'isolated: neighbours of 10 should be empty');
      });

      test('Nonconsecutive labels and directed edge', () {
        final Graph graph = graphWith([labelTen, labelSeventy]);
        expect(graph.addEdge(labelTen, labelSeventy), isTrue,
            reason: 'directed: add_edge(10,70) should succeed');
        expect(graph.hasEdge(labelTen, labelSeventy), isTrue,
            reason: 'directed: has_edge(10,70) should succeed');
        expect(graph.hasEdge(labelSeventy, labelTen), isFalse,
            reason: 'directed: has_edge(70,10) should fail');
        expectCounts(graph, 2, 1, 'directed');
      });

      test('Duplicate vertex preserves adjacency', () {
        final Graph graph = graphWith([labelTen, labelThirty]);
        expect(graph.addEdge(labelTen, labelThirty), isTrue,
            reason: 'duplicate vertex: add_edge(10,30) should succeed');
        expect(graph.addVertex(labelTen), isTrue,
            reason: 'duplicate vertex: add_vertex(10) again should succeed');
        expectCounts(graph, 2, 1, 'duplicate vertex');
        expect(graph.getNeighbors(labelTen), neighboursOfThirty,
            reason: 'duplicate vertex: neighbours of 10 should be [30]');
      });

      test('Duplicate edge', () {
        final Graph graph = graphWith([labelTen, labelThirty]);
        expect(graph.addEdge(labelTen, labelThirty), isTrue,
            reason: 'duplicate edge: first add_edge(10,30) should succeed');
        expect(graph.addEdge(labelTen, labelThirty), isTrue,
            reason: 'duplicate edge: second add_edge(10,30) should succeed');
        expectCounts(graph, 2, 1, 'duplicate edge');
        expect(graph.getNeighbors(labelTen), neighboursOfThirty,
            reason: 'duplicate edge: neighbours of 10 should be [30]');
      });

      test('Missing endpoint without mutation', () {
        final Graph graph = graphWith([labelTen, labelThirty]);
        expect(graph.addEdge(labelTen, labelThirty), isTrue,
            reason: 'missing endpoint: add_edge(10,30) should succeed');
        expect(graph.addEdge(labelTen, absentValue), isFalse,
            reason: 'missing endpoint: add_edge(10,99) should fail');
        expect(graph.addEdge(absentValue, labelTen), isFalse,
            reason: 'missing endpoint: add_edge(99,10) should fail');
        expect(graph.addEdge(otherAbsentValue, absentValue), isFalse,
            reason: 'missing endpoint: add_edge(98,99) should fail');
        expect(graph.addEdge(absentValue, absentValue), isFalse,
            reason: 'missing endpoint: add_edge(99,99) should fail');
        expectCounts(graph, 2, 1, 'missing endpoint');
        expect(graph.getNeighbors(labelTen), neighboursOfThirty,
            reason: 'missing endpoint: neighbours of 10 should stay [30]');
        expect(graph.getNeighbors(labelThirty), noNeighbours,
            reason: 'missing endpoint: neighbours of 30 should be empty');
        expect(graph.hasEdge(labelTen, absentValue), isFalse,
            reason: 'missing endpoint: has_edge(10,99) should fail');
        expect(graph.hasEdge(absentValue, labelTen), isFalse,
            reason: 'missing endpoint: has_edge(99,10) should fail');
        expect(graph.hasEdge(otherAbsentValue, absentValue), isFalse,
            reason: 'missing endpoint: has_edge(98,99) should fail');
        expect(graph.hasEdge(absentValue, absentValue), isFalse,
            reason: 'missing endpoint: has_edge(99,99) should fail');
        expect(graph.getNeighbors(otherAbsentValue), isNull,
            reason: 'missing endpoint: get_neighbors(98) should fail');
        expect(graph.getNeighbors(absentValue), isNull,
            reason: 'missing endpoint: get_neighbors(99) should fail');
      });

      test('Sorted neighbours and counts', () {
        final Graph graph =
            graphWith([labelTen, labelThirty, labelFifty, labelSeventy]);
        expect(graph.addEdge(labelTen, labelSeventy), isTrue,
            reason: 'sorted: add_edge(10,70) should succeed');
        expect(graph.addEdge(labelTen, labelThirty), isTrue,
            reason: 'sorted: add_edge(10,30) should succeed');
        expect(graph.addEdge(labelTen, labelFifty), isTrue,
            reason: 'sorted: add_edge(10,50) should succeed');
        expect(graph.addEdge(labelThirty, labelFifty), isTrue,
            reason: 'sorted: add_edge(30,50) should succeed');
        expect(graph.getNeighbors(labelTen), neighboursSorted,
            reason: 'sorted: neighbours of 10 should be [30,50,70]');
        expect(graph.getNeighbors(labelThirty), neighboursOfFifty,
            reason: 'sorted: neighbours of 30 should be [50]');
        expect(graph.getNeighbors(labelFifty), noNeighbours,
            reason: 'sorted: neighbours of 50 should be empty');
        expect(graph.getNeighbors(labelSeventy), noNeighbours,
            reason: 'sorted: neighbours of 70 should be empty');
        expectCounts(graph, 4, 4, 'sorted');
      });

      test('Missing-edge query', () {
        final Graph graph = graphWith([labelTen, labelThirty]);
        expect(graph.hasEdge(labelTen, labelThirty), isFalse,
            reason: 'missing edge: has_edge(10,30) should fail');
        expectCounts(graph, 2, 0, 'missing edge');
        expect(graph.isEmpty(), isFalse,
            reason: 'missing edge: graph should not be empty');
      });

      test('Neighbours of missing vertex', () {
        final Graph graph = graphWith([labelTen]);
        expect(graph.getNeighbors(absentValue), isNull,
            reason: 'missing vertex: get_neighbors(99) should fail');
        expect(graph.getNeighbors(labelTen), noNeighbours,
            reason: 'missing vertex: empty neighbours of 10 should differ '
                'from failure');
        expectCounts(graph, 1, 0, 'missing vertex');
      });

      test('Self-loop and duplicate', () {
        final Graph graph = graphWith([labelTen]);
        expect(graph.addEdge(labelTen, labelTen), isTrue,
            reason: 'self-loop: first add_edge(10,10) should succeed');
        expect(graph.addEdge(labelTen, labelTen), isTrue,
            reason: 'self-loop: second add_edge(10,10) should succeed');
        expect(graph.hasEdge(labelTen, labelTen), isTrue,
            reason: 'self-loop: has_edge(10,10) should succeed');
        expect(graph.getNeighbors(labelTen), neighboursOfLoop,
            reason: 'self-loop: neighbours of 10 should be [10]');
        expectCounts(graph, 1, 1, 'self-loop');
      });

      test('Neighbour-result isolation', () {
        final Graph graph = graphWith([labelTen, labelThirty, labelFifty]);
        expect(graph.addEdge(labelTen, labelThirty), isTrue,
            reason: 'isolation: add_edge(10,30) should succeed');
        final List<int>? saved = graph.getNeighbors(labelTen);
        expect(saved, neighboursOfThirty,
            reason: 'isolation: saved neighbours of 10 should be [30]');

        // Dart lists are mutable, so another returned copy can be altered.
        final List<int>? copy = graph.getNeighbors(labelTen);
        expect(copy, isNotNull,
            reason: 'isolation: second neighbour query should succeed');
        copy?.add(absentValue);
        expect(graph.getNeighbors(labelTen), neighboursOfThirty,
            reason: 'isolation: changing a copy should not change the graph');
        expectCounts(graph, 3, 1, 'isolation after copy change');

        expect(graph.addEdge(labelTen, labelFifty), isTrue,
            reason: 'isolation: add_edge(10,50) should succeed');
        expect(saved, neighboursOfThirty,
            reason: 'isolation: saved result should remain [30]');
        expect(graph.getNeighbors(labelTen), neighboursWithSecond,
            reason: 'isolation: fresh neighbours of 10 should be [30,50]');
        expectCounts(graph, 3, 2, 'isolation');
      });
    });
  });
}

void main() => suiteDataStructuresAdvancedTests();
