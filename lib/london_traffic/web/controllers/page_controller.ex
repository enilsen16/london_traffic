defmodule LondonTraffic.Web.PageController do
  use LondonTraffic.Web, :controller

  def index(conn, _params) do
    # pull all traffic data and send it to the index template
    today = DateTime.utc_now()
    traffic_data = Repo.all(
      from t in TrafficData, where: t.end_time >= ^today or is_nil(t.end_time)
    )

    render conn, "index.html", traffic_data: encode_coords(traffic_data)
  end

# Helper Functions
  defp insert_zero(val) do
    # This is to convert the longitude and latitude coordinates from string to floats. They need a leading zero.
    cond do
      String.starts_with?(val, "-.") -> String.replace(val, "-.", "-0.")
      String.starts_with?(val, ".") -> String.replace(val, ".", "0.")
      true -> val
    end
  end

  defp encode_coords(traffic_data) do
  coords = Enum.map(traffic_data, fn x ->
      [long, lat] = String.split(x.coordinates, ",")
      long = insert_zero long
      lat = insert_zero lat

      {parsed_long, _} = Float.parse long
      {parsed_lat, _} = Float.parse lat
      %{lat: parsed_lat, lng: parsed_long}
    end)
    Poison.encode!(coords)
  end
end
