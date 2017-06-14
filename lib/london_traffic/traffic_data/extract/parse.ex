defmodule LondonTraffic.TrafficData.Extract.Parse do
  import SweetXml

  def parse(xml_data) do
    # This takes the XML Data and parses into a map so elixir can work with the data.
    xpath(xml_data,
      ~x"//Root/Disruptions/Disruption"l,
      comments: ~x"./comments/text()",
      coordinates: [
        ~x"./CauseArea/DisplayPoint/Point",
        latitude: ~x"./coordinatesLL/text()",
        longitude: ~x"./coordinatesEN/text()"
      ],
      current_update: ~x"./currentUpdate/text()",
      end_time: ~x"./endTime/text()",
      id: ~x"./@id",
      location: ~x"./location/text()",
      severity: ~x"./severity/text()",
      status: ~x"./status/text()",
      start_time: ~x"./startTime/text()",
      sub_category: ~x"./subCategory/text()"
    )
  end
end
