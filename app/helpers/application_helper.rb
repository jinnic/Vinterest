module ApplicationHelper
  def flash_class(level)
    case level
        when "notice" 
          "alert alert-info fade show"
        when "success"
          "alert alert-success fade show"
        when "error"
          "alert alert-error fade show"
        when "alert"
          "alert alert-error "
    end
  end

  
end
