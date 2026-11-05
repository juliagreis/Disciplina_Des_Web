defmodule KitchenCalculator do

  defp from_cup(cups) do
      cups*240
    end
    defp from_fluid_ounce(cups) do
      cups*30
    end
    defp from_tea_spoon(cups) do
      cups*5
    end
    defp from_tablespoon(cups) do
      cups*15
    end

  defp to_cup(cups) do
      cups/240
    end
    defp to_fluid_ounce(cups) do
      cups/30
    end
    defp to_tea_spoon(cups) do
      cups/5
    end
    defp to_tablespoon(cups) do
      cups/15
    end

  def get_volume(volume_pair) do
    {_,num}=volume_pair
    num
  end

  def to_milliliter(volume_pair) do

    {func,num}=volume_pair
    case func do
      :milliliter -> {:milliliter, num}
      :cup -> {:milliliter, from_cup(num)}
      :fluid_ounce -> {:milliliter,from_fluid_ounce(num)}
      :teaspoon -> {:milliliter,from_tea_spoon(num)}
      :tablespoon -> {:milliliter,from_tablespoon(num)}
    end
  end

  def from_milliliter(volume_pair, unit) do
    {_,num}=volume_pair
    case unit do
      :milliliter -> {:milliliter, num}
      :cup -> {:cup,to_cup(num)}
      :fluid_ounce -> {:fluid_ounce,to_fluid_ounce(num)}
      :teaspoon -> {:teaspoon,to_tea_spoon(num)}
      :tablespoon -> {:tablespoon,to_tablespoon(num)}
    end
  end

  def convert(volume_pair, unit) do
    {origem,num}=volume_pair
    {_,ml}=to_milliliter({origem,num})
    from_milliliter({:milliliter,ml},unit)
    
  end
end
