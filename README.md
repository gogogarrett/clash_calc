# ClashCalc

Very basic clash of clan profit calculator.

## Usage

This takes a value representing the amount of elixir collected, and a list of maps containing a `troop`, `level`, and `number` key/value.

Example data set:

```elixir
troops = [
  %{ troop: "archer", level: 6, number: 102 },
  %{ troop: "barb", level: 6, number: 63 },
  %{ troop: "giant", level: 6, number: 11 }
]
```

### Running the script

```elixir
$ mix run -e 'ClashCalc.profit?(100_000, [%{ troop: "archer", level: 6, number: 102 }, %{ troop: "barb", level: 6, number: 63 }, %{ troop: "giant", level: 6, number: 11 }])'
Total troops cost: 73050
Total elixir collected: 100000
Profit: true
```

## TODO:
- [ ] Take into account spells
- [ ] Take into dark elixir troops
- [ ] Import from a file to generate a report of raids
