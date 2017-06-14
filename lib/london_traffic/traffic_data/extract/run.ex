defmodule LondonTraffic.TrafficData.Extract.Run do
  alias LondonTraffic.TrafficData.Extract.{Parse, Request}
  alias LondonTraffic.TrafficData.TrafficData
  alias LondonTraffic.Repo

  def save_data do
    with {:ok, data} <- Request.pull,
         {:ok, parsed_data} <- Parse.parse(data),
         {:ok, _} <- Enum.map(parsed_data, &insert_or_update_changeset/1) do
           :ok
         end
  end

  defp insert_or_update_changeset(parsed_data) do
    case Repo.get(TrafficData, Map.get(parsed_data, :tims_id)) do
      nil -> %TrafficData{}
      traffic_data -> traffic_data
    end
    |> TrafficData.changeset(parsed_data)
    |> Repo.insert_or_update()
  end
end
