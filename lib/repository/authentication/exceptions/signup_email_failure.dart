
class SignUpWithEmailAndPasswordFailure{
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message = "an Unknown error occurred"]);
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Please enter Strong password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('An account already exits for that email');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation is not allowed,please contract support');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('This user has been disabled,please contract support for help');
      default:
        return const SignUpWithEmailAndPasswordFailure('rumon error');

    }
  }
}