defmodule RemoteControlCar do
  defstruct battery_percentage: 100, distance_driven_in_meters: 0, nickname: nil
  @type remote_control_car :: %RemoteControlCar{}
  def new() do
    Map.update!(%RemoteControlCar{}, :nickname, fn _ -> "none" end)
  end

  def new(nickname) do
    %{new() | nickname: nickname}
  end

  @spec display_distance(remote_control_car()) :: <<_::56, _::_*8>>
  def display_distance(remote_car) do
    "#{Map.fetch!(remote_car, :distance_driven_in_meters)} meters"
  end

  @spec display_battery(map :: remote_control_car()) :: <<_::64, _::_*8>>
  def display_battery(remote_car) do
    case Map.fetch!(remote_car, :battery_percentage) > 0 do
      true -> "Battery at #{Map.fetch!(remote_car, :battery_percentage)}%"
      false -> "Battery empty"
    end
  end

  @spec drive(map :: remote_control_car()) :: map :: %RemoteControlCar{}
  def drive(remote_car) do
    case Map.fetch!(remote_car, :battery_percentage) > 0 do
      true ->
        Map.update!(remote_car, :distance_driven_in_meters, &(&1 + 20))
        |> Map.update!(:battery_percentage, &(&1 - 1))

      false ->
        remote_car
    end
  end
end
