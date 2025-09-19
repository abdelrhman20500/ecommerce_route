import 'package:dartz/dartz.dart';
import 'package:route_ecommerce/Core/function/api_service.dart';
import 'package:route_ecommerce/Core/utils/shared_preferences.dart';
import 'package:route_ecommerce/Features/Auth/data/models/auth_model.dart';
import 'package:route_ecommerce/Features/Auth/domain/repo/auth_repo.dart';
import '../../../../Core/utils/errors/error_message_model.dart';
import '../../../../Core/utils/errors/failure.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, AuthModel>> userLogin(
      {required String email, required String password}) async {
    var response = await apiService
        .post("auth/signin", {"email": email, "password": password});
    if (response.statusCode == 200) {
      final authModel = AuthModel.fromJson(response.data);

      /// Save token...
      SharedPref.saveToken(authModel.token!);
      print(authModel.message);
      print(authModel.token);
      print(authModel.user!.email);
      return Right(authModel);
    } else {
      final errorModel = ErrorMessageModel.fromJson(response.data);
      return Left(ServerFailure(errorModel.message));      // throw Exception('Failed to login'); // Handle error appropriately
    }
  }

  @override
  Future<Either<Failure, AuthModel>> userRegister({
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String name,
  }) async {
    try {
      var response = await apiService.post("auth/signup", {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      });
      if (response.statusCode == 201) {
        final authModel = AuthModel.fromJson(response.data);

        /// Save token...
        SharedPref.saveToken(authModel.token!);
        print("Registration successful: ${authModel.message}");
        print("Token: ${authModel.token}");
        print("User  Email: ${authModel.user!.email}");
        return Right(authModel);
      } else {
        print("Registration failed with status: ${response.statusCode}");
        final errorModel = ErrorMessageModel.fromJson(response.data);
        return Left(ServerFailure(errorModel.message));
        // return Left(
        //     Failure('Failed to register: Status code ${response.statusCode}'));
      }
    } catch (e) {
      // Return Left with Failure instead of throwing
      // return Left(Failure('Failed to register: $e'));
      // final errorModel = ErrorMessageModel.fromJson(response.data);
      return const Left(ServerFailure("Failed to register"));
    }
  }
}
