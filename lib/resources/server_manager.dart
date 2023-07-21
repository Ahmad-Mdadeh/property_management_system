class ServerSet {
  static const domainNameServer = 'http://192.168.1.104:8000';
  static const userVerificationServer = '/api/verification?';
  static const showMyPropertiesServer = '/api/properties?';
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String registerPhoneNumber = '/api/register';
  final String loginPhoneNumber = '/api/login';
}
