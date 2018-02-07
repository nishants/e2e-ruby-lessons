Before do
  data_dir = FigNewton.data.send(ENV["data_suite"])
  @data_suite    = DataSuite.new(data_dir)
  users_file = FigNewton.users.send(ENV["users"])
  @users   = Users.new(YAML.load_file(users_file))
  client = FigNewton.clients.send(ENV["client"])

  @browser = Drivers.get(client)
  @db = Database.new(FigNewton.db)
  ($db_reset = true && @db.restore) unless $db_reset
end

After do
  @browser.close
end


Before do |scenario|
  feature_path   = scenario.feature.all_locations.first.to_s.split("features/")[1].split(":").first.strip.split(".feature").first.strip
  @data = @data_suite.load(feature_path, scenario.name)
  @scenario_tags  = scenario.source_tag_names
end

Before('@cleandb') do
  @db.restore
end