defmodule LondonTraffic.TrafficData.Extract.Parse do
  import SweetXml

  def parse(xml_data) do
    # This takes the XML Data and parses into a map so elixir can work with the data.
    data = xpath(xml_data,
      ~x"//Root/Disruptions/Disruption"l,
      comments: ~x"./comments/text()",
      current_update: ~x"./currentUpdate/text()",
      end_time: ~x"./endTime/text()",
      id: ~x"./@id",
      latitude: ~x"./CauseArea/DisplayPoint/Point/coordinatesLL/text()",
      location: ~x"./location/text()",
      longitude: ~x"./CauseArea/DisplayPoint/Point/coordinatesEN/text()",
      severity: ~x"./severity/text()",
      start_time: ~x"./startTime/text()",
      status: ~x"./status/text()",
      sub_category: ~x"./subCategory/text()"
    )
    {:ok, data}
  end
end
