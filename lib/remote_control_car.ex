defmodule RemoteControlCar do
  @enforce_keys :nickname
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]
  @type remote_control_car :: %__MODULE__{}
  def new(nickname \\ "none") do
    %__MODULE__{distance_driven_in_meters: 0, battery_percentage: 100, nickname: nickname}
  end

  @spec display_distance(remote_control_car()) :: <<_::56, _::_*8>>
  def display_distance(%__MODULE__{
        distance_driven_in_meters: distance,
        battery_percentage: _,
        nickname: _
      }) do
    "#{distance} meters"
  end

  @spec display_battery(map :: remote_control_car()) :: <<_::64, _::_*8>>
  def display_battery(%__MODULE__{
        distance_driven_in_meters: _,
        battery_percentage: battery,
        nickname: _
      }) do
    case battery do
      battery when battery > 0 -> "Battery at #{battery}%"
      _ -> "Battery empty"
    end
  end

  @spec drive(map :: remote_control_car()) :: map :: %RemoteControlCar{}
  def drive(%__MODULE__{distance_driven_in_meters: _, battery_percentage: 0, nickname: _} = car),
    do: car

  def drive(%__MODULE__{
        distance_driven_in_meters: distance,
        battery_percentage: battery,
        nickname: nickname
      }) do
    %__MODULE__{
      distance_driven_in_meters: distance + 20,
      battery_percentage: battery - 1,
      nickname: nickname
    }
  end
end
