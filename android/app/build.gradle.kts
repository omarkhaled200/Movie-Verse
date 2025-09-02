plugins {
    id("com.android.application")
    id("kotlin-android")
    // FlutterFire Configuration
    id("com.google.gms.google-services")
    // Flutter plugin (لازم ييجي بعد android & kotlin)
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.movie_verse"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.movie_verse"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
