#!/usr/bin/env elixir

defmodule RouteDistance do

    def solve(input) do
        open_file(input)
        |> Enum.map(&(create_tuple(&1)))
        |> create_map
        |> floyd_warshall
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "\n", trim: true)
    end

    defp create_tuple(str) do
        [origin|rest] = String.split(str, " to ", trim: true)
        [destination|distance] = String.split(Enum.at(rest,0), " = ", trim: true)
        {origin, destination, String.to_integer(Enum.at(distance,0))}
    end

    defp create_map(lst) do
        create_map(lst, %{}, [])
    end

    defp create_map([], hash_map, locations) do
        {locations, hash_map}
    end

    defp create_map([h|t], hash_map, locations) do
        {origin, destination, distance} = h
        new_map = case Map.get(hash_map, origin) do
            nil -> Map.put(hash_map, origin, %{ destination => distance })
            _ -> Map.put(hash_map, origin, Map.put(hash_map[origin], destination, distance))
        end
        result_map = case Map.get(new_map, destination) do
            nil -> Map.put(new_map, destination, %{ origin => distance })
            _ -> Map.put(new_map, destination, Map.put(new_map[destination], origin, distance))
        end
        locations_with_origin = case Enum.member?(locations, origin) do
            false -> Enum.concat(locations, [origin])
            _ -> locations
        end
        locations_with_destination = case Enum.member?(locations_with_origin, destination) do
            false -> Enum.concat(locations_with_origin, [destination])
            _ -> locations_with_origin
        end
        create_map(t, result_map, locations_with_destination)
    end

    # Floyd-Warshall pseudocode:

    """
    for k = 1 to N
       for i = 1 to N
          for j = 1 to N
             dist[k][i][j] = min(dist[k-1][i][j], dist[k-1][i][k] + dist[k-1][k][j])
    """

    """
    for i = 1 to N
       for j = 1 to N
          if there is an edge from i to j
             dist[0][i][j] = the length of the edge from i to j
          else
             dist[0][i][j] = INFINITY
    """

    defp floyd_warshall({locations, hash_map}) do
        pairs = Enum.filter((for i <- locations, j <- locations, do: {i,j}), fn {x,y} -> x != y end)
        floyd_warshall(pairs, hash_map, %{0 => {}})
    end

    defp floyd_warshall([], _, dist) do
        dist
    end

    defp floyd_warshall([h|t], hash_map, dist) do
        new_dist = case Map.get(hash_map[elem(h, 0)], elem(h,1)) do
            nil -> Map.put(dist[0], elem(h, 0), %{ elem(h,1) => 9999})
            _ -> Map.put(dist[0], elem(h, 0), %{ elem(h,1) => 1234})
        end
        floyd_warshall(t, hash_map, new_dist)
    end

end

RouteDistance.solve("advent_day_9_test_input.txt")
|> IO.inspect
