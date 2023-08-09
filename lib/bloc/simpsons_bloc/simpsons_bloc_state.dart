part of 'simpsons_bloc_bloc.dart';

sealed class SimpsonsBlocState extends Equatable {
  const SimpsonsBlocState();
  
  @override
  List<Object> get props => [];
}

final class SimpsonsBlocInitial extends SimpsonsBlocState {}
