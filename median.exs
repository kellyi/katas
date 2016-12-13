defmodule Median do

    def find([h1|t1], [h2|t2]) do
        case h1 < h2 do
             true -> find(t1, [h2|t2], [h1])
             _ -> find([h1|t1], t2, [h2])
        end
    end

    def find(l, []) do
        med(l)
    end

    def find([], l) do
        med(l)
    end

    defp find([], [], result_list) do
        med(result_list)
    end

    defp find([], [h|t], result_list) do
        find([], t, [h|result_list])
    end
    
    defp find([h|t], [], result_list) do
        find(t, [], [h|result_list])
    end

    defp find([h1|t1], [h2|t2], result_list) when h1 < h2 do
        find(t1, [h2|t2], [h1|result_list])
    end

    defp find(l, [h2|t2], result_list) do
        find(l, t2, [h2|result_list])
    end

    def med(l) do
        case rem(Enum.count(l), 2) == 1  do
            true -> Enum.at(l, div(Enum.count(l), 2))
            _ -> ((Enum.at(l, div(Enum.count(l), 2))) + Enum.at(l, div(Enum.count(l) - 1, 2))) / 2
        end
    end
end