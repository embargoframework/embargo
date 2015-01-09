#################
# Blank
#################
class Object
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end
end

#################
# Humanize
#################
class String
  def humanize
    sub(/\A_+/, '')
      .tr('_', ' ')
      .sub(/\A\w/) { |match| match.upcase }
  end
end

class Symbol
  def humanize
    to_s.humanize
  end
end