// Modulo: nodo base con valor, arbol binario de busqueda y grafo dirigido.

abstract class Node {
  final int value;

  Node(this.value);
}

final class TreeNode extends Node {
  TreeNode(super.value);

  TreeNode? left;
  TreeNode? right;
}

final class BinaryTree {
  TreeNode? _root;
  int _count = 0;

  bool insert(int value) {
    if (_root == null) {
      _root = _newNode(value);
      return true;
    }
    TreeNode current = _root!;
    while (true) {
      if (value == current.value) {
        return true; // duplicado idempotente
      }
      if (value < current.value) {
        final TreeNode? left = current.left;
        if (left == null) {
          current.left = _newNode(value);
          return true;
        }
        current = left;
      } else {
        final TreeNode? right = current.right;
        if (right == null) {
          current.right = _newNode(value);
          return true;
        }
        current = right;
      }
    }
  }

  TreeNode _newNode(int value) {
    _count++;
    return TreeNode(value);
  }

  bool contains(int value) {
    TreeNode? current = _root;
    while (current != null) {
      if (value < current.value) {
        current = current.left;
      } else if (value > current.value) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  bool isEmpty() => _count == 0;
  int size() => _count;
}

final class _GraphNode extends Node {
  _GraphNode(super.value);

  final List<int> neighbors = <int>[];
  _GraphNode? nextVertex;
}

final class Graph {
  _GraphNode? _vertices;
  int _vertexTotal = 0;
  int _edges = 0;

  _GraphNode? _findVertex(int label) {
    _GraphNode? current = _vertices;
    while (current != null) {
      if (current.value == label) {
        return current;
      }
      current = current.nextVertex;
    }
    return null;
  }

  bool addVertex(int label) {
    if (_findVertex(label) != null) {
      return true;
    }
    _GraphNode newVertex = _GraphNode(label);
    newVertex.nextVertex = _vertices;
    _vertices = newVertex;
    _vertexTotal++;
    return true;
  }

  bool addEdge(int u, int v) {
    final _GraphNode? vertexU = _findVertex(u);
    if (vertexU == null || _findVertex(v) == null) {
      return false;
    }
    final List<int> neighbors = vertexU.neighbors;
    int position = 0;
    while (position < neighbors.length && neighbors[position] < v) {
      position++;
    }
    if (position < neighbors.length && neighbors[position] == v) {
      return true;
    }
    neighbors.insert(position, v);
    _edges++;
    return true;
  }

  bool hasEdge(int u, int v) {
    final _GraphNode? vertexU = _findVertex(u);
    if (vertexU == null) {
      return false;
    }
    final List<int> neighbors = vertexU.neighbors;
    int position = 0;
    while (position < neighbors.length && neighbors[position] < v) {
      position++;
    }
    return position < neighbors.length && neighbors[position] == v;
  }

  List<int>? getNeighbors(int u) {
    final _GraphNode? vertexU = _findVertex(u);
    if (vertexU == null) {
      return null;
    }
    return List<int>.of(vertexU.neighbors);
  }

  bool isEmpty() => _vertexTotal == 0;
  int vertexCount() => _vertexTotal;
  int edgeCount() => _edges;
}
