
import 'base_chart_boundry.dart';

// util class for supporting boundary operations
class Boundaries {

  // convolutes two boundaries and returns the new area as boundary
  static BaseChartBoundary convolute(
      BaseChartBoundary first, BaseChartBoundary second) {
    var newBoundary = BaseChartBoundary.empty();
    newBoundary.minX = first.minX < second.minX ? first.minX : second.minX;
    newBoundary.maxX = first.maxX > second.maxX ? first.maxX : second.maxX;
    newBoundary.minY = first.minY < second.minY ? first.minY : second.minY;
    newBoundary.maxY = first.maxY > second.maxY ? first.maxY : second.maxY;
    return newBoundary;
  }

  Boundaries._();
}
