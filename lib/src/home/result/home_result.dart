

import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_result.freezed.dart';


@freezed
class HomeREsult<T> with _$HomeREsult<T> {

factory HomeREsult.success(List<T> data) = HomeResultSuccess;
factory HomeREsult.error(String message) = HomeResultError;


}