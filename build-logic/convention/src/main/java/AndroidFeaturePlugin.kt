import com.android.build.api.dsl.LibraryExtension
import com.ulida.convention.configureAndroidCompose
import com.ulida.convention.libs
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.kotlin.dsl.configure
import org.gradle.kotlin.dsl.dependencies

class AndroidFeaturePlugin : Plugin<Project> {
    override fun apply(target: Project) {
        with(target) {
            pluginManager.apply {
                apply("naru.android.application.hilt")
            }
            extensions.configure<LibraryExtension> {
                configureAndroidCompose(this)
            }
            dependencies {
                add("implementation", project(":core:model"))
                add("implementation", project(":core:ui"))
                add("implementation", project(":core:designsystem"))
                add("implementation", project(":core:data"))
                add("implementation", project(":core:common"))
                add("implementation", project(":core:domain"))

                add("implementation", libs.findLibrary("androidx.compose.activity").get())
                add("implementation", libs.findLibrary("androidx.compose.ui").get())
                add("implementation", libs.findLibrary("androidx.compose.foundation").get())
                add("implementation", libs.findLibrary("androidx.compose.preview").get())
                add("implementation", libs.findLibrary("androidx.compose.material").get())
                add("implementation", libs.findLibrary("androidx.compose.tooling").get())
                add("implementation", libs.findLibrary("androidx.compose.navigation").get())
                add("implementation", libs.findLibrary("androidx.hilt.navigation").get())
                add("implementation", libs.findLibrary("androidx.hilt.navigation.fragment").get())
            }
        }
    }
}