import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_exceptions.freezed.dart';

@freezed
class ActivityException with _$ActivityException{
  @Implements(Exception)
  const factory ActivityException.noCachedException() = NoCachedException;
  @Implements(Exception)
  const factory ActivityException.unknownLocalException() = UnknownLocalException;
  @Implements(Exception)
  const factory ActivityException.deletingActivityException() = DeletingActivityException;
  @Implements(Exception)
  const factory ActivityException.unknownRemoteException() = UnknownRemoteException;
  @Implements(Exception)
  const factory ActivityException.noInternetException() = NoInternetException;
  @Implements(Exception)
  const factory ActivityException.forbiddenActivityException() = ForbiddenActivityException;
}
