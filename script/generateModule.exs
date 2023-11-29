defmodule ModuleGenerator do
  def main() do
    enteredInput = IO.gets("Enter module type and name. if you want look over types use -d: ")
    trimmedInput = String.trim(enteredInput)
    input = String.split(trimmedInput, " ")
    case Enum.at(input, 0) do
      "-d" -> description()
      "-f" -> generateFeatureModule(Enum.at(input, 1))
      _ -> IO.puts "else case!!"
    end
  end

  def description() do
    IO.puts "\ntype\n-----------------------\n-f: create feature module to use many plugin "
  end

  def generateFeatureModule(moduleName) do
    IO.puts("-----------------------\nstarting generate module")
    File.cd!("..")
    File.cd!("feature")
    IO.puts("create feature module")
    File.mkdir_p!("#{moduleName}")
    File.cd!("#{moduleName}")
    IO.puts("---------------------------")
    generateIgnore()
    generateGradle()
    generateConsumer()
    generateProguard()
    generateLibs()
  end

  def generateIgnore do
    #    generate ignore
    case File.write(".gitignore", "/build") do
      :ok -> IO.puts("gitignore success")
      :error -> IO.puts("gitignore error")
    end
  end

  def generateGradle do
    #    generate build.gradle.kts
    case File.write("build.gradle.kts",
           """
        @file:Suppress("DSL_SCOPE_VIOLATION")
        plugins {
            alias(libs.plugins.naru.android.application.feature)
        }
           """)
      do
      :ok -> IO.puts("build.gradle success")
      :error -> IO.puts("build.gradle error")
    end
  end

  def generateConsumer do
    #    generate consumer-rules
    case File.write("consumer-rules.pro", "") do
      :ok -> IO.puts("consumer-rules success")
      :error -> IO.puts("consumer-rules error")
    end
  end

  def generateProguard do
    case File.write("proguard-rules.pro",
           """
           # Add project specific ProGuard rules here.
           # You can control the set of applied configuration files using the
           # proguardFiles setting in build.gradle.
           #
           # For more details, see
           #   http://developer.android.com/guide/developing/tools/proguard.html

           # If your project uses WebView with JS, uncomment the following
           # and specify the fully qualified class name to the JavaScript interface
           # class:
           #-keepclassmembers class fqcn.of.javascript.interface.for.webview {
           #   public *;
           #}

           # Uncomment this to preserve the line number information for
           # debugging stack traces.
           #-keepattributes SourceFile,LineNumberTable

           # If you keep the line number information, uncomment this to
           # hide the original source file name.
           #-renamesourcefileattribute SourceFile
           """) do
      :ok -> IO.puts("proguard success")
      :error -> IO.puts("proguard error")
    end
  end

  def generateLibs() do
    case File.mkdir_p!("libs") do
      :ok -> IO.puts("libs success")
      :error -> IO.puts("libs error")
    end
  end
end

ModuleGenerator.main()