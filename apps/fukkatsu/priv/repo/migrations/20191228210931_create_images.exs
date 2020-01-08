defmodule Fukkatsu.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :file_name, :string

      timestamps()
    end

    create unique_index(:images, [:file_name])
  end
end
