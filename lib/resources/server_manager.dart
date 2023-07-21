class ServerSet {
  static const domainNameServer = 'http://192.168.1.104:8000';
  static const userVerificationServer = '/api/verification?';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerPhoneNumber = '/api/register';
  final String loginPhoneNumber = '/api/login';
}
