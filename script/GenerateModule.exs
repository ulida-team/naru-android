defmodule ModuleGenerator do
  def main() do
    enteredInput = IO.gets("Enter module type and name. if you want look over types use -d: ")
    trimmedInput = String.trim(enteredInput)
    input = String.split(trimmedInput, " ")
    case Enum.at(input, 0) do
      "-d" -> description()
      "-f" -> generateFeatureModule(Enum.at(input, 1))
    end
  end

  def description() do
    IO.puts "\ntype\n-----------------------\n-f: create feature module to use many plugin "
  end

  def generateFeatureModule(moduleName) do
    IO.puts moduleName
  end
end

ModuleGenerator.main()