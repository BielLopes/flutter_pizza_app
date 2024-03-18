import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/home/blocs/get_pizzas_bloc/get_pizzas_bloc.dart';
import 'package:pizza_app/screens/home/views/pizza_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/8.png',
              scale: 14,
            ),
            const SizedBox(width: 5),
            const Text(
              'PIZZA',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.arrow_right_to_line),
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzasBloc, GetPizzasState>(
          builder: (context, state) {
            if (state is GetPizzasSuccess) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16,
                    childAspectRatio: 9 / 16,
                  ),
                  itemCount: state.pizzas.length,
                  itemBuilder: (context, int i) {
                    return Material(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  PizzaDetailsScreen(state.pizzas[i]),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/${state.pizzas[i].picture}",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: state.pizzas[i].isVeg
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                          state.pizzas[i].isVeg
                                              ? 'VEG'
                                              : 'NON-VEG',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: state.pizzas[i].spicy == 1
                                          ? Colors.green.withOpacity(0.2)
                                          : state.pizzas[i].spicy == 2
                                              ? Colors.orange.withOpacity(0.2)
                                              : Colors.redAccent
                                                  .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        state.pizzas[i].spicy == 1
                                            ? '🌶️ BLAND'
                                            : state.pizzas[i].spicy == 2
                                                ? '🌶️ BALANCE'
                                                : '🌶️ SPICY',
                                        style: TextStyle(
                                            color: state.pizzas[i].spicy == 1
                                                ? Colors.green
                                                : state.pizzas[i].spicy == 2
                                                    ? Colors.orange
                                                    : Colors.redAccent,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                state.pizzas[i].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                state.pizzas[i].description,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'R\$${(state.pizzas[i].price * ((100.0 - state.pizzas[i].discount) / 100.0)).toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'R\$${state.pizzas[i].price.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: Colors.grey.shade500,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          CupertinoIcons.add_circled_solid),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (state is GetPizzasLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text("An error has occurred"),
              );
            }
          },
        ),
      ),
    );
  }
}
