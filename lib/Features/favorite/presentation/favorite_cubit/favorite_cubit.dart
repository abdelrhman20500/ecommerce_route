// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
// import 'package:route_ecommerce/Features/favorite/domain/use_case/add_favorite_use_case.dart';
// import 'package:route_ecommerce/Features/favorite/domain/use_case/get_favorite_use_case.dart';
// import 'package:route_ecommerce/Features/favorite/domain/use_case/remove_favorite_use_case.dart';
// import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_state.dart';
//
// class FavoriteCubit extends Cubit<FavoriteState>{
//   FavoriteCubit(this.addFavoriteUseCase, this.removeFavoriteUseCase, this.getFavoriteUseCase): super(FavoriteInitial());
//
//   final GetFavoriteUseCase getFavoriteUseCase;
//   final AddFavoriteUseCase addFavoriteUseCase;
//   final RemoveFavoriteUseCase removeFavoriteUseCase;
//
//
//   static FavoriteCubit get(context) => BlocProvider.of(context);
//   Set<String> favoriteProductIds = {};
//
//   Future<void> getFavorite()async{
//     emit(FavoriteLoading());
//     var result = await getFavoriteUseCase.call(const NoParameters());
//     result.fold((e) {
//       emit(FavoriteFailure(errMessage: e.message));
//     }, (favoriteModel) {
//       emit(FavoriteSuccess(favoriteModel: favoriteModel));
//     });
//   }
//   Future<void> addFavorite({required String productId})async{
//     emit(AddFavoriteILoading());
//     var result = await addFavoriteUseCase.call(productId);
//     result.fold((e) {
//       emit(AddFavoriteFailure(errMessage: e.message));
//     }, (addFavoriteModel) {
//       emit(AddFavoriteSuccess(addFavoriteModel: addFavoriteModel));
//     });
//   }
//   Future<void> removeFavorite({required String productId})async{
//     emit(RemoveFavoriteILoading());
//     var result = await removeFavoriteUseCase.call(productId);
//     result.fold((e) {
//       emit(RemoveFavoriteFailure(errMessage: e.message));
//     }, (removeFavoriteModel) {
//       emit(RemoveFavoriteSuccess(removeFavoriteModel: removeFavoriteModel));
//     });
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_ecommerce/Core/base_use_case/base_use_case.dart';
import 'package:route_ecommerce/Features/favorite/data/model/favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/data/model/remove_favorite_model.dart';
import 'package:route_ecommerce/Features/favorite/domain/use_case/add_favorite_use_case.dart';
import 'package:route_ecommerce/Features/favorite/domain/use_case/get_favorite_use_case.dart';
import 'package:route_ecommerce/Features/favorite/domain/use_case/remove_favorite_use_case.dart';
import 'package:route_ecommerce/Features/favorite/presentation/favorite_cubit/favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState>{
  FavoriteCubit(this.addFavoriteUseCase, this.removeFavoriteUseCase, this.getFavoriteUseCase): super(FavoriteInitial());

  final GetFavoriteUseCase getFavoriteUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  static FavoriteCubit get(context) => BlocProvider.of(context);

  // Set for quick O(1) ID lookups on product grid screens
  Set<String> favoriteProductIds = {};

  // Storage for the currently displayed Favorite list data (Crucial for the fix)
  FavoriteModel? currentFavoriteModel;

  // ------------------------- STATUS CHECKER -------------------------

  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  // ------------------------- GET FAVORITE (Modified) -------------------------

  Future<void> getFavorite() async {
    // Only show full screen loading if we don't have existing data
    if (currentFavoriteModel == null) {
      emit(FavoriteLoading());
    }

    var result = await getFavoriteUseCase.call(const NoParameters());

    if (isClosed) return;

    result.fold((e) {
      // Only emit failure if no data is available to prevent hiding the list
      if (currentFavoriteModel == null) {
        emit(FavoriteFailure(errMessage: e.message));
      }
    }, (favoriteModel) {

      // Update local model storage
      currentFavoriteModel = favoriteModel;

      // Update ID set
      favoriteProductIds.clear();
      if (favoriteModel.data != null) {
        for (var product in favoriteModel.data!) {
          if (product.id != null) {
            favoriteProductIds.add(product.id!);
          }
        }
      }

      // Emit success with the new model
      emit(FavoriteSuccess(favoriteModel: favoriteModel));
    });
  }

  // ------------------------- TOGGLE FAVORITE (Optimistic Update Fix) -------------------------

  Future<void> toggleFavorite({required String productId}) async {
    final isFav = isFavorite(productId);

    // 1. Emit loading state for the specific action (optional)
    emit(isFav ? RemoveFavoriteILoading() : AddFavoriteILoading());

    // 2. --- OPTIMISTIC REMOVAL FIX ---
    if (isFav && currentFavoriteModel?.data != null) {
      // Remove product from the local data list instantly
      currentFavoriteModel!.data!.removeWhere((product) => product.id == productId);

      // Update local set and count
      favoriteProductIds.remove(productId);
      currentFavoriteModel!.count = favoriteProductIds.length;

      // Emit success immediately with the modified list to update the UI
      emit(FavoriteSuccess(favoriteModel: currentFavoriteModel!));

      // Also emit status update for the icon on product grid screens
      emit(FavoriteStatusUpdated());
    }

    // 3. Perform the API call in the background
    var result = isFav
        ? await removeFavoriteUseCase.call(productId)
        : await addFavoriteUseCase.call(productId);

    if (isClosed) return;

    result.fold((e) {
      // 4. On Failure (Rollback): If API fails, re-fetch correct data to rollback the optimistic change
      emit(isFav
          ? RemoveFavoriteFailure(errMessage: e.message)
          : AddFavoriteFailure(errMessage: e.message));

      // Re-fetch to ensure data integrity and rollback
      getFavorite();

    }, (model) {
      // 5. On Success:

      if (!isFav) {
        // If it was an ADD action, we must re-fetch to get the full list data
        // (Optimistic update is usually complex for ADD, so a refresh is safer)
        getFavorite();
      } else {
        // If it was a REMOVE action, the list is already updated optimistically.
        // We just emit the success state for the notification.
        emit(RemoveFavoriteSuccess(removeFavoriteModel: model as RemoveFavoriteModel));
      }
    });
  }
}
