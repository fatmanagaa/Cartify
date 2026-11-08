import '../comman/meta_data.dart';
import 'comman/data.dart';

class SubCategoriesResponse {
  final int? results;
  final MetaData? metadata;
  final List<Data>? data;

  SubCategoriesResponse({this.results, this.metadata, this.data});
}
