// extension to Capitalized each first letter of sentence
extension StringExtension on String {
  String toCapitalize() {
    List<String> textList = split(" ");
    textList =
        textList.map((e) => e[0].toUpperCase() + e.substring(1)).toList();
    return textList.join(" ");
  }
}
