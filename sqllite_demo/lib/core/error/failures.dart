import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final msg ;

  const Failure(this.msg);

  @override
  List<Object?> get props => [];
}
