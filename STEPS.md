# Steps

1. Create new application with `mix new silesian_beamers_survey` do a clean-up.
2. Adding `gen_smtp` as a dependency, add `:ssl` to applications.
3. Get dependencies `mix deps.get` and invoke `iex -S mix`.
4. Configure `escript` and create CLI module, and build scripts `mix escript.build`.
5. Create email sending helper which uses environment variable for passing password.
