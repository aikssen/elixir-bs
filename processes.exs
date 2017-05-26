
# * Scalability   (processes)
# * Fault-tolerance  (supervisors)
# * Erlang compatible
# * Hot code update

# * Functional programming
# * Extensible (macros)
# * Tooling - Mix   (build tool)
# * manage dependencies  -  HEX
# * Ecto


current_process = self()

# Spawn an Elixir process (not an operating system one!)
spawn_link(fn ->
  send current_process, {:msg, "hello world"}
end)

# Block until the message is received
receive do
  {:msg, contents} -> IO.puts contents
end


# DATA TYPES

iex> 1          # integer
iex> 0x1F       # integer
iex> 1.0        # float
iex> true       # boolean
iex> :atom      # atom / symbol
iex> "elixir"   # string
iex> [1, 2, 3]  # list
iex> {1, 2, 3}  # tuple




# FUNCTIONS
# Functions in Elixir are identified by both their name and their arity (number of arguments)
# round/1, round/2





# ATOMS  (symbols)
# constants where their name is their own value


# STRINGS
# "hellö #{:world}"
iex> "foo" <> "bar"
"foobar"


# Anonymous functions
# they are clousures
add = fn a, b -> a + b end
add.(10, 20)

# number of arguments must be the same on guards (matching)
f  = fn 
  x, y when x > 0 -> x + y # guard
  x, y -> x * y
end



# LISTS
# lists have a head and a tails
[1, 2, 3, true] ++ [4]

list = [1, 2, 3]
hd(list) # 1
tl(list) # [2, 3]


# TUPLES
tuple = { :ok, "hello" }
elem(tuple, 1)
put_elem(tuple, 1, "world")

iex> File.read("path/to/existing/file")
{:ok, "... contents ..."}
iex> File.read("path/to/unknown/file")
{:error, :enoent}






# Pattern matching
# useful for destructuring
iex> {a, b, c} = {:hello, "world", 42}
{:hello, "world", 42}
iex> a
:hello
iex> b
"world"

# we can match on specific values, 
iex> {:ok, result} = {:ok, 13}
{:ok, 13}
iex> result
13

iex> {:ok, result} = {:error, :oops}
** (MatchError) no match of right hand side value: {:error, :oops}

# match on lists

[ head | tail ] = [1,2,3,4,5]

list = [1,2,3]
[0 | list]





# pin operator
# variables can be rebound
# patter matching stead of assignment*
^x = 1

# ignore a value in patter matching
[head | _] = 




# CASE
# allows to compare a value against many patterns until find a mathching one
# useful to match against different values
case {1,2,3} do
  {4,5,6} -> 
    "no match"
  {1,x,3} -> 
    "match"
  _ ->
    "match all"
end



case {1,2,3} do
  {1,x,3} when x > 0 ->  # guard
    "only positive values"
  _ ->
    "match"
end


# COND
# check different conditions
 cond do  # else if
  2 + 2 == 5 ->
    "some"
  2 + 3 == 5 ->
    "match"
  true ->  # else
    "yeah"
 end




 # IF UNLESS
 # macro to check only for one condition
if true do
  "yeees"
end

if true, do: 1 + 2
# 3
if false, do: :this, else: :that
# :that



 unless true do
   "nope, never seen"
 end



# KEYWORD LISTS
# no so common to use
# only atoms as keys
list = [a: 1, b: 2]
list ++ [c: 3]



# ecto
query = from w in Weather,
      where: w.prcp > 0,
      where: w.temp < 20,
     select: w



# MAPS
# associative data strutucures
# any kind of type as key
map = %{:a => 1, 2 => :b}
map[:a]
map[2]
map[:c] # nil


# update a value
map = %{:a => 1, 2 => :b}
%{map | 2 => "two"}    #  { ...some, a: 2 } in js


# when all the keys are atoms, it could be written in this way:
map = %{a: 1, b: 1}
map.a  # 1



users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Elixir", "Ruby"] },
  mary: %{name: "Mary", age: 30, languages: ["Elixir", "F#", "cloujure"]}
]

users[:john].age

# update a value
users = put_in users[:john].age, 31
users = update_in users[:mary].languages, fn languages -> List.delete(languages, "cloujure") end






# MODULES AND FUNCTIONS

# file math.ex
defmodule Math do
  def sum(a, b) do
    a + b
  end
end

Math.sum(2, 3)


# compile the file:
# $ elixirc math.ex
# this generates a file Elixir.Math.beam   as binary
# in the same directory start $ iex
# Math.sum(2, 3) will be available




# PROJECT ORGANIZATION
# /ebin    contains compiled bytcode
# /lib     contains elixir code, usually  .ex  (for compilation, generate .beam files)
# /test    contains tests  usually .exs  (for scripts)