import '../../services/network/IResponseModel.dart';

class BaseError<T>{
  BaseError(this.message);
  final String message;
}
