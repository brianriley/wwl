class ValidationError < Exception
end

class Validator
  def clean(raw_input)
    input = raw_input.downcase

    if input =~ /[^a-z]/
      raise ValidationError
    end

    input
  end
end
