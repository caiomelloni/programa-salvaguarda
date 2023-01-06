abstract class ModelUtils {
  /// if nullable is null, return it, else return the nullable aplied to the option function
  static dynamic ifNullReturn(dynamic nullable, Function option) =>
      nullable == null ? nullable : option(nullable);

  static int? tryParseToInt(dynamic thing) {
    if (thing is int) return thing;

    return int.tryParse(thing);
  }
}
