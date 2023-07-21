class ServerSet {
  static const String domainNameServer = 'http://192.168.1.104:8000';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerPhoneNumber = '/api/register';
  final String loginPhoneNumber = '/api/login';
}
