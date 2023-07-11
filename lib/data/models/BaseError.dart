class BaseError{
  String message;
  BaseError(this.message);
}

class ExpiredTokenError extends BaseError{ExpiredTokenError(super.message);}