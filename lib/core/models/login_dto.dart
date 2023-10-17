class LoginDto {
  LoginDto(this.login, this.password);

  final String login;
  final String password;

  Map toJson() => {
        "login": login,
        "password": password,
      };
}
