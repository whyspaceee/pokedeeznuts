class StatsModel {
  int baseStat;
  int effort;
  String? name;
  String url;

  StatsModel(this.baseStat, this.effort, String name, this.url) {
    this.name = (name == "hp"
        ? "hp"
        : name == "attack"
            ? "atk"
            : name == "defense"
                ? "def"
                : name == "special-attack"
                    ? "s-atk"
                    : name == "special-defense"
                        ? "s-def"
                        : "spd");
  }
}
