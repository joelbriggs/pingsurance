class Lead < ApplicationRecord

    def display_full_name
        self.first_name << ' ' << self.last_name
    end

end