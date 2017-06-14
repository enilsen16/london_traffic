defmodule LondonTraffic.Repo.Migrations.CreateLondonTraffic.TrafficData.TrafficData do
  use Ecto.Migration

  def change do
    create table(:traffic_data) do
      add :name, :string
      add :comments, :text
      add :current_update, :text
      add :end_time, :utc_datetime
      add :tims_id, :integer
      add :latitude, :string
      add :location, :string
      add :longitude, :string
      add :severity, :string
      add :start_time, :utc_datetime
      add :status, :string
      add :sub_category, :string

      timestamps()
    end

  end
end
