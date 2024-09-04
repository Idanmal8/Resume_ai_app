// ignore_for_file: constant_identifier_names

enum Degree {
  Bachlors,
  Masters,
  Phd;

//from string
  static Degree? fromString(String degree) {
    switch (degree) {
      case 'Bachlors':
        return Degree.Bachlors;
      case 'Masters':
        return Degree.Masters;
      case 'Phd':
        return Degree.Phd;
      default:
        return null;
    }
  }

  //to String
  String fromEnumToString() {
    switch (this) {
      case Degree.Bachlors:
        return 'Bachlors';
      case Degree.Masters:
        return 'Masters';
      case Degree.Phd:
        return 'Phd';
      default:
        return '';
    }
  }
}
