defmodule Freya.FileGenerator do
  def generate(template, project_name, module_name) do
    template_path = Path.join("priv/", template)
    output_path = Path.join("../#{project_name}/lib/", "#{module_name}.ex")

    IO.puts(["Writing ", module_name, " to ", output_path])

    code =
      %{module_name: module_name}
      |> render(template_path)
      |> Code.format_string!()

    File.write(output_path, code)
  end

  def render(map, template_path) do
    EEx.eval_file(template_path, options: map)
  end
end
