defmodule LondonTraffic.TrafficData.Extract.Parse do
  import SweetXml

  def parse(xml_data) do
    # This takes the XML Data and parses into a map so elixir can work with the data.
    data = xpath(xml_data,
      ~x"//Root/Disruptions/Disruption"l,
      comments: ~x"./comments/text()"s,
      current_update: ~x"./currentUpdate/text()"s,
      end_time: ~x"./endTime/text()"s,
      tims_id: ~x"./@id"i,
      coordinates: ~x"./CauseArea/DisplayPoint/Point/coordinatesLL/text()"s,
      location: ~x"./location/text()"s,
      severity: ~x"./severity/text()"s,
      start_time: ~x"./startTime/text()"s,
      status: ~x"./status/text()"s,
      sub_category: ~x"./subCategory/text()"s
    )
    {:ok, data}
  end

  def strip_out_ll(coordinate_string) do
    # Expose this to other parts of the application
    # by testing a pair of values returned from the API, it's clear that longitude is first and latitude is second
    [longitude, latitude] = String.split(coordinate_string, ",")
    # Reverse the order :D
    {:ok, [latitude, longitude]}
  end
end
