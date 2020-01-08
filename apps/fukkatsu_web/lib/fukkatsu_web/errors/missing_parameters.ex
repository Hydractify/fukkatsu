defmodule FukkatsuWeb.Errors.MissingParametersError do
  defexception plug_status: 400, message: "missing parameters", parameters: []

  @impl Exception
  def exception(parameters \\ []) when is_list(parameters) do
    %__MODULE__{parameters: parameters}
  end

  @impl Exception
  def message(%__MODULE__{parameters: parameters}) do
    "missing parameters: #{Enum.join(parameters, ", ")}"
  end
end
