class State < ApplicationRecord
    has_many :projects
    has_many :state_projects
    
    def self.MontoTotal(var1,var2)
        cantidad = var1.count
        var3 = 0
        while cantidad > 0
            if var1[cantidad - 1].State_id == var2 && var1[cantidad - 1].State_id != 2
                var3 += var1[cantidad - 1].monto
            end  
            cantidad -= 1
        end
        var3
    end

end
