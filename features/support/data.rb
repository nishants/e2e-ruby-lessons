class DataSuite

  def initialize(path)
    @path = path
  end

  def load(feature_path, scenario_name)
    file = "#{@path}/#{feature_path}.feature.yml"
    return Hash.new unless File.exist?(file)
    data = YAML.load_file(file)
    data[scenario_name] unless (data == false)
  end
end