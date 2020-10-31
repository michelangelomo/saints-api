FROM bitwalker/alpine-elixir:latest

RUN mix local.hex --force && \
  mix local.rebar --force

WORKDIR /app

COPY . /app

RUN export MIX_ENV=prod && \
    rm -Rf _build && \
    mix deps.get && \
    mix release

EXPOSE 8080

CMD ["_build/prod/rel/saints/bin/saints", "start"]