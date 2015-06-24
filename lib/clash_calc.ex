defmodule ClashCalc do
  # Expected input
  # [
  #   %{ troop: "archer", level: 1, number: 10 },
  #   %{ troop: "barb", level: 2, number: 20 },
  #   %{ troop: "giant", level: 5, number: 5 },
  #   %{ spell: "healing", level: 2, number: 1}
  # ]
  def profit?(elixir_collected, troop_list) do
    raid_cost = troop_list |> find_prices |> Enum.sum

    IO.puts "Total raid cost: #{raid_cost}"
    IO.puts "Total elixir collected: #{elixir_collected}"
    profit = raid_cost < elixir_collected
    IO.puts "Profit: #{profit}"
    profit
  end

  def find_prices(list) do
    Enum.map list, fn (troop) ->
      cond do
        Map.has_key?(troop, :troop) -> calc_total_cost(:elixir_troop, troop.troop, troop.number, troop.level)
        Map.has_key?(troop, :spell) -> calc_total_cost(:spell, troop.spell, troop.number, troop.level)
      end
    end
  end

  defp calc_total_cost(type, troop_type, number_of_troops, level_of_troop) do
    number_of_troops * cost_for(type, troop_type, level_of_troop)
  end

  defp cost_for(:spell, type, level) do
    case type do
      "lightning" ->
        lookup = %{"1": 15_000, "2": 16_500, "3": 18_000, "4": 20_000, "5": 22_000, "6": 24_000}
      "healing" ->
        lookup = %{"1": 15_000, "2": 16_500, "3": 18_000, "4": 20_000, "5": 22_000, "6": 24_000}
      "rage" ->
        lookup = %{"1": 23_000, "2": 25_000, "3": 27_000, "4": 30_000, "5": 33_000}
      "jump" ->
        lookup = %{"1": 23_000, "2": 27_000, "3": 31_000}
      "freeze" ->
        lookup = %{"1": 26_000, "2": 29_000, "3": 31_000, "4": 33_000, "5": 35_000}
    end

    Map.get(lookup, :"#{level}")
  end

  defp cost_for(:elixir_troop, type, level) do
    case type do
      "archer" ->
        lookup = %{"1": 50, "2": 80, "3": 120, "4": 160, "5": 200, "6": 300, "7": 400}
      "barb" ->
        lookup = %{"1": 25, "2": 40, "3": 60, "4": 80, "5": 100, "6": 150, "7": 200}
      "goblin" ->
        lookup = %{"1": 25, "2": 40, "3": 60, "4": 80, "5": 100, "6": 150}
      "giant" ->
        lookup = %{"1": 250, "2": 750, "3": 1_250, "4": 1_750, "5": 2_250, "6": 3_000, "7": 3_500}
      "wb" ->
        lookup = %{"1": 1_000, "2": 1_500, "3": 2_000, "4": 2_500, "5": 3_000, "6": 3_500}
      "balloon" ->
        lookup = %{"1": 2_000, "2": 2_500, "3": 3_000, "4": 3_500, "5": 4_000, "6": 4_500}
      "wiz" ->
        lookup = %{"1": 1_500, "2": 2_000, "3": 2_500, "4": 3_000, "5": 3_500, "6": 4_000}
      "healer" ->
        lookup = %{"1": 5_000, "2": 6_000, "3": 8_000, "4": 10_000}
      "dragon" ->
        lookup = %{"1": 25_000, "2": 30_000, "3": 36_000, "4": 42_000}
      "pekka" ->
        lookup = %{"1": 30_000, "2": 35_000, "3": 40_000, "4": 45_000, "5": 5_000}
    end

    Map.get(lookup, :"#{level}")
  end
end
