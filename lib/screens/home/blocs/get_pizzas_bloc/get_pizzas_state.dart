part of 'get_pizzas_bloc.dart';

sealed class GetPizzasState extends Equatable {
  const GetPizzasState();

  @override
  List<Object> get props => [];
}

final class GetPizzasInitial extends GetPizzasState {}

final class GetPizzasFailure extends GetPizzasState {}

final class GetPizzasLoading extends GetPizzasState {}

final class GetPizzasSuccess extends GetPizzasState {
  final List<Pizza> pizzas;

  const GetPizzasSuccess(this.pizzas);

  @override
  List<Object> get props => [pizzas];
}
