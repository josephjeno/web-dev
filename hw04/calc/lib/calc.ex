defmodule Calc do

  def main do
    exp = IO.gets("Enter arithmetic expression to evaluate:  ")
    IO.puts(eval(exp))
    main()
  end

  def eval(exp) do
    Code.eval_string(exp) 
    |> elem(0)
  end 

end