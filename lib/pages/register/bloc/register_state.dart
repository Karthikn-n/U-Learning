class RegisterState{
  final String userName;
  final String email;
  final String password;
  final String rePassword;
    /*
    optional named parameter we need to assign 
    the value whenever we call this constructer 
    */
  const RegisterState({
    this.userName ="", 
    this.email="", 
    this.password="", 
    this.rePassword=""});

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }){
    return RegisterState(
      userName: userName ?? this.userName, 
      email: email ?? this.email, 
      password: password ?? this.password, 
      rePassword: rePassword ?? this.rePassword
    );// 
  }
}
// Thread safe If the object is mutable object could change.
// If immutable the thread can be change but objects are not changeable.