defmodule Memory.Game do
  def new do
    %{
      letterArray: shuffle_letters(),
      lettersSelected: [],
      squaresSelected: [],
      clicks: 0,
      boxFlipped: [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
      boxMatched: [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
      }
  end

 def shuffle_letters do
    Enum.shuffle(["A", "A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "G", "G", "H", "H"])
  end
 
  def click(game, number) do
     if length(game.lettersSelected) < 2 do
       flip_card(game, number, Enum.at(game.letterArray, number))     
     end
  end

  def match(game) do   
     if length(game.lettersSelected) == 2 do
       if List.first(game.lettersSelected) == List.last(game.lettersSelected) do
         game = match_squares(game)
       else 
         game = unmatch_squares(game)
       end
    end
     game
  end
  
  def flip_card(game, square, letter) do
    %{
      letterArray: game.letterArray,
      lettersSelected: game.lettersSelected ++ [letter],
      squaresSelected: game.squaresSelected ++ [square],
      clicks: game.clicks + 1,
      boxFlipped: List.replace_at(game.boxFlipped, square, true),
      boxMatched: game.boxMatched
      }
  end

  def match_squares(game) do
    boxOne = List.first(game.squaresSelected)
    boxTwo = List.last(game.squaresSelected)
    bm = game.boxMatched
    bm = List.replace_at(bm, boxOne, true)
    bm = List.replace_at(bm, boxTwo, true)
    %{
      letterArray: game.letterArray,
      lettersSelected: [],
      squaresSelected: [],
      clicks: game.clicks,
      boxFlipped: game.boxFlipped,
      boxMatched: bm
      }
  end

  def unmatch_squares(game) do
    boxOne = List.first(game.squaresSelected)
    boxTwo = List.last(game.squaresSelected)
    bf = game.boxFlipped
    bf = List.replace_at(bf, boxOne, false)
    bf = List.replace_at(bf, boxTwo, false)
    %{
      letterArray: game.letterArray,
      lettersSelected: [],
      squaresSelected: [],
      clicks: game.clicks,
      boxFlipped: bf,
      boxMatched: game.boxMatched
      } 
  end

end

