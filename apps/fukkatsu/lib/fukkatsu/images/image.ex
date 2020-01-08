defmodule Fukkatsu.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :file_name, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:file_name])
    |> validate_required([:file_name])
    |> unique_constraint(:file_name)
  end
end
