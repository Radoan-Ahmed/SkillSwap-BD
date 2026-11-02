abstract final class AppEnv {
  static const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  static String get baseUrl =>
      const String.fromEnvironment('BASE_URL', defaultValue: 'https://dev-api.skillswapbd.com');
  static String get supabaseUrl => const String.fromEnvironment(
        'SUPABASE_URL',
        defaultValue: 'https://jjufcpnsluzgbbgtfsom.supabase.co',
      );
  static String get supabaseAnonKey => const String.fromEnvironment(
        'SUPABASE_ANON_KEY',
        defaultValue: 'sb_publishable_KRMlciNSYGyy3JrdyeICBw_1UtPwdLe',
      );
  static bool get isProd => flavor == 'prod';
}
