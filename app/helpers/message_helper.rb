module MessageHelper
  def self.check_message(s)
    result = true
    if s.count('(') != s.count(')')
      s.gsub!(':)', '')
      s.gsub!(':(', '')
    end
    while result == true && s.length.positive?
      pre_open = s.reverse =~ /[(]/ # buscamos ultimo (
      open = !pre_open.nil? ? s.length - 1 - pre_open : nil
      close = s =~ /[)]/ # buscamos primero )
      if !close.nil? && !open.nil? && (open < close)
        snew = s[open + 1..close - 1]
        snew.gsub!(':)', '')
        snew.gsub!(':(', '')
        snew.gsub!(/[a-z :]/, '')
        if snew.length.positive?
          result = false
        else
          s.gsub!(s[open..close], '')
        end
      else
        result = false
      end
    end
    if s.length.positive?
      s.gsub!(':)', '')
      s.gsub!(':(', '')
      s.gsub!(/[a-z :]/, '')
      s.gsub!('()', '')
      result = s.length.positive? ? false : true
    end
    result
  end
end
