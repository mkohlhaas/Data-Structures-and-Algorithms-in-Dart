import 'package:final_project/depth_first_search.dart';
import 'package:final_project/graph.dart';

void main() {
  depthFirstSearch();
  cycles();
}

void cycles() {
  print('\n// cycles\n');

  final graph = AdjacencyList<String>();
  // final graph = AdjacencyMatrix<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');

  graph.addEdge(a, b, edgeType: EdgeType.directed);
  graph.addEdge(a, c, edgeType: EdgeType.directed);
  graph.addEdge(c, a, edgeType: EdgeType.directed);
  graph.addEdge(b, c, edgeType: EdgeType.directed);
  graph.addEdge(c, d, edgeType: EdgeType.directed);

  print(graph);
  print('has cycle: ${graph.hasCycle(a)}');
}

void depthFirstSearch() {
  print('// depthFirstSearch\n');

  final graph = AdjacencyList<String>();
  // final graph = AdjacencyMatrix<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');

  graph.addEdge(a, b);
  graph.addEdge(a, c);
  graph.addEdge(a, d);
  graph.addEdge(b, e);
  graph.addEdge(c, g);
  graph.addEdge(e, f);
  graph.addEdge(e, h);
  graph.addEdge(f, g);
  graph.addEdge(f, c);

  final vertices = graph.depthFirstSearch(a);
  vertices.forEach(print);
}
