part of 'wire_bloc_bloc.dart';

sealed class WireBlocState extends Equatable {
  const WireBlocState();
  
  @override
  List<Object> get props => [];
}

final class WireBlocInitial extends WireBlocState {}
