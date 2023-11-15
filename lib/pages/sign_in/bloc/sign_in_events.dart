// Event is an abstract class so we use it as a abstruct class
abstract class SignInEvent{
  const SignInEvent();
}

// we need to extend the abstract class so we can use it in bloc
// for our needs that why we mentioned abstract class above.
class EmailEvent extends SignInEvent{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent{
  final String password;
  const PasswordEvent(this.password);
}
