class LogSerializer
  def self.serialize(log)
    serialized_log = '{'

    serialized_log += '"id": ' + log.id.to_s + ','
    serialized_log += '"tools": "' + log.tools + '", '
    
    serialized_log += '}'
  end

end