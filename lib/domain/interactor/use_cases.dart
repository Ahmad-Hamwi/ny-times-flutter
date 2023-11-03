abstract class UseCase<Return, Params> {
  Future<Return> execute(Params params);
}