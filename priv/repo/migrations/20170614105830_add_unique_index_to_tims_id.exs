defmodule LondonTraffic.Repo.Migrations.AddUniqueIndexToTimsId do
  use Ecto.Migration

  def change do
    create unique_index(:traffic_data, [:tims_id])
  end
end
