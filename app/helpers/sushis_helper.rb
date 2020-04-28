module SushisHelper
    def created(sushi)
        sushi.created_at.strftime("%m-%e-%y %H:%M")
    end
end