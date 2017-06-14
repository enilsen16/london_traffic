defmodule LondonTraffic.TrafficData.RequestTest do
  alias LondonTraffic.TrafficData.Extract.Request, as: TrafficData
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "output from request matches correctly" do
    use_cassette "httpoison_get" do
      assert {:ok, _data} = TrafficData.pull
    end
  end
end
