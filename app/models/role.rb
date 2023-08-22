class Audition < ActiveRecord::Base
    has_many :auditions

    def auditions 
        auditions.all
    end

    def actors
        auditions.map{ |a| a.actor}
    end

    def locations
        auditions.map{ |a| a.locations}
    end

    def lead
        auditions.find_by(hired: true) || 'no actor has been hired for this role'
    end

    def understudy
        auditions.where(hired: true).second || 'no actor has been hired for understudy for this role'
    end



end
