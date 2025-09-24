class AppInformation {
  static String getVersion() {
    return "3.1.2";
  }

  static String supportURL() {
    return "https://github.com/Sanmeet007/logger";
  }

  static String supportEmail() {
    return "ssanmeet007@gmail.com";
  }

  static Uri getReportLink() {
    Uri reportLink = Uri.parse('https://github.com/Sanmeet007/logger/issues');
    return reportLink;
  }

  static Uri getRepoLink() {
    Uri reportLink = Uri.parse('https://github.com/Sanmeet007/logger');
    return reportLink;
  }

  static Uri getDonationLink() {
    Uri donationLink = Uri.parse('https://buymeacoffee.com/sanmeet007');
    return donationLink;
  }
}
