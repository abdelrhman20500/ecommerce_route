import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_cubit.dart';
import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_state.dart';
import 'package:route_ecommerce/Features/favorite/presentation/view/widget/favorite_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = FavoriteCubit.get(context);

    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // Use listener for side effects (e.g., showing success/failure message)
        if (state is RemoveFavoriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product removed from favorites!')),
          );
        } else if (state is RemoveFavoriteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to remove: ${state.errMessage}')),
          );
        }
      },
      builder: (context, state) {

        // --- 1. Handle Initial Loading State ---
        if (state is FavoriteLoading && favoriteCubit.currentFavoriteModel == null) {
          return const Center(child: CircularProgressIndicator(color: Color(0xff004182)));
        }

        // --- 2. Determine which model to display ---
        // Use the current state's model if available, otherwise use the locally stored one.
        final displayModel = favoriteCubit.currentFavoriteModel;

        // --- 3. Handle Empty/Failure States ---
        if (displayModel == null || displayModel.data!.isEmpty) {
          if (state is FavoriteFailure) {
            return Center(child: Text('Error loading favorites: ${state.errMessage}'));
          }
          return const Center(
            child: Text(
              "Your Favorite list is empty.",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          );
        }

        // --- 4. Display the List (Fixed against flicker) ---
        return Stack(
          children: [
            // Always show the grid view with the latest available model
            FavoriteGridView(model: displayModel),

            // Optionally show a small progress indicator on top of the list
            // if we are waiting for a network refresh (e.g., after a failure rollback)
            if (state is FavoriteLoading)
              Container(
                color: Colors.black.withOpacity(0.1),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: Color(0xff004182)),
              ),
          ],
        );
      },
    );
  }
}