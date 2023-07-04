abstract class LoginStates{}

class InitialState extends LoginStates {}

class LoadingState extends LoginStates{}
class ErrorState extends LoginStates{
  String message;
  ErrorState(this.message);
}
class SuccessState extends LoginStates{}
