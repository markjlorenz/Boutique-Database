module FindOrCreateHelper
  # makes a string like: {"key":1, "value":"Elena"}
  def source_hash_from_objects objects
    objects.map { |e| 
      '{"key":' + e.id.to_s + ', "value":"'+ e.name + '"}'
    }.join(',').html_safe
  end
end
