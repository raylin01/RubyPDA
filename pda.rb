class Pda
  PDA={"EMPTY"=>{"0"=>["NUM","0",""],"1"=>["NUM","1",""],"2"=>["NUM","2",""],"3"=>["NUM","3",""],"4"=>["NUM","4",""],"5"=>["NUM","5",""],"6"=>["NUM","6",""],"7"=>["NUM","7",""],"8"=>["NUM","8",""],"9"=>["NUM","9",""]},
       "NUM"=>{"+"=>["+","","+"],"-"=>["-","","-"],"*"=>["*","","*"],"/"=>["/","","/"],"("=>["(","",""],")"=>[")","",""]},
       "+"=>{"+"=>["+","POP","+"],"-"=>["-","POP","-"],"*"=>["*","","*"],"/"=>["/","","/"],"("=>["(","","("],")"=>[")","",""],"0"=>["+","0",""],"1"=>["+","1",""],"2"=>["+","2",""],"3"=>["+","3",""],"4"=>["+","4",""],"5"=>["+","5",""],"6"=>["+","6",""],"7"=>["+","7",""],"8"=>["+","8",""],"9"=>["+","9",""]},
       "-"=>{"+"=>["+","POP","+"],"-"=>["-","POP","-"],"*"=>["*","","*"],"/"=>["/","","/"],"("=>["(","","("],")"=>[")","",""],"0"=>["-","0",""],"1"=>["-","1",""],"2"=>["-","2",""],"3"=>["-","3",""],"4"=>["-","4",""],"5"=>["-","5",""],"6"=>["-","6",""],"7"=>["-","7",""],"8"=>["-","8",""],"9"=>["-","9",""]},
       "*"=>{"+"=>["+","POP","+"],"-"=>["-","POP","-"],"*"=>["*","POP","*"],"/"=>["/","POP","/"],"("=>["(","","("],")"=>[")","",""],"0"=>["*","0",""],"1"=>["*","1",""],"2"=>["*","2",""],"3"=>["*","3",""],"4"=>["*","4",""],"5"=>["*","5",""],"6"=>["*","6",""],"7"=>["*","7",""],"8"=>["*","8",""],"9"=>["*","9",""]},
       "/"=>{"+"=>["+","POP","+"],"-"=>["-","POP","-"],"*"=>["*","POP","*"],"/"=>["/","POP","/"],"("=>["(","","("],")"=>[")","",""],"0"=>["/","0",""],"1"=>["/","1",""],"2"=>["/","2",""],"3"=>["/","3",""],"4"=>["/","4",""],"5"=>["/","5",""],"6"=>["/","6",""],"7"=>["/","7",""],"8"=>["/","8",""],"9"=>["/","9",""]},
       "("=>{"+"=>["+","POP","+"],"-"=>["-","POP","-"],"*"=>["*","POP","*"],"/"=>["/","POP","/"],"("=>["(","","("],")"=>[")","POP",""],"0"=>["(","0",""],"1"=>["(","1",""],"2"=>["(","2",""],"3"=>["(","3",""],"4"=>["(","4",""],"5"=>["(","5",""],"6"=>["(","6",""],"7"=>["(","7",""],"8"=>["(","8",""],"9"=>["(","9",""]},
       ")"=>{"+"=>["+","POP","+"],"-"=>["-","POP","-"],"*"=>["*","POP","*"],"/"=>["/","POP","/"],"("=>["(","POP","("],")"=>[")","POP",""],"0"=>[")","0",""],"1"=>[")","1",""],"2"=>[")","2",""],"3"=>[")","3",""],"4"=>[")","4",""],"5"=>[")","5",""],"6"=>[")","6",""],"7"=>[")","7",""],"8"=>[")","8",""],"9"=>[")","9",""]}}
  state = "EMPTY"
  stack = []
  postfix = ""
  print("Enter the equation:")
  string = gets.chomp
  while string.length>0
    curchar = string[0]
    if curchar=="+"
      if(PDA[state][curchar][1]=="POP")
        while(stack.size>0)
          postfix +=stack.pop
          postfix +=" "
        end
      else
        postfix += PDA[state][curchar][1]
      end
      if(PDA[state][curchar][2]!="")
          stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    elsif curchar=="-"
      if(PDA[state][curchar][1]=="POP")
        while(stack.size>0)
          postfix +=stack.pop
          postfix +=" "
        end
      else
        postfix += PDA[state][curchar][1]
      end
      postfix += PDA[state][curchar][1]
      if(PDA[state][curchar][2]!="")
        stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    elsif curchar == "*"
      if(PDA[state][curchar][1]=="POP")
        while(stack.size>0)
          postfix +=stack.pop
          postfix +=" "
        end
      else
        postfix += PDA[state][curchar][1]
      end
      if(PDA[state][curchar][2]!="")
        stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    elsif curchar =="/"
      if(PDA[state][curchar][1]=="POP")
        while(stack.size>0)
          postfix +=stack.pop
          postfix +=" "
        end
      else
        postfix += PDA[state][curchar][1]
      end
      postfix += PDA[state][curchar][1]
      if(PDA[state][curchar][2]!="")
        stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    elsif curchar =="("
      if(PDA[state][curchar][1]=="POP")
        while(stack.size>0)
          char = stack.pop
          if char!=")" || char!="("
            postfix += char
            postfix +=" "
          end
        end
      else
        postfix += PDA[state][curchar][1]
      end
      postfix += PDA[state][curchar][1]
      if(PDA[state][curchar][2]!="")
        stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    elsif curchar ==")"
      if(PDA[state][curchar][1]=="POP")
        while(stack.size>0)
          postfix +=stack.pop
          postfix +=" "
        end
      else
        postfix += PDA[state][curchar][1]
      end
      postfix += PDA[state][curchar][1]
      if(PDA[state][curchar][2]!="")
        stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    else
      postfix += PDA[state][curchar][1]
      postfix +=" "
      if(PDA[state][curchar][2]!="")
        stack << PDA[state][curchar][2]
      end
      state = PDA[state][curchar][0]
    end

    string = string[1..string.length]
  end
  while(stack.size>0)
    postfix +=stack.pop
    postfix +=" "
  end
  print(postfix)
  # Postfix Evaluator

end