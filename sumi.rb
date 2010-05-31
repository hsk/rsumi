class Parser 
  def initialize
    @infixs = {"*"=>20,"+"=>10}
  end
  def parse(src)
    @tokens = src.split(/[\s]*([0-9]+|[+\-\/*])/).reject!{|x| x==""}
    exp(0)
  end
  def exp(p)
    t = @tokens.shift
    while  (p1 = @infixs[@tokens[0]]) != nil
      if p1 <= p
        break
      end
      op = @tokens.shift
      t = [t, op, exp(p1)]
    end
    t
  end
end

p Parser.new.parse("1  +2*3*4+5+6*7")
