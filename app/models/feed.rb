class Feed < ActiveRecord::Base
    before_save :check_trailing_slash

    def check_trailing_slash
      (name[-1,1] != '/') ? (name) : (remove_trailing_slash)
    end

    def remove_trailing_slash
      self.name = name.chop
      name[-1,1] == '/' ? remove_trailing_slash : self.name
    end
end
