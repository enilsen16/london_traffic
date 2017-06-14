defmodule LondonTraffic.Repo.Migrations.UpdateLongitudeAndLatitudeToCoordinates do
  use Ecto.Migration

  def change do
    alter table(:traffic_data) do
      remove :longitude
      remove :latitude
      
      add :coordinates, :string
    end
  end
end
