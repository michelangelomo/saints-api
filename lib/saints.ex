defmodule Saints do
  @moduledoc false

  @cache :saints_cache
  @cache_key "saints"

  def parse do
    "#{File.cwd!()}/saints.ics"
    |> File.read!()
    |> ExIcal.parse()
    |> convert()
  end

  defp convert(saints) do
    Enum.reduce(saints, [], fn x, acc ->
      [%{x | __struct__: Saints.Event} | acc]
    end)
  end

  def parse_and_cache do
    Cachex.put!(
      @cache,
      @cache_key,
      parse(),
      ttl: :timer.hours(24)
    )
  end

  def today(limit \\ 1) do
    case Cachex.get(@cache, @cache_key) do
      {:ok, nil} ->
        parse_and_cache()
        today()

      {:error, :no_cache} ->
        parse_and_cache()
        today()

      {:ok, saints} ->
        {{year, month, day}, _} = :calendar.universal_time()
        now = Date.new!(year, month, day)

        saints
        |> ExIcal.by_range(now, now)
        |> Enum.take(limit)
    end
  end

  def random do
    case Cachex.get(@cache, @cache_key) do
      {:ok, nil} ->
        parse_and_cache()
        random()

      {:error, :no_cache} ->
        parse_and_cache()
        random()

      {:ok, saints} ->
        {{year, _, _}, _} = :calendar.universal_time()
        now = Date.new!(year, Enum.random(1..12), Enum.random(1..30))

        saints
        |> ExIcal.by_range(now, now)
        |> List.first()
    end
  end
end
