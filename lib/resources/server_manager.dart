class ServerSet {
  static const String domainNameServer = 'http://127.0.0.1:8000/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerPhoneNumber = '/api/register?';
  final String loginPhoneNumber = '/api/login?';
}
