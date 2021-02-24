module ApplicationHelper
    def bootstrap_class_for_flash(type)
        case type
          when 'success' then "alert-info"
          when 'notice' then "alert-success"
          when 'alert' then "alert-danger"
          when 'error' then "alert-warning"
        end
      end
end
