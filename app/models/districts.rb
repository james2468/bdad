class Districts

  def self.paths
    return @s if @s
    features = Bdad::Application.config.data[:districts]['features']
    @s = ''
    features.each do |key, value|
      @s << value['paths'].join('')
    end
    @s
  end

end
