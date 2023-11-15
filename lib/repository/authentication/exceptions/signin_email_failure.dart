class SigninEmailPasswordFailure {
  final String message;
  const SigninEmailPasswordFailure([this.message = "an Unknown error occurred"]);
  factory SigninEmailPasswordFailure.code(String code){
    switch(code){
      case 'invalid-email':
        return const SigninEmailPasswordFailure("Thrown if the email address is not valid.");
      case 'user-disabled':
        return const SigninEmailPasswordFailure("Thrown if the user corresponding to the given email has been disabled.");
      case 'user-not-found':
        return const SigninEmailPasswordFailure("Thrown if there is no user corresponding to the given email.");
      case 'wrong-password':
        return const SigninEmailPasswordFailure("Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password");
      default:
        return const SigninEmailPasswordFailure("Rumon:Can't find probel");
    }
  }
}