class Cuba
  def content_for(key, &block)
    if block
      @_content_for ||= {}
      buf_was = @haml_buffer.buffer
      @haml_buffer.buffer = ''
      yield
      @_content_for[key] = @haml_buffer.buffer
      @haml_buffer.buffer = buf_was
    elsif @_content_for
      @_content_for[key]
    end
  end
end