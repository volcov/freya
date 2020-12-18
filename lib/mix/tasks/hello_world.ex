defmodule Mix.Tasks.HelloWorld do
  @moduledoc """
  Generates a new project with a little customizations
  """
  @shortdoc "generates a new project"

  use Mix.Task

  alias Freya.FileGenerator

  @impl Mix.Task
  def run(args) do
    Mix.shell().info("Preparing to generate a new project called #{List.first(args)}")

    if Mix.shell().yes?("Are you sure?") do
      Mix.shell().cmd("mix new ../#{List.first(args)}")
      FileGenerator.generate("custom_module.ex.eex", List.first(args), "pimpao")
    end
  end
end
