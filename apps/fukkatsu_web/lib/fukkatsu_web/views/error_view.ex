defmodule FukkatsuWeb.ErrorView do
  use FukkatsuWeb, :view

  alias FukkatsuWeb.Errors

  @errors [
    Errors.MissingParametersError
  ]

  # TODO: custom errors
  def render("400.json", %{reason: %{__struct__: struct} = error})
      when struct in @errors do
    %{errors: %{detail: Exception.message(error)}}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
