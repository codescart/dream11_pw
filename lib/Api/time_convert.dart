class TimeConvert {
  static String timeLeft(int seconds) {
    int diff = seconds;

    int days = diff ~/ (24 * 60 * 60);
    diff -= days * (24 * 60 * 60);
    int hours = diff ~/ (60 * 60);
    diff -= hours * (60 * 60);
    int minutes = diff ~/ (60);
    diff -= minutes * (60);

    String result =
        "${twoDigitNumber(days)}:${twoDigitNumber(hours)}:${twoDigitNumber(minutes)}";

    return result;
  }

  static String twoDigitNumber(int? dateTimeNumber) {
    if (dateTimeNumber == null) return "0";
    return (dateTimeNumber < 9 ? "0$dateTimeNumber" : dateTimeNumber)
        .toString();
  }
}
