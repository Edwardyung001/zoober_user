import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/network/api_connection.dart';
import 'package:zoober_user_ride/feature/Splashscreen/ui/splashscreen.dart';
import 'package:zoober_user_ride/feature/auth/data/datasource/login_datasoure.dart';
import 'package:zoober_user_ride/feature/auth/data/datasource/signup_datasource.dart';
import 'package:zoober_user_ride/feature/auth/data/repository/login_repository_impl.dart';
import 'package:zoober_user_ride/feature/auth/data/repository/signup_repository_impl.dart';
import 'package:zoober_user_ride/feature/auth/domain/usecase/login_usecase.dart';
import 'package:zoober_user_ride/feature/auth/domain/usecase/signup_usecase.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/login.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/delete_favourite_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/favourite_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/fetching_profile_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/datasource/suggestion_datasource.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/repository/favourite_repository.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/repository/fetching_profile_repository_impl.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/repository/suggestion_repository_impl.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/data/repository/update_profile_repository_impl.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/favourite_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/fetching_profile_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/domain/usecase/suggestion_usecase.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/landing_screen.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/where_are_you_go_screen.dart';

import 'feature/auth/presentation/bloc/auth_bloc.dart';
import 'feature/homescreen/presentation/data/datasource/delete_account_datasource.dart';
import 'feature/homescreen/presentation/data/datasource/fetching_favourite_datasource.dart';
import 'feature/homescreen/presentation/data/datasource/update_profile_datasource.dart';
import 'feature/homescreen/presentation/data/repository/delete_account_repository_impl.dart';
import 'feature/homescreen/presentation/data/repository/delete_favourite_repository_impl.dart';
import 'feature/homescreen/presentation/data/repository/fetching_favourite_repository_impl.dart';
import 'feature/homescreen/presentation/domain/usecase/delete_account_usecase.dart';
import 'feature/homescreen/presentation/domain/usecase/delete_favourite_usecase.dart';
import 'feature/homescreen/presentation/domain/usecase/fetching_favourite_usecase.dart';
import 'feature/homescreen/presentation/domain/usecase/update_profile_usecase.dart';
import 'feature/homescreen/presentation/screen/bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final dioClient = DioClient(dio);
    final signupDatasource = SignupDatasource(dioClient);
    final signupRepository = SignupRepositoryImpl(signupDatasource);
    final signupUseCase = SignupUseCase(signupRepository);
    final loginDatasource = LoginDatasource(dioClient);
    final loginRepository = LoginRepositoryImpl(loginDatasource);
    final loginUseCase = LoginUseCase(loginRepository);
    final fetchingProfileDatasource = FetchingProfileDatasource(dioClient);
    final fetchingProfileRepository = FetchingProfileRepositoryImpl(fetchingProfileDatasource);
    final fetchingProfileUseCase = FetchingProfileUseCase(fetchingProfileRepository);
    final favouriteDatasource = FavouriteDatasource(dioClient);
    final favouriteRepository = FavouriteRepositoryImpl(favouriteDatasource);
    final favouriteUseCase = FavouriteUseCase(favouriteRepository);
    final updateProfileDatasource = UpdateProfileDatasource(dioClient);
    final updateProfileRepository = UpdateProfileRepositoryImpl(updateProfileDatasource);
    final updateProfileUseCase = UpdateProfileUseCase(updateProfileRepository);
    final fetchingFavouriteDatasource = FetchingFavouriteDatasource(dioClient);
    final fetchingFavouriteRepository = FetchingFavouriteRepositoryImpl(fetchingFavouriteDatasource);
    final fetchingFavouriteUseCase = FetchingFavouriteUseCase(fetchingFavouriteRepository);
    final suggestionDatasource = SuggestionDatasource(dioClient);
    final suggestionRepository = SuggestionRepositoryImpl(suggestionDatasource);
    final suggestionUseCase = FetchSuggestionsUseCase(suggestionRepository);
    final deleteFavouriteDatasource = DeleteFavouriteDatasource(dioClient);
    final deleteFavouriteRepository = DeleteFavouriteRepositoryImpl(deleteFavouriteDatasource);
    final deleteFavouriteUseCase = DeleteFavouriteUseCase(deleteFavouriteRepository);
    final deleteAccountDatasource = DeleteAccountDatasource(dioClient);
    final deleteAccountRepository = DeleteAccountRepositoryImpl(deleteAccountDatasource);
    final deleteAccountUseCase = DeleteAccountUseCase(deleteAccountRepository);

    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (_) => AuthBloc(signupUseCase,loginUseCase),
    ),
    BlocProvider(
    create: (_) => HomeBloc(favouriteUseCase,updateProfileUseCase,fetchingProfileUseCase,fetchingFavouriteUseCase,suggestionUseCase,deleteFavouriteUseCase,deleteAccountUseCase),
    ),
    // Add other BLoCs here if needed
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoober Ride App',
      theme: ThemeData(
        primaryColor: white,
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
        textTheme: GoogleFonts.mulishTextTheme(),
        useMaterial3: true,
      ),
      home:  Splashscreen(),
    )
    );
  }
}
