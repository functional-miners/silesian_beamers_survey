# Steps

## Doing

1. Create new application by:
  - `mix new silesian_beamers_survey`
2. Project structure:
  - What is `mix.exs`?
  - How to add a dependency?
  - Where and how to search dependencies? `mix hex.*` commands.
  - Describe directories structure a little bit.
  - What is inside `priv` directory.
3. Explain how the distribution work in Erlang.
  - What is a cluster?
  - Fully connected mesh designed to build clusters with at most dozens of nodes, after that network traffic is too problematic.
  - What is a node? What is node `--name`?
  - What is an Erlang cookie?
4. Focus on explaining `SilesianBeamersSurvey.QuestionServer.load_questions/{0,1}` functions.
  - Pipe operator.
  - Data transformation.
  - Reading a file, working with paths, `Enum` protocol.
5. Describe what an `Agent` is and why it is used there.
  - Do not focus on hard details related with *OTP* and *Processes*.

## Running

1. `iex -S mix`
  - Remember about setting `--name` and the same cookie for everyone.
2. `:application.ensure_all_started :silesian_beamers_survey`
3. `SilesianBeamersSurvey.Aggregator.start_link`
4. `SilesianBeamersSurvey.QuestionServer.start_link`
5. Each participant should invoke `SilesianBeamersSurvey.run "pazdziernik2015"`
6. `SilesianBeamersSurvey.Aggregator.dump` for saving answers in the `./priv/dump.json`.
