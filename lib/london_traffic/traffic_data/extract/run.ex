defmodule LondonTraffic.TrafficData.Extract.Run do
  alias LondonTraffic.TrafficData.Extract.{Parse, Request}
  alias LondonTraffic.TrafficData.TrafficData
  alias LondonTraffic.Repo

  def save_data do
    with {:ok, data} <- Request.pull,
         {:ok, parsed_data} <- Parse.parse(data),
         {:ok, _} <- Repo.insert_all(TrafficData, parsed_data) do
           :ok
         end
  end
end
