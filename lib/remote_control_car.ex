defmodule RemoteControlCar do
  defstruct battery_percentage: 100, distance_driven_in_meters: 0, nickname: "none"

  def new() do
    %RemoteControlCar{}
  end

  def new(nickname) do
    %{new() | nickname: nickname}
  end

  @spec display_distance(map :: %RemoteControlCar{}) :: <<_::56, _::_*8>>
  def display_distance(remote_car) do
    "#{Map.fetch!(remote_car, :distance_driven_in_meters)} meters"
  end

  def display_battery(remote_car) do
    # Please implement the display_battery/1 function
  end

  def drive(remote_car) do
    # Please implement the drive/1 function
  end
end
