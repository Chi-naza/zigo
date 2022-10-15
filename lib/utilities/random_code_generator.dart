import 'dart:math';

class RandomCodeGenerator {
  RandomCodeGenerator._();

  static RandomCodeGenerator? _instance;

  static RandomCodeGenerator? get instance {
    // ??= is null aware assignment. if the variable on the left is null, assign it what's on the right.
    _instance ??= RandomCodeGenerator._();
    return _instance;
  }

  Random random = Random();

  String generateCode(String prefix) {
    var id = random.nextInt(92143543) + 09451234356;
    return '$prefix-${id.toString().substring(0, 8)}';
  }
}
