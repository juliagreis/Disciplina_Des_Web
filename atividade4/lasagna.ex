defmodule Lasagna do

  def expected_minutes_in_oven do
    40
  end
  
  def remaining_minutes_in_oven(minreais) do
    expected_minutes_in_oven()- minreais
  end
  
  def preparation_time_in_minutes(camadas) do
    camadas*2
  end
  
  def total_time_in_minutes(camadas,min) do
    preparation_time_in_minutes(camadas) + min
  end
  
  def alarm do
    "Ding!"
  end
  
end
