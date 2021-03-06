# https://wiki.haskell.org/99_questions/1_to_10

defmodule Solve do
    def one([]) do
        nil
    end

    def one([h|[]]) do
        h
    end

    def one([_|t]) do
        one(t)
    end

    def two([]) do
        nil
    end

    def two([_|[]]) do
        nil
    end

    def two ([e,_|[]]) do
        e
    end

    def two([_|t]) do
        two(t)
    end

    def three([], _) do
        nil
    end

    def three(_, 0) do
        nil
    end

    def three([e|_], 1) do
        e
    end

    def three([_|t], n) do
        three(t, n - 1)
    end

    def four([]) do
        0
    end

    def four([_|[]]) do
        1
    end

    def four([_|t]) do
        1 + four(t)
    end

    def five([]) do
        []
    end

    def five([h|t]) do
        five(t, [h])
    end

    def five([], rev) do
        rev
    end

    def five([h|t], rev) do
        five(t, [h] ++ rev)
    end

    def six(l) do
        l == five(l)
    end

    def seven([]) do
        []
    end

    def seven([h|t]) when is_list(h) do
        seven(h) ++ seven(t)
    end

    def seven([h|t]) do
        [h] ++ seven(t)
    end

    def eight([]) do
        []
    end

    def eight([h|t]) do
        eight(t, [h])
    end

    def eight([], deduped) do
        five(deduped)
    end

    def eight([h|t], [dh|_] = deduped) when h == dh do
        eight(t, deduped)
    end

    def eight([h|t], deduped) do
        eight(t, [h] ++ deduped)
    end

    def nine([]) do
        []
    end

    def nine([h|t]) do
        nine(t, [[h]])
    end

    def nine([], encoded) do
        five(encoded)
    end

    def nine([h|t], [eh|et] = encoded) do
        case Enum.member?(eh, h) do
            true -> nine(t, [[h] ++ eh|et])
            _ -> nine(t, [[h]] ++ encoded)
        end
    end

    def ten([]) do
        []
    end

    def ten(l) do
        nine(l)
        |> Enum.map(&{List.first(&1), Enum.count(&1)})
    end
end
