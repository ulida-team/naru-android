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
    generateIgnore()
  end

  def generateIgnore do
    #    generate ignore
    File.write(".gitignore", "/build")
    IO.puts("gitignore success")
  end
end

ModuleGenerator.main()