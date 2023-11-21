plugins {
    `kotlin-dsl`
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
    kotlinOptions {
        jvmTarget = "17"
    }
}

dependencies {
    compileOnly(libs.ksp.gradlePlugin)
    compileOnly(libs.android.gradlePlugin)
}

gradlePlugin {
    plugins {
        register("androidHiltPlugin") {
            id = "naru.android.application.hilt"
            implementationClass = "AndroidHiltPlugin"
        }
        register("androidFeature") {
            id = "naru.android.application.feature"
            implementationClass = "AndroidFeaturePlugin"
        }
    }
}