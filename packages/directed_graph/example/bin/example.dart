import 'package:directed_graph/directed_graph.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:directed_graph/graph_crawler.dart';

// To run this program navigate to
// the folder 'directed_graph/example'
// in your terminal and type:
//
// # dart bin/example.dart
//
// followed by enter.
void main() {
  var a = Vertex<String>('A');
  var b = Vertex<String>('B');
  var c = Vertex<String>('C');
  var d = Vertex<String>('D');
  var e = Vertex<String>('E');
  var f = Vertex<String>('F');
  var g = Vertex<String>('G');
  var h = Vertex<String>('H');
  var i = Vertex<String>('I');
  var k = Vertex<String>('K');
  var l = Vertex<String>('L');

  int comparator(
    Vertex<String>? vertex1,
    Vertex<String>? vertex2,
  ) {
    return vertex1!.data.compareTo(vertex2!.data);
  }

  int inverseComparator(Vertex<String>? vertex1, Vertex<String>? vertex2) =>
      -comparator(vertex1, vertex2);

  // Constructing a graph from vertices.
  var graph = DirectedGraph<String>(
    {
      a: [b, h, c, e],
      b: [h],
      c: [h, g],
      d: [e, f],
      e: [g],
      f: [i],
      i: [l],
      k: [g, f]
    },
    comparator: comparator,
  );

  // Constructing a graph from data.
  // Note: Each object is converted to a vertex.
  var graphII = DirectedGraph<String>.fromData({
    'A': ['B', 'H', 'C', 'E'],
    'B': ['H'],
    'C': ['H', 'G'],
    'D': ['E', 'F'],
    'E': ['G'],
    'F': ['I'],
    'I': ['L'],
    'K': ['G', 'F'],
  }, comparator: comparator);

  final bluePen = AnsiPen()..blue(bold: true);
  final magentaPen = AnsiPen()..magenta(bold: true);

  print(magentaPen('Example Directed Graph...'));
  print(bluePen('graph.toString():'));
  print(graph);

  print(bluePen('\ngraphII.toString():'));
  print(graphII);

  print(bluePen('\nIs Acylic:'));
  print(graph.isAcyclic);

  print(bluePen('\nStrongly connected components:'));
  print(graph.stronglyConnectedComponents);

  print(bluePen('\nShortestPath(d, l):'));
  print(graph.shortestPath(d, l));

  print(bluePen('\nInDegree(C):'));
  print(graph.inDegree(c));

  print(bluePen('\nOutDegree(C)'));
  print(graph.outDegree(c));

  print(bluePen('\nVertices sorted in lexicographical order:'));
  print(graph.vertices);

  print(bluePen('\nVertices sorted in inverse lexicographical order:'));
  graph.comparator = inverseComparator;
  print(graph.vertices);
  graph.comparator = comparator;

  print(bluePen('\nInDegreeMap:'));
  print(graph.inDegreeMap);

  print(bluePen('\nSorted Topological Ordering:'));
  print(graph.sortedTopologicalOrdering);

  print(bluePen('\nTopological Ordering:'));
  print(graph.topologicalOrdering);

  print(bluePen('\nLocal Sources:'));
  print(graph.localSources);

  // Add edge to render the graph cyclic
  graph.addEdges(i, [k]);
  graph.addEdges(l, [l]);

  print(bluePen('\nCycle:'));
  print(graph.cycle);

  // Create graph crawler.
  final crawler = GraphCrawler<String>(edges: graph.edges);

  print(bluePen('\nPaths from D to L.'));
  print(crawler.paths(d, l));

  print(bluePen('\nPaths from D to I.'));
  print(crawler.paths(d, i));

  print(bluePen('\nPaths from A to H.'));
  print(crawler.paths(a, h));

  print(bluePen('\nPaths from L to L.'));
  print(crawler.paths(l, l));

  print(bluePen('\nPath from F to F.'));
  print(crawler.path(f, f));

  print(bluePen('\nPath from A to H.'));
  print(crawler.path(a, h));

  print(bluePen('\nTree with root L.'));
  print(crawler.tree(l));

  print(bluePen('\nTree with root A, target H.'));
  print(crawler.tree(a, target: h));

  print(bluePen('\nTree with root A, target G.'));
  print(crawler.tree(a, target: g));

  print(bluePen('\nPaths from L to L.'));
  print(crawler.paths(l, l));

}
