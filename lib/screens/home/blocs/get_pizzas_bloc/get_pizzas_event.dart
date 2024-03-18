part of 'get_pizzas_bloc.dart';

sealed class GetPizzasEvent extends Equatable {
  const GetPizzasEvent();

  @override
  List<Object> get props => [];
}

class GetPizzas extends GetPizzasEvent {}
