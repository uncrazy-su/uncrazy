import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uncrazy/data/user/user.dart';
part 'home_screen_model.freezed.dart';
part 'home_screen_model.g.dart';

@freezed
class HomeScreenModel with _$HomeScreenModel{
  const factory HomeScreenModel({
        @Default(User(0, '', '', '', '')) User user,
    })= _HomeScreenModel;

  factory HomeScreenModel.fromJson(Map<String,Object?>json)=>_$HomeScreenModelFromJson(json);
}