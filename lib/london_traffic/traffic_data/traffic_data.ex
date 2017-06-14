defmodule LondonTraffic.TrafficData.TrafficData do
  use Ecto.Schema
  import Ecto.Changeset
  alias LondonTraffic.TrafficData.TrafficData

  schema "traffic_data" do
    field :comments, :string
    field :current_update, :string
    field :end_time, :utc_datetime
    field :tims_id, :integer
    field :coordinates, :string
    field :location, :string
    field :name, :string
    field :severity, :string
    field :start_time, :utc_datetime
    field :status, :string
    field :sub_category, :string

    timestamps()
  end

  @doc false
  def changeset(%TrafficData{} = traffic_data, attrs) do
    traffic_data
    |> cast(attrs, [:name, :comments, :current_update, :end_time, :tims_id, :coordinates,
                    :location, :severity, :start_time, :status, :sub_category])
    |> validate_required([:comments, :current_update, :tims_id, :coordinates, :location, :severity,
                          :start_time, :status, :sub_category])
    |> unique_constraint(:tims_id)
  end
end
