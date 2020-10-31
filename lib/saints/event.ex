defmodule Saints.Event do
  @moduledoc false
  @derive {Jason.Encoder, only: [:summary, :start, :end]}
  defstruct start: nil,
            end: nil,
            stamp: nil,
            description: nil,
            summary: nil,
            rrule: nil,
            categories: nil,
            uid: nil
end
