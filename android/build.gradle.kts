import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

// -------------------- Buildscript --------------------
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.0") // تأكد من نسخة الـ Gradle
        classpath("com.google.gms:google-services:4.4.2")
    }
}

// -------------------- All Projects Repositories --------------------
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// -------------------- Custom Build Directory --------------------
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// -------------------- Clean Task --------------------
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
