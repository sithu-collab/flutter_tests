import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Equatable{
  final String street;
  final String suite;
  final String city;
  @JsonKey(name: 'zipcode')
  final String zipCode;

  LocationModel({@required this.street,@required this.suite,@required this.city,@required this.zipCode});

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [street, suite, city, zipCode];


}