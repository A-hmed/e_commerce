abstract class RemoteDataSource {
  login(String email, String password);

  register(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phoneNumber});
}
