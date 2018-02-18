module ApplicationHelper
    def bootstrap_msg type
        result = case type
            when 'notice' then 'success'
            when 'alert' then 'warning'
            when 'danger' then 'danger'
            else 'info'
            end
    end 
end
