class Task
    attr_accessor :title, :description, :status, :created_at

    def initialize(title, description, status="incomplete")
        @title = title
        @description = description
        @status = status
        @created_at = Time.now
    end

    def mark_as_complete!
      @status = "complete"
    end

    def mark_as_incomplete!
      @status = "incomplete"
    end

    def complete?
      if @status == "complete"
        return true
      else
        return false
      end
    end
end
