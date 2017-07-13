require 'values'

module EdlCli
  class Config < Value.new(:name, :url, :id, :secret)

    def self.default
      new('default','', '', '')
    end

    def self.load(profile_name)
      persisted = EdlCli::ConfigFile.read(profile_name)
      if persisted.empty?
        new(profile_name, '', '', '')
      else
        with({name: profile_name}.merge(persisted))
      end
    end

    def save
      EdlCli::ConfigFile.write(self.serialize)
    end

    def valid?
      self.to_h.all? {|key,val| !val.empty? }
    end

    def serialize
      {"#{name}" => {url: url, id: id, secret: secret} }
    end
  end
end
