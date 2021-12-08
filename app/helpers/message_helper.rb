module MessageHelper
  def self.check_message(s)
    result = true
    s = clear_from_smiles(s)
    while result == true && s.length.positive?
      pre_open = s.reverse =~ /[(]/ # buscamos ultimo (
      open = !pre_open.nil? ? s.length - 1 - pre_open : nil

      # buscamos ) que esta mas cerca para (
      close = !open.nil? ? find_first_close(open, s) : nil
      if !open.nil? && !close.nil?
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

  def self.clear_from_smiles(line)
    has_variant = true
    while (line.count('(') != line.count(')')) && line.length.positive? && has_variant
      line.count('(') > line.count(')') ? line.sub!(':(', '') : line.sub!(':)', '')
      has_variant = false unless line.include?(':(' || ':)')
    end
    line
  end

  def self.find_first_close(open, line)
    close = nil
    j = open + 1
    while j <= line.length && close.nil?
      close = j if line[j] == ')'
      j += 1
    end
    close
  end
end
