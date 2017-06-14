defmodule LondonTraffic.TrafficData.Request do
  @url "https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml"

  def pull do
    case HTTPoison.get(@url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} -> {:error, 404}
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
    end
  end
end
