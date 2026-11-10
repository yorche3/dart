// Data Structures Advanced — Node with multiple links, trees and graphs.
//
// This module declares a Node base carrying only the value, and two derived
// nodes: TreeNode (left/right links) and GraphNode (directed adjacency).
// Implementation will be provided by the implementation delegation.

abstract class Node {
  final int value;

  Node(this.value);
}

final class TreeNode extends Node {
  TreeNode(super.value);

  TreeNode? get left => null;
  TreeNode? get right => null;

  set left(TreeNode? node) {}
  set right(TreeNode? node) {}
}

final class BinaryTree {
  BinaryTree();

  bool insert(int value) => false;
  bool contains(int value) => false;
  bool isEmpty() => false;
  int size() => 0;
}

final class GraphNode extends Node {
  GraphNode(super.value);
}

final class Graph {
  Graph();

  bool addVertex(int label) => false;
  bool addEdge(int u, int v) => false;
  bool hasEdge(int u, int v) => false;
  List<int>? getNeighbors(int u) => null;
  bool isEmpty() => false;
  int vertexCount() => 0;
  int edgeCount() => 0;
}
