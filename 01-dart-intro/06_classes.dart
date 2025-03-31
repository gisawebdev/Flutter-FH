void main() {
  final Hero wolverine = Hero('Logan', 'Regeneracion');

  print(wolverine);
}

class Hero {
  String name;
  String power;

  Hero(String pName, String pPower) {
    name = pName;
    power = pPower;
  }
}
