# Clean Architecture With BLoC

<img src="./architecture-proposal.png" alt="Image by: ResoCoder" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

## Folder Structure

```
lib/
   src/
      app.dart                    
      core/
          error/
            exceptions.dart
            failures.darrt
          network/
            api_service.dart
            network_info.dart
          usecases/
            usecase.dart
          utils/
            constants.dart
            router.dart
            theme.dart
          widgets/
            custom_snackbar.dart                    
      l10n/
        app_en.arb
        app_id.arb
      screens/
        profile/
            data/
                datasources/
                    profile_local_datasource.dart
                    profile_remote_local_datasource.dart
                models/
                    profile_model.dart
                    profile_model.g.dart
                repositories/
                    profile_repository_impl.dart
            domain/
                entities/
                repositories/
                    profile_repository.dart
                usecases/
                    profile_usecase.dart    
            presentation/
                bloc/
                    profile_bloc.dart
                    profile_event.dart
                    profile_state.dart
                page/
                    profile.dart      
  main.dart
  injection_container.dart
```


## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
