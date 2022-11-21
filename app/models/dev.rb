class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.feebies.where(item_name: item_name).exists?
    end

    def give_away(dev, freebie)
        if self.id == freebie.dev.id
            return freebie.update(dev: dev)
        else
            return "Do Not Give What Is Not Yours"
        end
    end

end
