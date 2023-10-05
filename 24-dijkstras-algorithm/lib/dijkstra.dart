import 'graph.dart';
import 'priority_queue.dart';

class Dijkstra<E> {
  final Graph<E> graph;

  Dijkstra(this.graph);

  List<Vertex<E>> shortestPath(
    Vertex<E> source,
    Vertex<E> destination, {
    Map<Vertex<E>, Pair<E>?>? paths,
  }) {
    final allPaths = paths ?? shortestPaths(source);
    if (!allPaths.containsKey(destination)) return [];
    var current = destination;
    final path = [current];
    while (current != source) {
      final previous = allPaths[current]?.prevVertex;
      if (previous == null) return [];
      path.add(previous);
      current = previous;
    }
    return path.reversed.toList();
  }

  Map<Vertex<E>, Pair<E>?> shortestPaths(Vertex<E> source) {
    final queue = PriorityQueue<Pair<E>>(priority: Priority.min);
    final visited = <Vertex<E>>{};
    final paths = <Vertex<E>, Pair<E>?>{};

    // 'paths' initialization
    for (final vertex in graph.vertices) {
      paths[vertex] = null;
    }

    queue.enqueue(Pair(0, source));
    paths[source] = Pair(0);
    visited.add(source);

    while (!queue.isEmpty) {
      final current = queue.dequeue()!;
      final savedDistance = paths[current.prevVertex]!.distance;
      if (current.distance > savedDistance) continue;
      visited.add(current.prevVertex!);
      for (final edge in graph.edges(current.prevVertex!)) {
        final neighbor = edge.destination;
        if (visited.contains(neighbor)) continue;
        final weight = edge.weight ?? double.infinity;
        final totalDistance = current.distance + weight;
        final knownDistance = paths[neighbor]?.distance ?? double.infinity;
        if (totalDistance < knownDistance) {
          paths[neighbor] = Pair(totalDistance, current.prevVertex);
          queue.enqueue(Pair(totalDistance, neighbor));
        }
      }
    }
    return paths;
  }
}

class Pair<T> implements Comparable<Pair<T>> {
  double distance;
  Vertex<T>? prevVertex;

  Pair(this.distance, [this.prevVertex]);

  @override
  int compareTo(Pair<T> other) {
    if (distance == other.distance) return 0;
    if (distance > other.distance) return 1;
    return -1;
  }

  @override
  String toString() => '($distance, $prevVertex)';
}
