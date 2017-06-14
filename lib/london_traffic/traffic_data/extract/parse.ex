defmodule LondonTraffic.TrafficData.Extract.Parse do
  import SweetXml

  def parse(xml_data) do
    # This takes the XML Data and parses into a map so elixir can work with the data.
    data = xpath(xml_data,
      ~x"//Root/Disruptions/Disruption"l,
      comments: ~x"./comments/text()"s,
      current_update: ~x"./currentUpdate/text()"s,
      end_time: ~x"./endTime/text()"s,
      id: ~x"./@id"s,
      latitude: ~x"./CauseArea/DisplayPoint/Point/coordinatesLL/text()"s,
      location: ~x"./location/text()"s,
      longitude: ~x"./CauseArea/DisplayPoint/Point/coordinatesEN/text()"s,
      severity: ~x"./severity/text()"s,
      start_time: ~x"./startTime/text()"s,
      status: ~x"./status/text()"s,
      sub_category: ~x"./subCategory/text()"s
    )
    {:ok, data}
  end
end
