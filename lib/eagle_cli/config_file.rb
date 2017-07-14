require 'yaml'
require 'fileutils'
require 'byebug'

module EagleCli
  class ConfigFile

    def initialize
      ensure_config_file
    end

    def self.read(profile_name = "default")
      new.read(profile_name)
    end

    def self.write(config)
      new.write(config)
    end

    def read(profile_name = "default")
      config = YAML.load_file(path)
      config.fetch(profile_name, {})
    end

    def write(config, overwrite = false)
      content = overwrite ? {} : YAML.load_file(path)

      File.open(path, 'w+') do |f|
        f.write(content.merge(config).to_yaml)
      end
    end

    def directory
      File.join(Dir.home, '.eagle_cli')
    end

    def path
      File.join(directory, 'config.yml')
    end

    private

    def ensure_config_file
      ensure_config_dir
      unless File.exist?(path)
        write(EagleCli::Config.default.serialize, true)
      end
    end

    def ensure_config_dir
      unless File.directory?(directory)
        FileUtils.mkdir_p(directory)
      end
    end
  end
end
