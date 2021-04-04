abstract class Command {
  Future<void> call(List<String> arguments);
}
