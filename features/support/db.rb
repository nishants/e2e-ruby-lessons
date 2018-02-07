class Database

  def initialize(config)
    @db_passowrd = config.password
    @db_params = "-d #{config.database} -U #{config.username} -h #{config.host} -p #{config.port}"
    @dump_file = config.dump_file
    create_config_file(config)
  end

  def create_config_file(config)
    path = "#{ENV['HOME']}/.pgpass"
    data = "#{config.host}:#{config.port}:#{config.database}:#{config.username}:#{config.password}"
    File.open(path, "w") { |file| file.write(data) }
    File.chmod(0600,path)
  end

  def restore
    system "psql #{@db_params}  -a -q -f  #{@dump_file}"
  end

  def dump(path)
    system "pg_dump --format=tar #{@db_params} > #{path}"
  end

end