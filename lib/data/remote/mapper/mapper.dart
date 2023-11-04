abstract class Mapper<To, From> {
  To? map(From? from);

  /// Mapper does not allow mapping lists containing nullable values
  List<To>? mapList(List<From>? from) => from?.map((e) => map(e)!).toList();
}
