import 'package:bloc_test/network/model/location_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel extends Equatable{
  final int id;
  final String title;
  final String url;

  TaskModel({@required this.id,@required this.title,@required this.url});

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [id, title, url];
}