defmodule LondonTraffic.TrafficData.Extract.Run do
  alias LondonTraffic.TrafficData.Extract.{Parse, Request}
  alias LondonTraffic.TrafficData.TrafficData
  alias LondonTraffic.Repo

  def save_data do
    with {:ok, data} <- Request.pull,
         {:ok, parsed_data} <- Parse.parse(data) do
           changeset = TrafficData.changeset(%TrafficData{}, parsed_data)
           case Repo.insert(changeset) do
            {:ok, _} -> :ok
            {:error, _changeset} -> :error
           end
    end
  end

end
